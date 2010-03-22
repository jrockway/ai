use MooseX::Declare;

role Ai::Link {
    requires 'type';
    requires 'namespace';
    requires 'name';
}

1;
