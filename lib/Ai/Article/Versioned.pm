use MooseX::Declare;

role Ai::Article::Versioned with Ai::Article {
    use Ai::Types qw(Article);
    use MooseX::Types::DateTime qw(DateTime);

    has 'revision_date' => (
        is       => 'ro',
        isa      => DateTime,
        required => 1,
    );

    has 'previous_revision' => (
        is        => 'ro',
        isa       => Article,
        predicate => 'has_previous_revision',
    );

    method post_date {
        return $self->previous_revision->post_date if $self->has_previous_revision;
        return $self->revision_date;
    }

    method mod_date {
        return $self->revision_date;
    }

    around gather_digestable_data {
        return $self->$orig, $self->mod_date, (
            $self->has_previous_revision ?
              $self->previous_revision->kiokudb_object_id :
              '<base>'
          );
    }
}

1;
