use MooseX::Declare;

role Ai::Role::WithSite {
    use Ai::Types qw(Site);

    has 'site' => (
        is       => 'ro',
        isa      => Site,
        required => 1,
    );
}
