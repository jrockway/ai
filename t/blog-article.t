use strict;
use warnings;
use Test::More;

use Ai::Article::Simple;

my $date2 = DateTime->new( year => 2009, month => 1, day => 1, hour => 10 );
my $date  = DateTime->new( year => 2009, month => 1, day => 1, hour => 1 );

my $article = Ai::Article::Simple->new(
    title             => 'OH HAI',
    content           => 'Here is a *lolcat*!',
    revision_date     => $date2,
    previous_revision => Ai::Article::Simple->new(
        title         => 'OH HAI',
        content       => 'Here is a lolcat',
        revision_date => $date,
    ),
);

is $article->post_date, $date, 'got post date';
is $article->mod_date, $date2, 'got modification date';
is $article->previous_revision->mod_date, $date, 'got previous mod date';
is $article->previous_revision->post_date, $date, 'got previous post date';

my $html = $article->content_as_html;
chomp $html;
is $html, '<p>Here is a <em>lolcat</em>!</p>', 'got html';

my $identical_article = Ai::Article::Simple->new(
    title         => 'OH HAI',
    content       => 'Here is a lolcat',
    revision_date => $date,
);

is $article->previous_revision->kiokudb_object_id,
  $identical_article->kiokudb_object_id,
  'content-addressing works OK';

done_testing;
