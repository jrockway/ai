use MooseX::Declare;

class Ai::Mapper::Blog with Ai::Role::WithSite {
    use MooseX::MultiMethods;
    use Ai::Types qw(Page Link);
    use URI;

    method url_for(Page $page){
        return URI->new('urn:page:index.html')
          if $page->isa('Ai::Page::Index');
    }
}
