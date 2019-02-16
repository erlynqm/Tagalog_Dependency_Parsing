#!/usr/bin/perl
#adds cluster to the CRF file... local info cluster


$filename = $ARGV[0];
$clusterfile = $ARGV[1];

open(CRF, $filename);
open(CLUSTER, $clusterfile);

@clusterarray = <CLUSTER>;
@crfarray =<CRF>;


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

#               print $mycluster[0];
                $found=1;
                return $mycluster[1];
                }
        }

return "-1";

}
##############################

$cluster ="";
$bit4 ="";
$bit7 ="";
$bit10 ="";
foreach $line (@crfarray)
{
	chomp $line;


	
	@linearray = split(/\t/,$line);

	$size=@linearray;

	$linearray[0]=~s/\s//g;


    if(!$linearray[0]){print "\n"; next;}

	$cluster=&findCluster($linearray[0]);


	if($cluster eq "-1"){

		$group = "_";	

	}else{

		$group = $cluster;
	}


	$i=0;
	while($i<$size-1){
	

	print $linearray[$i]."\t";
	$i++;
	}

	print $group."\t".$linearray[$size-1]."\n";

	
}

