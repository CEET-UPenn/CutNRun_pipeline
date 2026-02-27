CutNRun_pipeline

How we do Cut N Run analysis based on EasyShells_CUTnRUN


Methods:

method modified from on Lee, J., Chatterjee, B., Oh, N., Saha, D., Lu, Y., Bartholomew, B., Ishak, C. A. Introductory Analysis and Validation of CUT&RUN Sequencing Data. J. Vis. Exp. (214), e67359, doi:10.3791/67359 (2024).
https://pubmed.ncbi.nlm.nih.gov/39760380/

Dependencies were installed as per their instructions.


Briefly, fastq files were QC’d using FastQC2 v0.12.1, then trimmed using Trim-Galore3 v0.6.10. Sequences were aligned to sample (Human hg38) and spike in (E coli K12 DH10B) genomes using bowtie24 v2.5.4, using reference indexes downloaded from bowtie (H sapiens hg38, on 8/12/2025) or Illumina (E coli, 8/22/2025). Reads were sorted and filtered to remove non-canonical chromosome regions, publicly annotated blacklist and TA repeat regions using samtools5 v1.22.1, MACS36,7 v3.0.3, and bedtools28,9 v2.31.1. Insert size was analyzed using picard10 tools v2.23.3. Raw readcount files were normalized using Spike-in normalized Reads Per Million mapped reads in the negative Control (SRPMC). Peaks were called using MACS36,7 v3.0.3 and IgG control file. Peak summit heatmaps, PCA, and Pearson correlations were plotted using deeptools11 v3.5.6. 

Example scripts for a single experiment (control + pulldowns) is found in scripts_D3PIC

Bigwig files were visualized using pyGenomeTracks12,13 v3.8. 
Genes correspond to gencode v34. 
We used MACS3 output as SEACR calling was inconclusive for the vast majority of experiments. 

