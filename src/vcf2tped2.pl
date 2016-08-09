#transforms vcf into tped plink raw format (0,1,2, and 9 for missing)
# MPE: miguel.perez@uab.es

#!/usr/bin/perl -w
use strict;
use warnings;
use Getopt::Long;
my $hap;
GetOptions( 'hap' => \$hap );

while(<>){
  my ($chr, $pos, @G);
  # skips comments and homozygous blocks
  if($_ !~ "#" and $_ !~ "END" and $_ !~ "INDEL") {
     chomp $_;
     my @temp = split(/\t/,$_);
     #--> skips multiallelic sites
     next if ($temp[4] =~ /,/);
     $chr=$temp[0];
     $pos=$temp[1];
     foreach (@temp[9..$#temp]) {
		my $g;
		if($hap) {
		   $g = join(' ',substr($_, 0, 1), substr($_, 2, 1));
		} else {
           $g = substr($_, 0, 3);
           $g =~ s/0\/0/0/g;
           $g =~ s/0\/1/1/g;
           $g =~ s/1\/1/2/g;
           $g =~ s/\.\/\./9/g;
           $g =~ s/0\|0/0/g;
           $g =~ s/0\|1/1/g;
           $g =~ s/1\|0/1/g;
           $g =~ s/1\|1/2/g;
           $g =~ s/\.\|\./9/g;
	    }
        push(@G,$g);
      }
      print "$chr $chr",'_',"$pos 0 $pos ", join(" ",@G), "\n";
   }
}
