#!/usr/bin/perl
#find different between MST and CRF files



$filename = $ARGV[0];#CRF
$mstfile = $ARGV[1];

open(MSTFILE,$mstfile);
open(FILENAME,$filename);


$linenumber =1;
$counter=0;



while (($f = <FILENAME>) && ($mst = <MSTFILE>))
{
    chomp $f;
    chomp $mst;

	next if(!$f);
	@line = split(/\t/,$f);
 	@mstline = split(/\t/,$mst);
	$size = @line;


	$line[0]=~s/\s//g;
	$mstline[1]=~s/\s//g;

#	print $line[0]."\t".$mstline[1]."\n";
	
	if($line[0] ne $mstline[1])

	{

	print $linenumber."\t";
	 $i=0;
		while($i<$size)
		
		{
			print  $line[$i]; if($i<$size-1){ print "\t";}
			$i++;
		}

	$counter++;

	print "\n";
	}

$linenumber++;
	}

print $counter."\n";

close(MSTFILE);
close(FILENAME);	
