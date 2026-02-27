#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# 
##########

# Making output directory to download raw fastq files and save the log file
    mkdir -p D3PIC            # Make parent folder to save every output files regarding D3PIC dataset
    mkdir -p D3PIC/log        # Make folder to save log files which can be used to trace back whole analysis procedures
    mkdir -p D3PIC/fastq      # Make folder to download raw fastq files

# make symlinks for fastqs in the fastq directory

ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-40_R1_001.fastq.gz D3PIC/fastq/CutandRun-Library-40_R1_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-40_R2_001.fastq.gz D3PIC/fastq/CutandRun-Library-40_R2_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-38_R1_001.fastq.gz D3PIC/fastq/CutandRun-Library-38_R1_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-38_R2_001.fastq.gz D3PIC/fastq/CutandRun-Library-38_R2_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-41_R1_001.fastq.gz D3PIC/fastq/CutandRun-Library-41_R1_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-41_R2_001.fastq.gz D3PIC/fastq/CutandRun-Library-41_R2_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-39_R1_001.fastq.gz D3PIC/fastq/CutandRun-Library-39_R1_001.fastq.gz
ln -s /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/data/CutandRun-Library-39_R2_001.fastq.gz D3PIC/fastq/CutandRun-Library-39_R2_001.fastq.gz
