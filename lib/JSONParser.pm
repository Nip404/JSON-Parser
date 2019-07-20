package JSONParser;

use JSON;

sub new {
    $class = shift;
    $self = {};

    bless $self, $class;

    return $self
}

sub parse {
    my $self = shift;
    my $file = shift;
    my $encoding = shift // "UTF-8"; # defined-or UTF-8

    open(F, "+<:encoding($encoding)", $file) or die $!;
    
    my $data = do {
        local $/;
        <F>;
    };

    close(F);
    
    return decode_json($data);
}

sub retrieve { # recursion for varying dimensions
    my $self = shift;
    my $data = shift;

    my $arr_ref = shift;
    my @arr = @$arr_ref;

    my $next = shift @arr;

    return (defined $next) ? $self->retrieve($data->{$next}, \@arr) : $data; #returns ref of refs or eq.
}

1;
