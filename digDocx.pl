#!/usr/bin/perl

$args = $#ARGV + 1;
if($args != 1){
	print "\nUsage : perl digWord.pl documentname.docx\n";
	exit;
}

system("unzip","-qq","$ARGV[0]","docProps/app.xml");
open(file,"docProps/app.xml") || die "Cannot open file";

while(<file>){

	if($_ =~ /(<Pages>)(.*)(<\/Pages)/){
		print "Pages:\t\t\t$2\n";
	}
	if($_ =~ /(<Words>)(.*)(<\/Words>)/){

		print "Word Count:\t\t$2\n";
	}
	if($_ =~/(<Characters>)(.*)(<\/Characters>)/){
		print "Character Count:\t$2\n";
	}

}

close(file);
system("rm","-r","docProps");
exit;
