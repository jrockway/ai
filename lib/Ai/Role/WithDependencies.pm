use MooseX::Declare;

role Ai::Role::WithDependencies {
    requires 'list_dependencies';
}

1;
