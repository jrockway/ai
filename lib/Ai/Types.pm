package Ai::Types;
use strict;
use warnings;

use KiokuDB::Util qw(set);
use MooseX::Types::Moose qw(ArrayRef);

use MooseX::Types -declare => [qw{
    Site
    Article
    Page
    Dependency
    Link

    Set

    Model

    IndexPage

    WithDependencies
}];

role_type Site, { role => 'Ai::Site' };
role_type Article, { role => 'Ai::Article' };

role_type Page, { role => 'Ai::Page' };
role_type IndexPage, { role => 'Ai::Page::Index' };

role_type Dependency, { role => 'Ai::Dependency' };
role_type Link, { role => 'Ai::Link' };

role_type Set, { role => 'KiokuDB::Set' };
coerce Set, from ArrayRef, via {
    my $array = shift;
    my $set = set();
    $set->insert($_) for @$array;
    return $set;
};

class_type Model, { class => 'Ai::Model' };

role_type WithDependencies, { role => 'Ai::Role::WithDependencies' };

1;
