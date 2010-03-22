use MooseX::Declare;

role Ai::Site {
    requires 'add_page';
    requires 'list_pages';
    requires 'base_uri';
    requires 'mapper';
}

1;
