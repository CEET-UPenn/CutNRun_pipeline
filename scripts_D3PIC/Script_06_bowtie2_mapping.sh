#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_06_Bowtie2 mapping
# Bowtie2 mapping reference
  # https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-aligner
##########
# Make bowtie2 mapping output directory
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped

# Make bowtie2 mapping log output directory
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/bowtie2-mapped

# Set trimmed fasta file location as current working directory
cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/trimmed

# for-loop to run bowtie2 mapping
for f in *_R1_001_val_1.fq.gz; do

  # Extract base filename without extension
  base=${f%%_R1_001_val_1.fq.gz}

  # Define directories and file names; you can change here to analyze your own dataset.
  trimmed_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/trimmed
  read1="${base}_R1_001_val_1.fq.gz"
  read2="${base}_R2_001_val_2.fq.gz"

  hg38_index=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/tools2/assemblies/chrom.hg38/hg38
  ecoli_K12_DH10B_index=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/tools2/assemblies/ecoli_K12_DH10B/Escherichia_coli_K_12_DH10B/Ensembl/EB1/Sequence/Bowtie2Index/genome

  bam_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped
  hg38_bam="${base}.hg38.bam"
  ecoli_K12_DH10B_bam="${base}.ecoli_K12_DH10B.bam"

  log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/bowtie2-mapped
  log_hg38="bowtie2_log_hg38_${base}.txt"
  log_ecoli_K12_DH10B="bowtie2_log_ecoli_K12_DH10B_${base}.txt"

  # Set the current working directory again
  cd $trimmed_dir

  # Bowt2 alignment with reference genome of interest
  (
    bowtie2 \
      -p 8 --local --very-sensitive-local --no-unal --no-mixed --no-discordant -q --phred33 -I 10 -X 700 \
      -x $hg38_index \
      -1 $read1 \
      -2 $read2 | \
    samtools view -bhS -@ 8 \
      -o $bam_dir/$hg38_bam
  ) 2>$log_dir/$log_hg38

  # Bowtie2 alignment with spike-in genome
  (
    bowtie2 \
      -p 8 --local --very-sensitive-local --no-unal --no-mixed --no-discordant -q --phred33 -I 10 -X 700 \
      -x $ecoli_K12_DH10B_index \
      -1 $read1 \
      -2 $read2 | \
    samtools view -bhS -@ 8 \
      -o $bam_dir/$ecoli_K12_DH10B_bam
  ) 2>$log_dir/$log_ecoli_K12_DH10B
done
