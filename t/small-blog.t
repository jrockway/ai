use strict;
use warnings;
use Test::More;

use Ai::Site::Blog;
use Ai::Article::Simple;

use MooseX::Declare;

class Image with (Ai::Dependency::Image) {
    has 'image' => ( is => 'ro', required => 1);
    method image_data { $self->image };
    method image_format { 'txt' }
}

class Template with (Ai::Dependency) {
    has 'name' => ( is => 'ro' );
}

my $blog = Ai::Site::Blog->new(
    title        => 'I CAN HAZ LOLCATS',
    dependencies => [
        Image->new(
            name  => 'cats.jpg',
            image => '<picture of cats>',
        ),
    ],
);

my $article = Ai::Article::Simple->new(
    title         => 'OH HAI, HERE IS A KITTEH',
    revision_date => DateTime->now,
    dependencies  => [
        Image->new(
            name     => 'nibbler.jpg',
            image    => '<picture of nibbler the cat>',
            alt_text => 'Nibbler the cat!',
        ),
    ],
    content => 'Here is a picture of a cat: '.
      '![Nibbler the cat](nibbler.jpg)',
);

$blog->add_article($article);

my @pages = $blog->list_pages;
ok @pages == 2, 'got 2 pages';

my ($ip, $ap) = @pages;

$ap->add_dependency(
    Template->new( name => 'foo.tt' ),
);

ok $ip->does('Ai::Page::Index'), 'got an index page';
ok $ap->does('Ai::Page'), 'got an article page';

is_deeply [ sort map { $_->name } $ap->list_dependencies ],
  [sort qw/foo.tt nibbler.jpg cats.jpg/], 'got dependencies for article page';

done_testing;
