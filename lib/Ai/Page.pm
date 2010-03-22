use MooseX::Declare;

role Ai::Page with (Ai::Dependency, Ai::Role::WithDependencies) {
    requires 'name';
    requires 'list_content';  # keys of content
    requires 'content';       # hashref of name -> data mapping
}

1;
