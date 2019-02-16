#!/usr/bin/perl
#reads a CRF file and MST format file and create a new file of CRF with head information
#head information is in the form of Cluster information
# 2 levels of granularity
# bits 5 and bits 8
#input files : CRF file, MST file


$crffile = $ARGV[0];
$mstfile = $ARGV[1];
$clusterfile =$ARGV[2];

open(CRF, $crffile);
open(MST,$mstfile);
#open(CLUSTER, "$HOME/Classifier/Data/ClusterData/Cluster_50_f100.txt");
open(CLUSTER,$clusterfile);
@clusterarray = <CLUSTER>;


##################
sub findCluster{
$a = $_[0];
$found =0;


#print $a;
  foreach $g (@clusterarray){
	@mycluster = split(/\t/,$g);

        $mycluster[0]=~s/\s//g;

                $start++;


        if($mycluster[0] eq $a){#if word is found in the dictionary

#		print $mycluster[0];
                $found=1;
		return $mycluster[1];
		}
	}

return "-1";

}

###################
sub bin2dec {
        unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}
##################
@nodehead = ();
$linehead = "";

while(($crfline = <CRF>) && ($mstline = <MST>))
{#begin while

	chomp $crfline;
	chomp $mstline;

#	$mstline=~s/\s//g;

	@mstarray = split(/\t/,$mstline);

	$linehead=$crfline."\t".$mstarray[6];
	push(@nodehead,$linehead);

	
	if(!$mstarray[1]){	#if founds a space or end of sentence
	foreach $line (@nodehead){

         	@crfarray = split(/\t/,$line);
		$crfarray[7]=~s/\s//g;

	
	next if(length($line) == 1);

	      if($crfarray[7] == 0){
			$bit_5 = "root";
                        $bit_8 = "root";
		}else
			{
				$headindex = $crfarray[7] -1;
				$head = $nodehead[$headindex];
				@headarray= split(/\t/,$head);

				$cluster = &findCluster($headarray[0]);
	
				if ($cluster == "-1"){
	 		
						$bit_5 = "_";
						$bit_8 = "_";

				}	
				else{
					$bit_5=substr($cluster,0,5);
                			$bit_5=~s/\s//g;

                			$bit_8=substr($cluster,0,8);
                			$bit_8=~s/\s//g;
				}
			}
		
		
		$i=0;

		while($i<6){
			print $crfarray[$i]."\t";
		$i++;
		}
		chomp $crfarray[6];		
		print $bit_5."\t".$bit_8."\t".$crfarray[6]."\n";

 	}

	@nodehead = (); #RESET nodehead array for the next sentence
	$head ="";
	print "\n";
	}

}#end while


