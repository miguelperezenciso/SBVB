## SBVB: A flexible & efficient tool to simulate sequence population data and complex traits

### Purpose
SBVB is a sequence based population simulator. Its goal is to simulate complex traits and genotype data starting with a vcf file that contains the genotypes of founder individuals and following a given pedigree. The main output are the genotypes of all individuals in the pedigree and/or molecular relationship matrices (GRM) using all sequence or a series of SNP lists, together with phenotype data. The program implements very efficient algorithms where only the recombination breakpoints for each individual are stored, therefore allowing the simulation of thousands of individuals very quickly. Most of computing time is actually spent in reading the vcf file. Future developments will optimize this step by reading and writing binary mapped files. The vcf file may not contain missing genotypes and is assumed to be phased.

### Main features
- Any number of traits.
- Any number of QTNs, trait specific.
- Any number of epistatic pairs, trait specific.
- Can generate correlated allelic effects and frequencies.
- Efficient algorithms to generate haplotypes and sample SNP genotypes.
- Computes genomic relationship matrices for up to 9 SNP arrays simultaneously, plus sequence.
- Any number of chromosomes, allows for sex chromosomes and varying local recombination rates, that can be sex specific.

### Installation
To compile and install:
```
make
sudo make install
```

### Running sbvb
(assuming vcf file is compressed and vcf2tped2.pl and sbvb in path)
```
zcat file.vcf.gz | perl vcf2tped2.pl -hap | cut -d ' ' -f 1,4- | sbvb -isbvb.par
```
### Help summary
All sbvb is controlled via a parameter file with sections in UPPERCASE, e.g.,

PEDFILE

test.ped

specifies that the pedigree file is 'test.ped'. 

For a complete help, check the [manual file](https://github.com/mperezenciso/sbvb0/blob/master/SBVB_manual.pdf), and file [README.sbvb] (https://github.com/mperezenciso/sbvb0/blob/master/src/README.sbvb). 

##### Input files
PEDFILE: a pedigree file (required) [toy example] (https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.ped)
QTNFILE: a file with causal SNP positions (required) [toy example] (https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.qtn)
EPIFILE: controls epistasis (optional) [example](https://github.com/mperezenciso/sbvb0/blob/master/example/test.epi)
SNPFILE: a file with a list of SNP positions in an array (up to 9 arrays can be analyzed simultaneously) [toy example](https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.chip)
MAPFILE: controls local recombination rates (optional) [toy example](https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.map)

##### Output files
OUTYFILE: phenotypes and genetic values per individual [toy example](https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.outy)
OUTQFILE: QTN frequencies and ascribed variances [toy example](https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.outq)
OUTGFILE: GRM files [toy example](https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.grm.1)
OUTMFILE: Marker genotypes, optionally in Plink format [toy example](https://github.com/mperezenciso/sbvb0/blob/master/toyexample/toy.outm.0)

##### Controling genetic architecture
This is accomplished with QTNFILE and EPIFILE. If QTN effects are not specified in QTNFILE, they can be simulated from uniform, normal or gamma, specified in sections QTNDISTA and QTNDISTD. Narrow or broad sense heritabiilities are controlled with H2 or H2G respectively. SBVB obtains actual genetic variances from individuals in base population and adjusts var e accordingly.

##### Controlling output
By default, only phenotypes and breeding values are written, the rest are controlled with options OUTQFILE, OUTGFILE and OUTMFILE.
Plink files can  be written with OUTPLINK option. 
NOSEQUENCE means sequence is not used for GRM or marker files, and only SNP files 

##### Restart
Sometimes one can be interested in running the same experiment but with different genetic architectures or different SNP arrays. SBVB offers two convenient ways to do this as it may keep track of haplotypes so exactly the same genetic structure is preserved, RESTART and RESTARTQTL. 

- With RESTART, haplotypes, phenotypes and QTN effects are preserved. This is useful to implement selection.
- With RESTARTQTN, haplotypes are preserved but phenotypes and QTN effects are sampled again. RESTARQTN can be used to run different genetic architectures in the same haplotypes so results can be exactly comparable across models.

The program then writes a *hap file that contains all haplotype structure the first time is run.

### [Toy example]
This folder contains simplest example to check sbvb format files

### [Example]
Contains an example consisting of 100 SNPs from the X chromosome of 205 lines from drosophila reference panel (http://dgrp2.gnets.ncsu.edu). 

### Citation
M. Perez-Enciso, N. Forneris, G. de los Campos, A. Legarra. An efficient new simulator predicts minimal advantage of full sequence for genomic prediction. Submitted.
