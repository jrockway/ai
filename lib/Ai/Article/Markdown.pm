use MooseX::Declare;

role Ai::Article::Markdown with Ai::Article {
    use Text::MultiMarkdown 'markdown';

    method content_as_html {
        return markdown( $self->content );
    }
}

1;
