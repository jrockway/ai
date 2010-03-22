use MooseX::Declare;

class Ai::Site::Blog with Ai::Site::Simple {
    use Ai::Types qw(Article);
    use Ai::Page::Blog::Article;
    use Ai::Page::Blog::Index;
    use Ai::Mapper::Blog;

    has 'title' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    method _build_index_page {
        Ai::Page::Blog::Index->new(
            site => $self,
        );
    }

    method _build_mapper {
        Ai::Mapper::Blog->new(
            site => $self,
        );
    }

    method add_article(Article $article){
        my $page = Ai::Page::Blog::Article->new(
            site    => $self,
            article => $article,
        );

        $self->add_page($page);
        return $page;
    }
}
