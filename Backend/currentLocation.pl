#!/usr/bin/perl
=pod
use strict;
use warnings;
use CGI qw(:standard);
use JSON;

my $data = {
    message => "Hello, world!",
};

print header('application/json');
print encode_json($data);
=cut

use Mojolicious::Lite;

get '/' => sub {
    my $c = shift;
    $c->render(text => 'Hello, world!');
};

app->start;