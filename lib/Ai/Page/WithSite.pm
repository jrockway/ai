use MooseX::Declare;

role Ai::Page::WithSite with (Ai::Role::WithSite, Ai::Role::WithDependencies::Set, Ai::Page) {
    around list_dependencies {
        return $self->site->list_dependencies, $self->$orig;
    }
}

1;
