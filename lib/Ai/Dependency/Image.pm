use MooseX::Declare;

# | An image
role Ai::Dependency::Image with Ai::Linkable {
    has 'name' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    has 'alt_text' => (
        is        => 'ro',
        isa       => 'Str',
        predicate => 'has_alt_text',
    );

    requires 'image_format';
    requires 'image_data';
}

1;
