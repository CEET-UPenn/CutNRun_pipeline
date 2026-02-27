#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_11_peak calling for Easy Shell CUTnRUN
# programs: MACS2, MACS3
# input files: clean BEDPE (for MACS2, MACS3)
###########
# Make output directory for peak calling output and log files
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/MACS2
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/MACS3
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/MACS2
    mkdir -p /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/MACS3

# Set filtered BEDPE folder as working directory
    cd /project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/BEDPE

# for-loop for MACS2 and MACS3
    for f in *.hg38.canonical.clean.fragments.bed; do

        # Extract base filename without extension
        base=${f%%.hg38.canonical.clean.fragments.bed}
        
        # Set file names and directories
        BEDPE_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/BEDPE
        actual_sample="${base}.hg38.canonical.clean.fragments.bed"
        IgG_control="CutandRun-Library-40.hg38.canonical.clean.fragments.bed"
        
        output_wo_IgG="${base}.hg38.canonical.clean.fragments_wo-IgG.txt"
        output_w_IgG="${base}.hg38.canonical.clean.fragments_w-IgG.txt"

        MACS2_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/MACS2
        MACS3_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/MACS3

        MACS2_log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/MACS2
        MACS3_log_dir=/project/voightlab_01/lorenzk/CEET/Amatullah/CutRun/Easy-Shells_CUTnRUN/D3PIC/log/MACS3        

        # Set current working directory again
        cd $BEDPE_dir
        
        # Call peaks using MACS3 without IgG
        (
            macs3 callpeak \
                -t $actual_sample \
                -f BEDPE -g hs --keep-dup all -p 1e-5 --SPMR \
                --outdir $MACS3_dir \
                -n $output_wo_IgG
        ) 2>$MACS3_log_dir/$output_wo_IgG

        # Call peaks using MACS3 with IgG
        (
            macs3 callpeak \
            -t $actual_sample \
            -c $IgG_control \
            -f BEDPE -g hs --keep-dup all -p 1e-5 --SPMR \
            --outdir $MACS3_dir \
            -n $output_w_IgG
        ) 2>$MACS3_log_dir/$output_w_IgG
    done
