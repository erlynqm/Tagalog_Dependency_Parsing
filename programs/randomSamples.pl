#!/usr/bin/perl
$filename = $ARGV[0]; #resultfile
$outfile = $ARGV[1]; #randomly selected sentences are stored in this file
open(SOURCE, $filename);
open (OUTFILE, ">".$outfile);

@sourceArray = <SOURCE>;
@randomtest = ();
$size = @sourceArray;
$counter =0;
while($counter <=100)
{
	$random= int (rand(540));
	if(grep (m/^$random$/i, @randomtest)){next;}
	print $random."\n";
	push(@randomtest,$random);
	$counter++;	
}

@sentence =();
$counter=0;

foreach $words (@sourceArray){

chomp $words;

@entry=split(/\t/,$words);


if($entry[0]){

push(@sentence,$words);
}else{

print $counter."\n";

if(grep(m/^$counter$/i,@randomtest)){

	foreach $w (@sentence){

		print OUTFILE $w."\n";

		print $w."\n";
	}

print OUTFILE "\n";
}$counter++;

@sentence=();
}

}
