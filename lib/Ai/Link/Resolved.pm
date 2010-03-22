use MooseX::Declare;

class Ai::Link::Resolved with Ai::Link {
    use Ai::Types qw(Dependency);

    has [qw/type name namespace/] => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    has 'target' => (
        is       => 'ro',
        isa      => Dependency,
        required => 1,
    );
}

1;
