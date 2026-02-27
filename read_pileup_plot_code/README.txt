pygenometracks readme

To generate the provided file the following prerequisites must be loaded:
pygenometracks installed as python module 
bedtools2 2.30.0
python 3.8

You will need to edit paths in the .ini file to match your file structure. 

then call pygenometracks with

pyGenomeTracks --dpi 300 --fontSize 16 --plotWidth 37 --tracks plot_peaks_D1PIC.ini -o chr5_L_highlight_zoom.png --region chr5:134225271-134535506

the .ini file plots tracks in the order listed, here experimental bigwigs, control bigwigs, then genes.
Finally it add the vertical highlights, in this case from a peak bed file. 

please see https://pygenometracks.readthedocs.io/en/latest/ for further pygenometrack options. 

