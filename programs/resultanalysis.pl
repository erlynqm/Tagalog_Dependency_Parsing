#!/usr/bin/perl
#combines the test file and results file
#first parameter = gold data
#second parameter = result data

$Testfile =  $ARGV[0]; #CRF RESULT FILE
$Resultfile = $ARGV[1];


open (TESTFILE, $Testfile);
open (RESULTFILE, $Resultfile);


while (($testlines = <TESTFILE>) && ($resultlines = <RESULTFILE>))
{

	chomp $testlines;
	chomp $resultlines;


	@testarray = split(/\t/,$testlines);
	@resultarray =split(/\t/,$resultlines);


	if($testarray[0]){
	print $testarray[0]."\t".$testarray[1]."\t".$testarray[3]."\t".$testarray[4]."\t".$testarray[6]."\t".$resultarray[6]."\n";
}
else{print"\n";}
}

close(TESTFILE);
close(RESULTFILE);


