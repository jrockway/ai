use MooseX::Declare;

role Ai::Page::Index with (Ai::Linkable, Ai::Page) {
    method name { 'index' }
    method list_content { 'index' }
}

1;
