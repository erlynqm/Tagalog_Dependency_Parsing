#!/usr/bin/perl
#this script changes a tag of a word

$file = $ARGV[0]; #file to read
$word = $ARGV[1]; #word to change tag
$tag = $ARGV[2]; #current tag
$newtag = $ARGV[3]; #new tag

open (MYFILE, $file);
@lines = <MYFILE>;
close(MYFILE);


$count = 0;
foreach $set (@lines)
{
  chomp $set;
  @lineset = split(/\t/,$set);

chomp $word;
chomp $tag;
chomp $lineset[6];
$gettag = substr($tag,3,length($tag));
$matchtag =substr($lineset[6],3,length($lineset[6])-2);

$matchtag =~ s/\s+$//;

if($lineset[0])
{
        if(($lineset[0] eq $word) and ($matchtag eq $gettag)){ 
             print $lineset[0]. "\t". $lineset[1]. "\t". $lineset[2]. "\t". $lineset[3]. "\t". $lineset[4]. "\t". $lineset[5]. "\t". $newtag."\n";
                
         }    
      else {print $lineset[0]. "\t". $lineset[1]. "\t". $lineset[2]. "\t". $lineset[3]. "\t". $lineset[4]. "\t". $lineset[5]. "\t". $lineset[6]."\n";
       } 
 }
else {print"\n";}
 }



