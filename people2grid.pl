#!/usr/bin/perl


while(<>)
{	#0    1     2        3     4           5?   6
	#name photo position email affiliation url laburl
	next if(/^#/);

	my @F=split "\t"; 
        chomp @F;
        my ($name,$photo,$position,$email,$affiliation)=@F;
	my $laburl=@F[-1];
        my $label=lc($name);
        $label=~s/[\.\s]//g;
        $label=~s/,phd//;
        $label=~s/,ms//;
        $label=~s/,md//;

	print "---\n\n" if($.>1);
	
        print   "($label)=\n";

        if($laburl ne "NA")
	{
		print	"### [$name]($laburl)\n\n";
	}
	else
	{
		 print   "### $name\n\n";
	}
	print	"`````{grid} 12\n";
        print   ":gutter: 1\n\n";

	print 	"::::{grid-item-card}\n";
        print   ":columns: 12 12 3 3\n\n";

	print 	":::{image} /_static/People/".ucfirst($photo)."\n";
	print	":width: 240px\n";
	print	":alt: $name\n";
	print 	":::\n\n";

        print   "::::\n\n";

	print 	"::::{grid-item-card}\n";
        print   ":columns: 12 12 9 9\n\n";
	
        print   "**$position**  \n";
        print   "  \n";
        print   "$affiliation  \n";
        print   "  \n";
        print   "\[Lab homepage\]($laburl)  \n" if($laburl ne "NA");
        print   "&#9993; \[$email\](mailto:$email)  \n" if($email ne "NA");
        print   "::::\n\n";

	print	"`````\n\n";
}

