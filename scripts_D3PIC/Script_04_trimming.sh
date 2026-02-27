#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_04_Quality and adapter trimming using trim_galore
# Trim_galore reference
    # https://github.com/FelixKrueger/TrimGalore
    # https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/
##########
# Make output directory to save trimmed fastq files and log of trim_galore. You can change the paths to meet your requirement. 
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/trimmed
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/trim_galore

# Set "/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastq" as current working directory. You can change here to meet your requirement. 
cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastq

# for-loop to run trim_galore
for f in *_R1_001.fastq.gz; do

    # Extract base filename without extension
    base=${f%%_R1_001.fastq.gz}

    # Set directories and file names; you can change here to analyze your own dataset.
    fastq_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastq
    read1="${base}_R1_001.fastq.gz"
    read2="${base}_R2_001.fastq.gz"
    trimmed_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/trimmed     
    log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/trim_galore
    log_file="trim_galore_log_${base}.txt"
    
    # trim-galore
    (
        trim_galore \
            --paired --fastqc \
            -o $trimmed_dir \
            $fastq_dir/$read1 $fastq_dir/$read2
    ) 2>$log_dir/$log_file
done
