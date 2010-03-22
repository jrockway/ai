use MooseX::Declare;

role Ai::Site::Simple with (Ai::Site, Ai::Role::WithDependencies::Set) {
    use Ai::Types qw(Set Page);
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

    has 'url_mapper' => (
        reader     => '_moose_roles_suck',
        is         => 'ro',
        lazy_build => 1,
    );

    method url_mapper { $self->_moose_roles_suck }

    requires '_build_url_mapper';

    method list_pages {
        return $self->index_page, $self->pages->members;
    }

    method add_page(Page $page) {
        $self->pages->insert($page);
    }

}

1;

