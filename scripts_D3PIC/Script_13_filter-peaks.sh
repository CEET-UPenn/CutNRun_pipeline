#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
### Script_13_bedtools intersect to filter out IgG peaks from CUT&RUN peaks wo IgG comparison
### IgG sample: CutandRun-Library-40
##########
# Create subtracted peak bed files output directories
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_MACS3
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/filter-peaks

# Set current working directory for for-loop
    cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_MACS3

# Define log file and directory
    log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/filter-peaks
    log_file="log_filter-peaks.txt"

# for-loop to filter out IgG peaks from CUT&RUN peaks
(
    for f in *.hg38.canonical.clean.fragments_wo-IgG_whole.bed; do

        # Extract base filename without extension
        base=${f%%.hg38.canonical.clean.fragments_wo-IgG_whole.bed}

        # Define directory and file names to save the output of filtration
            # MACS3
            input_dir_MACS3=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_MACS3
            output_dir_MACS3=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_MACS3
            
            whole="${base}.hg38.canonical.clean.fragments_wo-IgG_whole.bed"
            focused="${base}.hg38.canonical.clean.fragments_wo-IgG_focused.bed"
            IgG="CutandRun-Library-40.hg38.canonical.clean.fragments_wo-IgG_whole.bed"

            # SEACR
            input_dir_SEACR=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed_SEACR
            output_dir_SEACR=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/peak-bed-filtered_SEACR

            raw_stringent_whole="${base}.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed"
            raw_stringent_focused="${base}.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_focused.bed"
            raw_stringent_IgG="CutandRun-Library-40.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed"

            raw_relaxed_whole="${base}.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed"
            raw_relaxed_focused="${base}.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_focused.bed"
            raw_relaxed_IgG="CutandRun-Library-40.hg38.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed"

            SFRC_stringent_whole="${base}.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed"
            SFRC_stringent_focused="${base}.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_focused.bed"
            SFRC_stringent_IgG="CutandRun-Library-40.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed"

            SFRC_relaxed_whole="${base}.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed"
            SFRC_relaxed_focused="${base}.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_focused.bed"
            SFRC_relaxed_IgG="CutandRun-Library-40.hg38.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed"

            SRPMC_stringent_whole="${base}.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed"
            SRPMC_stringent_focused="${base}.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_focused.bed"
            SRPMC_stringent_IgG="CutandRun-Library-40.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed"
            
            SRPMC_relaxed_whole="${base}.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed"
            SRPMC_relaxed_focused="${base}.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_focused.bed"
            SRPMC_relaxed_IgG="CutandRun-Library-40.hg38.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed"

        # bedtools intersect to obtain peaks without IgG peak; MACS3
            # for intervene and correlation
            bedtools intersect \
                -v \
                -a $input_dir_MACS3/$whole \
                -b $input_dir_MACS3/$IgG \
                > $output_dir_MACS3/$whole

            # for heatmap
            bedtools intersect \
                -v \
                -a $input_dir_MACS3/$focused \
                -b $input_dir_MACS3/$IgG \
                > $output_dir_MACS3/$focused

        # bedtools intersect to obtain peaks without IgG peak; SEACR
            # for intervene and correlation
            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$raw_stringent_whole \
                -b $input_dir_SEACR/$raw_stringent_IgG \
                > $output_dir_SEACR/$raw_stringent_whole
            
            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SFRC_stringent_whole \
                -b $input_dir_SEACR/$SFRC_stringent_IgG \
                > $output_dir_SEACR/$SFRC_stringent_whole

            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SRPMC_stringent_whole \
                -b $input_dir_SEACR/$SRPMC_stringent_IgG \
                > $output_dir_SEACR/$SRPMC_stringent_whole

            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$raw_relaxed_whole \
                -b $input_dir_SEACR/$raw_relaxed_IgG \
                > $output_dir_SEACR/$raw_relaxed_whole
            
            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SFRC_relaxed_whole \
                -b $input_dir_SEACR/$SFRC_relaxed_IgG \
                > $output_dir_SEACR/$SFRC_relaxed_whole

            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SRPMC_relaxed_whole \
                -b $input_dir_SEACR/$SRPMC_relaxed_IgG \
                > $output_dir_SEACR/$SRPMC_relaxed_whole

            # for heatmap
            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$raw_stringent_focused \
                -b $input_dir_SEACR/$raw_stringent_IgG \
                > $output_dir_SEACR/$raw_stringent_focused
            
            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SFRC_stringent_focused \
                -b $input_dir_SEACR/$SFRC_stringent_IgG \
                > $output_dir_SEACR/$SFRC_stringent_focused

            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SRPMC_stringent_focused \
                -b $input_dir_SEACR/$SRPMC_stringent_IgG \
                > $output_dir_SEACR/$SRPMC_stringent_focused

            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$raw_relaxed_focused \
                -b $input_dir_SEACR/$raw_relaxed_IgG \
                > $output_dir_SEACR/$raw_relaxed_focused
            
            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SFRC_relaxed_focused \
                -b $input_dir_SEACR/$SFRC_relaxed_IgG \
                > $output_dir_SEACR/$SFRC_relaxed_focused

            bedtools intersect \
                -v \
                -a $input_dir_SEACR/$SRPMC_relaxed_focused \
                -b $input_dir_SEACR/$SRPMC_relaxed_IgG \
                > $output_dir_SEACR/$SRPMC_relaxed_focused
    done
) 2>$log_dir/$log_file
