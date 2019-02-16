#!/usr/bin/perl
#extracts POS tags from POS tagging and use it for MST parsing format data
#file 1 CRF file (Results file)
#file 2 MST Test file

$fileCRF = $ARGV[0];
$fileMST =$ARGV[1];

open(MSTFILE,$fileMST);
open(CRFFILE,$fileCRF);

while (($mstline = <MSTFILE> )&& ($crfline = <CRFFILE>)){

chomp $mstline;
chomp $crfline;

@mstarray = split(/\t/,$mstline);
@crfarray = split(/\t/,$crfline);

if(!$mstarray[0]){print "\n"; next;};

$crfarray[8] =~s/\s//g;

$coarse=substr($crfarray[8],0,2);
#$finegrain = substr($crfarray[8],3,length($crfarray[8]));
$finegrain = $crfarray[8];
print $mstarray[0]."\t".$mstarray[1]."\t".$mstarray[2]."\t".$coarse."\t".$finegrain."\t";
print $mstarray[5]."\t".$mstarray[6]."\t".$mstarray[7]."\n";

}
