## SBVB: A flexible & efficient tool to simulate sequence population data and complex traits

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

specifies that the pedigree file is 'test.ped'. For a complete help, check the manual file. 

##### Input files required
PEDFILE: a pedigree file
QTNFILE: a file with causal SNP positions
SNPFILE: a file with a list of SNP positions in an array (up to 9 arrays can be analyzed simultaneously)
MAPFILE: controls local recombination rates (optional)

##### Output files
OUTYFILE: phenotypes and genetic values per individual
OUTQFILE: QTN frequencies and ascribed variances
OUTGFILE: GRM files
OUTMFILE: Marker genotypes, optionally in Plink format

##### Controling genetic architecture

### Citation
M. Perez-Enciso, N. Forneris, G. de los Campos, A. Legarra. An efficient new simulator predicts minimal advantage of full sequence for genomic prediction. Submitted.
