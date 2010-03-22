use MooseX::Declare;

class Ai::Page::Blog::Article with (Ai::Page::Blog, Ai::Page::Article) {
    method content {
        return {
            article => 'brought to you by "'. $self->site->title. '": '.
              $self->article->content_as_html,
        };
    }
}
