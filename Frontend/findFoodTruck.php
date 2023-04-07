<?php

// Set the location name


$location = 'New York, NY';

// Create the API request URL
$url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' . urlencode($location);

// Make the API request
$response = file_get_contents($url);

// Parse the response JSON
$data = json_decode($response);

// Extract the latitude and longitude
$lat = $data->results[0]->geometry->location->lat;
$lng = $data->results[0]->geometry->location->lng;
echo "Latitude: $lat, $longitude: $lng"
// Send the latitude and longitude through an API
#$api_url = 'https://your-api-url.com/?lat=' . urlencode($lat) . '&lng=' . urlencode($lng);
#$response = file_get_contents($api_url);

// Handle the API response as needed
?>