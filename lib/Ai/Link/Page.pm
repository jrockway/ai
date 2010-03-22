use MooseX::Declare;

class Ai::Link::Page extends Ai::Link::Resolved {
    use Ai::Types qw(Page);

    has 'content' => (
        is       => 'ro',
        isa      => 'Str',
        default  => 'html',
    );

    has '+target' => (
        isa => Page,
    );

    method BUILD ($) {
        confess "the target does not produce content called ". $self->content
          unless $self->content ~~ [$self->target->list_content];
    }
}
