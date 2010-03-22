use MooseX::Declare;

role Ai::Site {
    requires 'add_page';
    requires 'list_pages';
    requires 'url_mapper';
}

1;
