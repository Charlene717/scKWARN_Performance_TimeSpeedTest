The *.map files are Bowtie alignment files, one per lane. They were 
generated from reads trimmed as described in the paper (barcode 
identified and removed, GGG identified and removed, additional Gs 
removed, trailing As removed, low-quality and too short reads removed). 
 
The barcode of each read is encoded in the read identifier (last field 
separated by underscore). Each barcode corresponds to a single well in 
the original plate, and hence to a single cell.

Reads that failed the trimming or that did not align, are omitted.



