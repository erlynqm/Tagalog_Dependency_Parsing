#!/usr/bin/perl
#compares the results of dependency parsing with POS and without POS
#to see which parts are consistently correct and what parts are consistenctly wrong.

$golddata = $ARGV[0];
$filename1=$ARGV[1];
$filename2 = $ARGV[2];

open(GOLDFILE,$golddata);
open(FILEPOS, $filename1);
open(FILENOPOS,$filename2);
open(TEMPFILE,">tempfileresult.dat");

while(($withpos =<FILEPOS>)&&($goldline=<GOLDFILE>))
{
chomp $withpos;
chomp $goldline;

@array1=split(/\t/,$withpos);
@goldarray=split(/\t/,$goldline);


#		print $goldarray[0]."\t".$goldarray[1]."\t".$goldarray[6]."\t".$array1[6]."\n";
		print TEMPFILE $goldarray[0]."\t".$goldarray[1]."\t".$goldarray[3]."\t".$goldarray[6]."\t".$array1[6]."\n";
}
close(TEMPFILE);
open(TEMPFILE, "tempfileresult.dat");





#SUMMARY Variables
$gold_with=0;#errors between gold data and with pos tag experiments
$gold_without=0; # gold vs without pos tag experiments
$with_without=0; # to check consistently wrong but head predicted by both tagger with the same head
$totaltokens=0;

#while($templines = <TEMPFILE>)
while(($templines = <TEMPFILE>) && ($withoutpos = <FILENOPOS>))
{

chomp $templines;
chomp $withoutpos;

@temparray = split(/\t/, $templines);
@array2 = split(/\t/,$withoutpos);

$i=0;
$tempsize=@temparray;

if($temparray[0]){$totaltokens++;}

if($temparray[3] ne $temparray[4])
	{	
		$gold_with++;

		if($temparray[4] eq $array2[6]){
			$with_without++;
		}
	}

if($temparray[3] ne $array2[6])
        {       
                $gold_without++;
        }

while($i<$tempsize){

print $temparray[$i]."\t";
$i++;
}
print $array2[6]."\n";


}
$errorrate1 =($gold_with/$totaltokens)*100;
$errorrate2 =($gold_without/$totaltokens)*100;
$consistent1 = ($with_without/$gold_with)*100;
$consistent2 = ($with_without/$gold_without)*100;


print "################SUMMARY#############\n\n";
print "Total Tokens : $totaltokens\n";
print "Errors: \n";
print "With POS : ".$gold_with." (".$errorrate1.")\n";
print "Without POS : ".$gold_without." (".$errorrate2.")\n";
print "Consistently Wrong: ".$with_without." (".$consistent1.")\n";
print "                  : ".$with_without." (".$consistent2 .")\n";


