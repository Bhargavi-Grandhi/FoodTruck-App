#!/usr/bin/perl
use strict;
use warnings;
use JSON::XS;
use LWP::UserAgent;
use URI::Escape;

# Enter your latitude and longitude
my $locationName = uri_unescape($ARGV[0] =~ s/\+/ /gr);
my $setDistance = 10;
# Create a UserAgent object to send HTTP requests
my $ua = LWP::UserAgent->new();
my $getpointsurl = "http://api.openweathermap.org/geo/1.0/direct?q=$locationName&appid=9572cd35d2038b72ecd5b74a6bb1d027";
my $locationpoints = $ua->get($getpointsurl)->decoded_content;
my $detailoflocation = decode_json($locationpoints);
my $lat1 = $detailoflocation->[0]->{lat};
my $lng1 = $detailoflocation->[0]->{lon};

unless(defined $lat1 && defined $lng1) {
#print "Please check location entered";
exit;
}

# API endpoint to get food trucks data
my $url = "http://data.sfgov.org/resource/rqzj-sfat.json";


# Send a GET request to the API endpoint and decode the JSON response
my $res = $ua->get($url)->decoded_content;
my $data = decode_json($res);
my $details;
# Loop through the results and print the name and location of each food truck
foreach my $truck (@$data) {
    my $object_id = $truck->{objectid};
    my $name = $truck->{applicant};
    my $address = $truck->{address};
    my $lat = $truck->{latitude};
    my $lng = $truck->{longitude};
    my $facilitytype = $truck->{facilitytype};
    my $distance = haversine($lat1, $lng1, $lat, $lng); # calculate distance using Haversine formula
    $distance *= 0.621371 if(defined $distance); #miles
    if(defined $distance && ($distance <= $setDistance) && $facilitytype eq 'Truck') {
     $details->{$object_id}->{"name"} = $name;
     $details->{$object_id}->{"address"} = $address;
     $details->{$object_id}->{"distance"} = $distance;
      
    }

}
 print encode_json($details) if(defined $details);

# Haversine formula to calculate distance between two coordinates
sub haversine {
    my ($lat1, $lng1, $lat2, $lng2) = @_;
    my $r = 6371; # Earth's radius in km
    my $dLat = deg2rad($lat2 - $lat1);
    my $dLng = deg2rad($lng2 - $lng1);
    my $a = sin($dLat/2) * sin($dLat/2) +
            cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
            sin($dLng/2) * sin($dLng/2);
    my $c = 2 * atan2(sqrt($a), sqrt(1-$a));
    my $d = $r * $c;
    return $d;
}

# Function to convert degrees to radians
sub deg2rad {
    my ($deg) = @_;
    return $deg * 3.14 / 180;
}
