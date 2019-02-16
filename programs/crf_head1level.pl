#!/usr/bin/perl
#reads a CRF file and MST format file and create a new file of CRF with head information
#head information is in the form of Cluster information
#uses one level of granularity for head infor
#uses cluster info for word level
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
$wordcluster ="";
$headcluster="";
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
		$size = @crfarray;

		$crfarray[7]=~s/\s//g;

	
	next if(length($line) == 1);

	      if($crfarray[7] == 0){
                        $headcluster = "root";
		}else
			{
				$headindex = $crfarray[7] -1;
				$head = $nodehead[$headindex];
				@headarray= split(/\t/,$head);

				$cluster = &findCluster($headarray[0]);
	
				if ($cluster eq "-1"){
	 		
						$headcluster = "_";

				}	
				else{
				$headcluster = $cluster;	
					}
			}


		$cluster=&findCluster($crfarray[0]);
		if($cluster eq "-1"){
			$wordcluster = "_";
		}
		else{$wordcluster = $cluster;}
		
		
		$i=0;

		while($i<$size-2){
			print $crfarray[$i]."\t";
		$i++;
		}
		chomp $crfarray[$size-2];		
		print $wordcluster."\t".$headcluster."\t".$crfarray[$size-2]."\n";

 	}

	@nodehead = (); #RESET nodehead array for the next sentence
	$head ="";
	print "\n";
	}

}#end while


