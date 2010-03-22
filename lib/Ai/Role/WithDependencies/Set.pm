use MooseX::Declare;

role Ai::Role::WithDependencies::Set with Ai::Role::WithDependencies {
    use Ai::Types qw(Set Dependency);
    use KiokuDB::Util qw(set);

    has 'dependencies' => (
        is      => 'ro',
        isa     => Set,
        coerce  => 1,
        default => sub { set() },
    );

    method list_dependencies {
        return $self->dependencies->members;
    }

    method add_dependency( Dependency $dep ) {
        $self->dependencies->insert($dep);
    }
}

1;
