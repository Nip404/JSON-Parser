use strict;
use warnings;

use lib::JSONParser;
use Data::Dumper;

use feature "say";

my $filename = "sample.json";

my $parser = new JSONParser();
my $file = $parser->parse($filename);

my $elements_ref = ["quiz", "maths", "q2", "options"];
my $data = $parser->retrieve($file, $elements_ref);

say Dumper $data;
