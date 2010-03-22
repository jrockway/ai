use MooseX::Declare;

class Ai::Page::Blog::Index with (Ai::Page::Blog, Ai::Page::Index) {
    method content {
        return {
            index =>
              'index for "'. $self->site->title. '": '. join '',
            map { $_->name } $self->site->pages->members,
        }
    }
}
