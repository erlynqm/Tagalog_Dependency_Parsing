#!/usr/bin/perl

#extract heads from DEPOUT of MST parsing results.
#first argument is always the CRF format file
#we will add the morphological information of the head and not the coarse-grained info of the head



$Testfile =  $ARGV[0]; #"$HOME/erlyn-m/parsing/MST2CRF/GoldStandard/"+$filename;
#$Resultfile = $ARGV[1];


open (TESTFILE, $Testfile);
#open (RESULTFILE, $Resultfile);


while ($testlines = <TESTFILE>) #&& ($resultlines = <RESULTFILE>))
{

if($testlines){
chomp $testlines;
#chomp $resultlines;

@line1 = split(/\t/,$testlines); #CRF baseline file
#@line2 = split(/\t/,$resultlines); #MST test/train file or results file

if($line1[0]){

push(@word, $line1[0]);
push(@rootword, $line1[1]);
push(@prefix, $line1[2]);
push(@infix, $line1[3]);
push(@suffix, $line1[4]);
push(@redup, $line1[5]);
push(@cluster, $line1[6]);
#push(@tag, $line[7]);
#push(@head, $line2[6]);

#$cgrain = substr $line1[6],0,2;
push(@coarse,$line1[7]);
}

else{

$sentence  = @word;
$i =0;
while($i<($sentence))
{

  if ($head[$i] == 0)
  {$mother = "root";
	  $mother_root = "root";
          $mother_prefix = "_";
          $mother_infix = "_";
          $mother_suffix = "_";
          $mother_redup = "_";
          $mother_word = "_";
	  $mother_cluster="_";

}
   else { $mother = $coarse[$head[$i]-1]; 
          $mother_root = $rootword[$head[$i]-1];
	  $mother_prefix = $prefix[$head[$i]-1];
	  $mother_infix = $infix[$head[$i]-1];
          $mother_suffix = $suffix[$head[$i]-1];
          $mother_redup = $redup[$head[$i]-1];
          $mother_word = $word[$head[$i]-1];
	  $mother_cluster=$cluster[$head[$i]-1];
}
  print $word[$i]."\t".$rootword[$i]."\t".$prefix[$i]."\t".$infix[$i]."\t".$suffix[$i]."\t".$redup[$i]."\t".$cluster[$i]."\t"; #.$mother."\t";
 # print $mother_root."\t".$mother_prefix."\t".$mother_infix."\t".$mother_suffix."\t".$mother_redup."\t".$mother_word."\t";
 # print $mother_root."\t";

  print $coarse[$i]."\n";
  $i++;

}

@word=();
@rootword =();
@prefix=();
@infix=();
@suffix=();
@redup=();
@coarse =();
@head =();
print "\n";
}	

}
}
close(TESTFILE);
#close(RESULTFILE);

