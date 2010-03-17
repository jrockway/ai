package Ai::Types;
use strict;
use warnings;

use KiokuDB::Set;
use MooseX::Types -declare => [qw/Site Article Search Page Link Set PathPart/];
use MooseX::Types::Moose qw(Str);

role_type Site, { role => 'Ai::Site' };
role_type Article, { role => 'Ai::Article' };
role_type Search, { role => 'Ai::Search' };
role_type Page, { role => 'Ai::Page' };
role_type Link, { role => 'Ai::Link' };

role_type Set, { role => 'KiokuDB::Set' };


subtype PathPart, as Str,
  where { !m{/} },
  message { 'PathPart must not contain a /' };

1;
