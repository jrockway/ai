use MooseX::Declare;

role Ai::Page with (Ai::Dependency, Ai::Role::WithDependencies) {
    requires 'name';
    requires 'content'; # hashref of filename -> data mapping
}

1;
