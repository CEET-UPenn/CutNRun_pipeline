#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_07_Filter and sort bam files
##########
# Make output directory to save log files
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/filter-sort-bam

# Set mapped bam file directory as current working directory
cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped

# for-loop to filter and sort bam files 
for f in *.hg38.bam; do
    
    # Extract base filename without extension
    base=${f%%.hg38.bam}

    # Set file names and directories
        # path of mapped reads bam files
        bam_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped

        # file names for filtration step
        sample="${base}.hg38.bam"
        canonical_sample="${base}.hg38.canonical.bam"
        non_canonical_sample="${base}.hg38.non-canonical.bam"
        canonical_wo_blacklist_sample="${base}.hg38.canonical.no-blacklist.bam"
        canonical_w_blacklist_sample="${base}.hg38.canonical.at-blacklist.bam"
        canonical_clean_sample="${base}.hg38.canonical.clean.bam"
        canonical_wo_blacklist_w_TArepeat="${base}.hg38.canonical.no-blacklist.at-TArepeat.bam"

        # file and directory names of bed files for filtration step
        blacklist_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/blacklist
        canonical_chrom="hg38.canonical.chrom.bed"
        blacklist="hg38-blacklist.v2.bed"
        TA_repeats="hg38_TA_repeat.bed"

        # file names for sorting step
        canonical_clean_sample_sort_by_query="${base}.hg38.canonical.clean.sortn.bam"
        canonical_clean_sample_sort_by_coordinate="${base}.hg38.canonical.clean.sort.bam"      
        spike_in="${base}.ecoli_K12_DH10B.bam"
        spike_in_sort_by_query="${base}.ecoli_K12_DH10B.sortn.bam"
        spike_in_sort_by_coordinate="${base}.ecoli_K12_DH10B.sort.bam"

        # file and directory names to log
        log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/filter-sort-bam
        log_file="filter-sort-bam-log_${base}.txt"

    # Set current working directory again
    cd $bam_dir

    # Run the filtration and sorting processes
    (
        # samtools to filter out non-canonical chromosome reads
        samtools view \
            -b -@ 8 \
            -L $blacklist_dir/$canonical_chrom \
            -U $non_canonical_sample \
            $sample \
            -o $canonical_sample
        
        # samtools to filter out blacklist reads
        samtools view \
            -b -@ 8 \
            -L $blacklist_dir/$blacklist \
            -U $canonical_wo_blacklist_sample \
            $canonical_sample \
            -o $canonical_w_blacklist_sample

        # samtools to filter out TA repeats
        samtools view \
            -b -@ 8 \
            -L $blacklist_dir/$TA_repeats \
            -U $canonical_clean_sample \
            $canonical_wo_blacklist_sample \
            -o $canonical_wo_blacklist_w_TArepeat

        # samtools to sort bam files by query
        samtools sort -n -@ 8 \
            $canonical_clean_sample \
            -o $canonical_clean_sample_sort_by_query

        samtools sort -n -@ 8 \
            $spike_in \
            -o $spike_in_sort_by_query

        # samtools to sort bam files by coordinate
        samtools sort -@ 8 \
            $canonical_clean_sample \
            -o $canonical_clean_sample_sort_by_coordinate
        
        samtools sort -@ 8 \
            $spike_in \
            -o $spike_in_sort_by_coordinate

        # index for bam files which are sorted by coordinate
        samtools index -@ 8 $canonical_clean_sample_sort_by_coordinate
        samtools index -@ 8 $spike_in_sort_by_coordinate
    ) 2>$log_dir/$log_file
done
