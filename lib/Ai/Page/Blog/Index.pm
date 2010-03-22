use MooseX::Declare;

class Ai::Page::Blog::Index with (Ai::Page::Blog, Ai::Page::Index) {
    method name {
        'Index';
    }

    method content {
        return {
            html =>
              'index for "'. $self->site->title. '": '. join '',
            map { $_->name } $self->site->pages->members,
        }
    }
}
