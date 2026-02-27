#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_14_bedtools merge peaks for correlation analysis, MACS
# IgG sample: CutandRun-Library-40
# H3k9me3 : CutandRun-Library-41
# Uhrf2: CutandRun-Library-38
# L3mbtl3: CutandRun-Library-39

##########
# Make output directories to save output and log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/cat-merged-peak-bed

# Define file name and directory to save a log for the process
log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/cat-merged-peak-bed
log_file="log_cat-merged-peak-bed_MACS.txt"

# Run to cat and merge peak bed files
(
    # MACS3, with IgG, whole
    # H3k9me3 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_MACS3/CutandRun-Library-41.hg38.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_w-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_w-IgG_whole_merged.bed

    # Uhrf2 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_MACS3/CutandRun-Library-38.hg38.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_w-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_w-IgG_whole_merged.bed

    # L3mbtl3 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_MACS3/CutandRun-Library-39.hg38.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_w-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_w-IgG_whole_merged.bed

    # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_w-IgG_whole_merged.bed \
        /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_w-IgG_whole_merged.bed \
        /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_w-IgG_whole_merged.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_MACS3_w-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_MACS3_w-IgG_whole_merged.bed


    # MACS3, without IgG, whole
    # H3k9me3 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_MACS3/CutandRun-Library-41.hg38.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_wo-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_wo-IgG_whole_merged.bed

    # Uhrf2 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_MACS3/CutandRun-Library-38.hg38.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_wo-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_wo-IgG_whole_merged.bed

    # L3mbtl3 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_MACS3/CutandRun-Library-39.hg38.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_wo-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_wo-IgG_whole_merged.bed

    # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
    cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_MACS3_wo-IgG_whole_merged.bed \
        /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_MACS3_wo-IgG_whole_merged.bed \
        /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_MACS3_wo-IgG_whole_merged.bed \
        | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_MACS3_wo-IgG_whole_cat.bed \
        > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_MACS3_wo-IgG_whole_merged.bed
) 2>$log_dir/$log_file
