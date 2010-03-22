use MooseX::Declare;

role Ai::Link with Ai::Dependency {
    requires 'type';
    requires 'namespace';
    requires 'name';
}

1;
