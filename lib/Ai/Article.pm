use MooseX::Declare;

role Ai::Article with KiokuDB::Role::ID::Content {
    use Digest::SHA1 qw(sha1_hex);

    has [qw/title content/] => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    requires 'content_as_html';
    requires 'post_date';
    requires 'mod_date';

    method gather_digestable_data {
        return ($self->title, $self->content);
    }

    method kiokudb_object_id {
        my $data = join "\0\r\n", map {
            length("$_"). ":$_"
        } $self->gather_digestable_data;

        return 'article:sha1:'. sha1_hex($data);
    }
}

1;
