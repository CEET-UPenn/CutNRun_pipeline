#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_09_Make scaled fractional count bedGraph and bigWig files
# Normalization formula: {(raw readcount) / (total readcount)}*(whole genome size) 
###########
# Make output directory to save normalized bigWig and log files
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bigWig
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/SFRC

# Normalize hg38_canonical.bedGraph files for visualization
    # Setting bedGraph folder as working directory
    cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bedGraph

    # for-loop to normalize raw bedGraph files
    for f in *.hg38.canonical.clean.fragments.bedGraph; do
        
        # Extract base filename without extension
        base=${f%%.hg38.canonical.clean.fragments.bedGraph}

        # Set the file names and directories
        chrom_sizes_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/chrom-sizes
        chrom_sizes="hg38.canonical.chrom.sizes"

        bedGraph_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bedGraph
        raw_bedGraph="${base}.hg38.canonical.clean.fragments.bedGraph"
        SFRC_bedGraph="${base}.hg38.canonical.clean.fragments.SFRC.bedGraph"

        bigWig_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bigWig
        SFRC_bigWig="${base}.hg38.canonical.clean.fragments.SFRC.bw"
        log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/SFRC
        log_file="log_${base}.hg38.canonical.clean.fragments.SFRC.txt"

        # Set the current working directory again
        cd $bedGraph_dir
    
        # Calculate the total readcount of a hg38_canonical.bedGraph file
        total_readcount=$(awk '{print $4}' $raw_bedGraph | paste -sd+ - | bc)

        # Calculate the hg38 genome size for canonical chromosome only
        genome_size=$(awk '{print $2}' $chrom_sizes_dir/$chrom_sizes | paste -sd+ - | bc)

        # Calculate the normalization factor
        ratio=$(echo "scale=10; $genome_size / $total_readcount" | bc)

        (
            # Normalize the hg38_canonical.bedGraph file
            awk -v factor=$ratio 'BEGIN {OFS="\t"} { $4 *= factor; print }' \
                $raw_bedGraph \
                > $SFRC_bedGraph
            
            # Print values to terminal          
            printf "\nFile: %s\n" "$f"
            printf "Total readcounts: %d\n" "$total_readcount"
            printf "Canonical chromosome genome size: %d\n" "$genome_size"
            printf "Normalization factor: %.10f\n" "$ratio"

            # Create normalized bigWig file
            /project/voightlab_01/lorenzk/Archive/UCSC_Tools/bedGraphToBigWig $SFRC_bedGraph \
                $chrom_sizes_dir/$chrom_sizes \
                $bigWig_dir/$SFRC_bigWig
        ) > $log_dir/$log_file
    done

