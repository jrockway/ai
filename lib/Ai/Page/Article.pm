use MooseX::Declare;

role Ai::Page::Article with Ai::Page {
    use Ai::Types qw(Article);
    has 'article' => (
        is       => 'ro',
        isa      => Article,
        required => 1,
    );

    method name {
        return $self->article->title;
    }

    around list_dependencies {
        return $self->$orig, $self->article->list_dependencies;
    }
}

1;
