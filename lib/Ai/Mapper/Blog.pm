use MooseX::Declare;

class Ai::Mapper::Blog with (Ai::Mapper, Ai::Role::WithSite) {
    use MooseX::MultiMethods;
    use KiokuDB::Util qw(set);
    use Ai::Types qw(Page Linkable Dependency Set);
    use URI;

    # has [qw/objects addresses/] => (
    #     is       => 'ro',
    #     init_arg => undef,
    #     isa      => Set,
    #     lazy     => 1,
    #     default  => sub { set() },
    # );

    multi method path_for (Linkable $dep) {
        if($dep == $self->site->index_page){
            return 'index.html';
        }
        else {
            return 'static/'. $dep->name;
        }
    }

    sub fix_name {
        my $name = shift;
        $name = lc $name;
        $name =~ s/\W/-/g;
        $name =~ s/-+/-/g;
        $name =~ s{/}{}g;
        return $name;
    }

    multi method path_for (Page $page, Str $part) {
        if($part eq 'article' && $page->does('Ai::Page::Article')){
            return fix_name($page->name). '.html';
        }
        else {
            return fix_name($page->name) . ".$part";
        }
    }
}
