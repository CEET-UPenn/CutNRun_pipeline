#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_15_correlation analysis: Deeptools plotPCA
# H3k9me3 : CutandRun-Library-41
# Uhrf2: CutandRun-Library-38
# L3mbtl3: CutandRun-Library-39
##########
# Preparation; you can change these to analyze your datasets
    # Set input bam file lists
        # Set current working directory
        cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bowtie2-mapped

        # for-loop to build the list of whole bam files
        for bam_files in *.hg38.canonical.clean.sort.bam; do
            all_bam_files="$all_bam_files $bam_files"
        done
    
    # Set output file names and directories
        # Make output directories
        mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/deeptools_multiBamSummary
        mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/deeptools_plotPCA
        mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
        mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/correlation

        # Define file name and directory to save a log for the process
        log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/correlation
        log_file="log_plotPCA.txt"

        # Define directories and bed file names.
        multiBamSummary_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/deeptools_multiBamSummary
        plotPCA_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/deeptools_plotPCA

        bed_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison
        bed_MACS3_w_IgG="all_MACS3_w-IgG_whole_merged.bed"
        bed_MACS3_wo_IgG="all_MACS3_wo-IgG_whole_merged.bed"
        bed_SEACR_w_IgG_norm_stringent="all_SEACR_w-IgG_norm_stringent_whole_merged.bed"
        bed_SEACR_wo_IgG_norm_stringent="all_SEACR_wo-IgG_norm_stringent_whole_merged.bed"
        bed_SEACR_w_IgG_norm_relaxed="all_SEACR_w-IgG_norm_relaxed_whole_merged.bed"
        bed_SEACR_wo_IgG_norm_relaxed="all_SEACR_wo-IgG_norm_relaxed_whole_merged.bed"

# Run Deeptools
(
        # Print files within each list
        printf "\nall bam files: %s\n" "$all_bam_files"


    # Correlation analysis for MACS3 peaks
        multiBamSummary BED-file \
            -b $all_bam_files \
            --BED $bed_dir/$bed_MACS3_w_IgG \
            -p max/2 --smartLabels \
            -o $multiBamSummary_dir/all_MACS3_w-IgG.npz

        plotPCA \
            -in $multiBamSummary_dir/all_MACS3_w-IgG.npz \
            -o $plotPCA_dir/all_MACS3_w-IgG.pdf \
            -T "$bed_MACS3_w_IgG" \
            --transpose

        multiBamSummary BED-file \
            -b $all_bam_files \
            --BED $bed_dir/$bed_MACS3_wo_IgG \
            -p max/2 --smartLabels \
            -o $multiBamSummary_dir/all_MACS3_wo-IgG.npz

        plotPCA \
            -in $multiBamSummary_dir/all_MACS3_wo-IgG.npz \
            -o $plotPCA_dir/all_MACS3_wo-IgG.pdf \
            -T "$bed_MACS2_wo_IgG" \
            --transpose

    # Correlation analysis for SEACR peaks
        multiBamSummary BED-file \
            -b $all_bam_files \
            --BED $bed_dir/$bed_SEACR_w_IgG_norm_stringent \
            -p max/2 --smartLabels \
            -o $multiBamSummary_dir/all_SEACR_w-IgG_norm_stringent.npz

        plotPCA \
            -in $multiBamSummary_dir/all_SEACR_w-IgG_norm_stringent.npz \
            -o $plotPCA_dir/all_SEACR_w-IgG_norm_stringent.pdf \
            -T "$bed_SEACR_w_IgG_norm_stringent" \
            --transpose

        multiBamSummary BED-file \
            -b $all_bam_files \
            --BED $bed_dir/$bed_SEACR_wo_IgG_norm_stringent \
            -p max/2 --smartLabels \
            -o $multiBamSummary_dir/all_SEACR_wo-IgG_norm_stringent.npz

        plotPCA \
            -in $multiBamSummary_dir/all_SEACR_wo-IgG_norm_stringent.npz \
            -o $plotPCA_dir/all_SEACR_wo-IgG_norm_stringent.pdf \
            -T "$bed_SEACR_wo_IgG_norm_stringent" \
            --transpose

        multiBamSummary BED-file \
            -b $all_bam_files \
            --BED $bed_dir/$bed_SEACR_w_IgG_norm_relaxed \
            -p max/2 --smartLabels \
            -o $multiBamSummary_dir/all_SEACR_w-IgG_norm_relaxed.npz

        plotPCA \
            -in $multiBamSummary_dir/all_SEACR_w-IgG_norm_relaxed.npz \
            -o $plotPCA_dir/all_SEACR_w-IgG_norm_relaxed.pdf \
            -T "$bed_SEACR_w_IgG_norm_relaxed" \
            --transpose
            
        multiBamSummary BED-file \
            -b $all_bam_files \
            --BED $bed_dir/$bed_SEACR_wo_IgG_norm_relaxed \
            -p max/2 --smartLabels \
            -o $multiBamSummary_dir/all_SEACR_wo-IgG_norm_relaxed.npz

        plotPCA \
            -in $multiBamSummary_dir/all_SEACR_wo-IgG_norm_relaxed.npz \
            -o $plotPCA_dir/all_SEACR_wo-IgG_norm_relaxed.pdf \
            -T "$bed_SEACR_wo_IgG_norm_relaxed" \
            --transpose
) 2>$log_dir/$log_file
