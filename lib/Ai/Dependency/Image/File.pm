use MooseX::Declare;

# | An image that exists on disk
class Ai::Dependency::Image::File with (Ai::Dependency::Image, Ai::Dependency::File) {

    method image_format {
        my $bn = $self->path->basename;
        my (@parts) = split /[.]/, $bn;
        return $parts[-1] || confess 'unknown format';
    }

    method image_data {
        return $self->path->slurp;
    }

}
