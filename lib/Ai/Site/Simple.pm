use MooseX::Declare;

role Ai::Site::Simple with (Ai::Site::WithIndex, Ai::Role::WithDependencies::Set) {
    use Ai::Types qw(Set Page Mapper);
    use MooseX::Types::URI qw(Uri);

    use KiokuDB::Util qw(set);

    has 'pages' => (
        is      => 'ro',
        isa     => Set,
        default => sub { set() },
        coerce  => 1,
        handles => {
            add_page   => 'insert',
            list_pages => 'members',
        },
    );

    method base_uri {}
    method mapper {}

    has 'base_uri' => (
        is       => 'ro',
        isa      => Uri,
        coerce   => 1,
        required => 1,
    );

    has 'mapper' => (
        is         => 'ro',
        isa        => Mapper,
        lazy_build => 1,
    );

    method list_pages {
        return $self->index_page, $self->pages->members;
    }

    method add_page(Page $page) {
        $self->pages->insert($page);
    }

}

1;

