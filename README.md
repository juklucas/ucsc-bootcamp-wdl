# UCSC's Summer BioInformatics Short Course
This repo is used for the AnVIL module of UCSC's Bioinformatics &amp; Coding Summer Short Course (Summer 2021). It holds a WDL for calling samtools index on bam files which is used as part of the hands-on section of the course.

# indexBam.wdl
*indexBam.wdl* runs [samtools index](http://www.htslib.org/doc/samtools-index.html) on a bam file. This WDL is for learning purposes only and is not designed or tested for production use.
## Inputs
* a single (sorted) bam file

## Outputs
* The output is a single index (bai) file which has the same naming structure as the input bam. 
  * For example `SRR15089523.bam` will have an index file named `SRR15089523.bam.bai`.
