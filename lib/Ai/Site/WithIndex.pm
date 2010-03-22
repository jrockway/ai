use MooseX::Declare;

role Ai::Site::WithIndex {
    use Ai::Types qw(IndexPage);

    with 'Ai::Site';

    has 'index_page' => (
        is         => 'ro',
        isa        => IndexPage,
        lazy_build => 1,
    );

    requires '_build_index_page';

    around list_pages {
        return $self->index_page, $self->$orig;
    }

    before add_page($page){
        confess 'cannot add an index page'
          if $page->does('Ai::Page::Index');
    }
}
