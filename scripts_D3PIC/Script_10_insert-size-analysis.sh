#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_10_Insert size distribution analysis
# Before to run, check the availability of picard in your system first
###########
# Create directory to save insert size distribution analysis results and log files
  mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/insert-size-distribution
  mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
  mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/insert-size-distribution

# Set bam file folder as working directory
  cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped

# for-loop to run picard.jar CollectInsertSizeMetrics
  for f in *.hg38.canonical.clean.sort.bam; do
    
    # Extract base filename without extension
    base=${f%%.hg38.canonical.clean.sort.bam}

    # Define file names and directory
    bam_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped
    input_bam="${base}.hg38.canonical.clean.sort.bam"

    output_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/insert-size-distribution
    output_matrics="${base}.hg38.insert.size.metrics.txt"
    output_histogram="${base}.hg38.insert.size.histogram.pdf"

    log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/insert-size-distribution
    log_file="insert-size-distribution_log_${base}.hg38.txt"

    # Set current working directory again
    cd $bam_dir

    # picard CollectInsertSizeMetrics
    (
      java -jar $PICARD/picard.jar CollectInsertSizeMetrics \
        I=$input_bam \
        O=$output_dir/$output_matrics \
        H=$output_dir/$output_histogram \
        M=0.5
    ) 2>$log_dir/$log_file
  done
