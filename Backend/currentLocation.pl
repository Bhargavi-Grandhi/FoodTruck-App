#!/usr/bin/perl

use strict;
use warnings;
use CGI qw(:standard);
use JSON;

# Get the latitude and longitude parameters from the HTTP GET request
my $latitude = param('lat');
my $longitude = param('lng');

# Validate the input parameters
unless (defined $latitude && defined $longitude) {
    print header(-type => 'application/json', -charset => 'utf-8');
    print encode_json({error => 'Missing latitude or longitude parameter'});
    exit;
}

# Perform any necessary data processing here
# ...

# Construct the response JSON object
my $response = {
    latitude => $latitude,
    longitude => $longitude,
    message => 'Received location data successfully'
};

# Output the response JSON object
print header(-type => 'application/json', -charset => 'utf-8');
print encode_json($response);