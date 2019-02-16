#!/usr/bin/perl
#this file converts and cRF file to mst format file with POS tag
#requires 2 files
# CRF with POS tag
# MST format with heads

$file = $ARGV[0]; #CRFformat
$mstfile = $ARGV[1]; #MST format file

open (MYFILE, $file);
open(MSTFile,$mstfile);

$counter = 1;

while (($set = <MYFILE>) && ($mstlines = <MSTFile>))

{
  chomp $set;
  chomp $mstset;

  @mstset = split(/\t/,$mstlines);
  @lineset = split(/\t/,$set);
  if($lineset[0]){ 


      $pre = $lineset[2];
      $in = $lineset[3];
      $sup = $lineset[4];
      $rep = $lineset[5];

	 @pos = split("\-",$lineset[6]);
		$cpos = $pos[0];
		$fpos = $pos[1];
     
      print $counter. "\t". $lineset[0]. "\t". $lineset[1]. "\t". "$cpos\t". "$fpos\t". "$pre|$in|$sup|$rep\t". $mstset[6]."\t_";

         $counter++;
  
       }
   else {$counter =1;} 
print"\n";
} 

close(MYFILE);
close(MSTFile);

