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

$crfsize = @crfarray;

if(!$mstarray[0]){print "\n"; next;};

$crfarray[$crfsize-1] =~s/\s//g;

$coarse=substr($crfarray[$crfsize-1],0,2);
$finegrain = substr($crfarray[$crfsize-1],3,length($crfarray[$crfsize-1]));
print $mstarray[0]."\t".$mstarray[1]."\t".$mstarray[2]."\t".$coarse."\t".$finegrain."\t";
print $mstarray[5]."\t".$mstarray[6]."\t".$mstarray[7]."\n";

}
