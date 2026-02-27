#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_03_Initial quality check of sequencing files
# If you want to use Easy Shells CUTnRUN analysis pipeline to analyze dataset within your local drive, skip this script.
# FastQC references:
    # https://github.com/s-andrews/FastQC
    # https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
##########
# Make output directories to save initial QC results and log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastqc.1st
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/fastqc.1st

# Set fastq directory as working directory. you can change here to address the path of the dataset of your interest.
cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastq

# for-loop to run fastqc for all fastq files within current working directory
for f in *.fastq.gz; do
    # Set base filename
    base=${f%%.fastq.gz}

    # Set directory and files. You can change here to analyze your own dataset
    fastq_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastq
    fastq_file="${base}.fastq.gz"
    fastqc_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/fastqc.1st
    log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/fastqc.1st
    log_file="fastqc.1st.log.${base}.txt"

    # Run fastqc
    {
        fastqc $fastq_dir/$fastq_file \
            -o $fastqc_dir \
            -t 6
    } 2>$log_dir/$log_file
done

