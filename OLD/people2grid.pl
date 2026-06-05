#!/usr/bin/perl


while(<>)
{	#0    1     2        3     4           5?   6
	#name photo position email affiliation url laburl
	next if($.==1);
	my @F=split "\t"; 
	chomp @F;

	print "---\n\n" if($.>2);
	
	print	"### $F[0]\n\n";
	print	"```{grid} 1 1 3 3\n\n";

	print 	":::{grid-item-card}\n";
	print 	":::{figure} /_static/People/".ucfirst($F[1])."\n";
	print	":width: 240px\n";
	print	":alt: $F[0]\n";
	print 	":::\n\n";

	print 	":::{grid-item-card}\n";
        print   "- $F[2]\n";
        print   "- \[$F[3]\](mailto:$F[3])\n" if($F[3] ne "NA");
	print   "- \[Lab homepage\]($F[-1])\n" if($F[-1] ne "NA");
        print   ":::\n\n";

        print   ":::{grid-item-card}\n";
        print   "- $F[4]\n";
        print   ":::\n\n";

	print	"```\n\n";
}

