use strict;
use warnings;

use lib::JSONParser;
use Data::Dumper;

use feature "say";

my $filename = "sample.json";

my $parser = new JSONParser();
my $data = $parser->parse($filename);

my @elements = ("quiz", "maths", "q2", "options");
my $wanted = $parser->retrieve($data, \@elements);
say Dumper $wanted;
