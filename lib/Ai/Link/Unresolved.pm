use MooseX::Declare;

class Ai::Link::Unresolved with Ai::Link {
    has [qw/type name namespace/] => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );
}
