#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_14_bedtools merge peaks for correlation analysis, SEACR
# IgG sample: CutandRun-Library-40
# H3k9me3 : CutandRun-Library-41
# Uhrf2: CutandRun-Library-38
# L3mbtl3: CutandRun-Library-39
##########
# Make output directory for merged peak bed files
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/cat-merged-peak-bed

# Define file name and directory to save a log for the process
log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/cat-merged-peak-bed
log_file="log_cat-merged-peak-bed_SEACR.txt"

# Run to cat and merge peak bed files
(
    # SEACR, with IgG, norm, stringent, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_stringent_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_stringent_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_stringent_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_stringent_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_norm_stringent_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_norm_stringent_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_norm_stringent_whole_merged.bed


    # SEACR, with IgG, SFRC, stringent, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_stringent_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_stringent_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_stringent_whole_merged.bed

         # Merge H3k9me3, Uhrf2 and L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SFRC_stringent_whole_merged.bed


    # SEACR, with IgG, SRPMC, stringent, whole
        #H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed


    # SEACR, with IgG, norm, relaxed, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_relaxed_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_relaxed_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_relaxed_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_norm_relaxed_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_norm_relaxed_whole_merged.bed


    # SEACR, with IgG, SFRC, relaxed, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed
        
         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed
        

    # SEACR, with IgG, SRPMC, relaxed, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed


    # SEACR, without IgG, norm, stringent, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_stringent_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_stringent_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_stringent_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_norm_stringent_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_norm_stringent_whole_merged.bed


    # SEACR, without IgG, SFRC, stringent, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed


    # SEACR, without IgG, SRPMC, stringent, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed


    # SEACR, without IgG, norm, relaxed, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_relaxed_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_relaxed_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_relaxed_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_norm_relaxed_whole_merged.bed


    # SEACR, without IgG, SFRC, relaxed, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed

         # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
         cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
             /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
             | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
         bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
             > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed


    # SEACR, without IgG, SRPMC, relaxed, whole
        # H3k9me3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-41.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed

        # Uhrf2 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-38.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed

        # L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR/CutandRun-Library-39.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed

        # Merge H3k9me3, Uhrf2, L3mbtl3 peaks
        cat /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/H3k9me3_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
            /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/Uhrf2_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
            /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/L3mbtl3_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed
) 2>$log_dir/$log_file
