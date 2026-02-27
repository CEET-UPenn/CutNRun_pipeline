#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_05_Download reference genome and bowtie2 indexes
# In this example, hg38 is used for actual sample to meet same reference genome of original publication.
# You can download other official bowtie2 indexes from bowtie2 sourceforge
    # https://bowtie-bio.sourceforge.net/bowtie2/index.shtml
# If you need to build new reference genome, please follow this instruction
    # https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer
##########
# Make bowtie2 index directory
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/bowtie2-index

# Make bowtie2 index download log directory
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/bowtie2-index

# Set directory names. you can change here to analyze your own dataset.
index_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/bowtie2-index

url_actual="https://genome-idx.s3.amazonaws.com/bt/hg38.zip"
output_actual="hg38.zip"
url_spike_in="https://genome-idx.s3.amazonaws.com/bt/ecoli_K12_DH10B.zip"
output_spike_in="ecoli_K12_DH10B.zip"

log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/bowtie2-index
log_file="bowtie2-index-log.txt"

# Download bowtie2 index files
{
    # Actual CUT&RUN sample reference genome; hg38
        # Use wget to download the GRCh38.p14 genome fasta file
        cd $index_dir
        wget -O "$output_actual" "$url_actual"

        # unzip the hg38 bowtie2 index file
        unzip -j "$output_actual"

        # remove the zipped ecoli_K12_DH10B bowtie2 index file to reduce storage usage
        rm "$output_actual"

    # Spkke-in control reference genome; ecoli_K12_DH10B
        # Use wget to download the ecoli_K12_DH10B bowtie2 index file
        cd $index_dir
        wget -O "$output_spike_in" "$url_spike_in"

        # unzip the ecoli_K12_DH10B bowtie2 index file
        unzip -j "$output_spike_in"

        # remove the zipped ecoli_K12_DH10B bowtie2 index file to reduce storage usage
        rm "$output_spike_in"
} 2>$log_dir/$log_file
