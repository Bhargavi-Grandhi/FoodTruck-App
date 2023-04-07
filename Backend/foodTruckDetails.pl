<?php

// Set the latitude and longitude values
$latitude = 37.7749; // Example latitude value (San Francisco, CA)
$longitude = -122.4194; // Example longitude value (San Francisco, CA)

// Set the API URL for retrieving nearby places from Google Maps Places API
$url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={$latitude},{$longitude}&rankby=distance&type=restaurant&key=YOUR_GOOGLE_MAPS_API_KEY";

// Make a request to the API to get the nearby places
$response = file_get_contents($url);

// Convert the response from JSON to an associative array
$places_data = json_decode($response, true);

// Loop through the nearby places and calculate the distance from the current location using Haversine formula
foreach ($places_data['results'] as $place) {
    $place_latitude = $place['geometry']['location']['lat'];
    $place_longitude = $place['geometry']['location']['lng'];
    $distance = haversine($latitude, $longitude, $place_latitude, $place_longitude);

    // Add the distance to the place object
    $place['distance'] = $distance;

    // Add the place to the nearby places array
    $nearby_places[] = $place;
}

// Sort the nearby places array based on distance
usort($nearby_places, function ($a, $b) {
    return $a['distance'] - $b['distance'];
});

// Output the nearby places
foreach ($nearby_places as $place) {
    $place_name = $place['name'];
    $place_address = $place['vicinity'];
    $place_distance = round($place['distance'] / 1000, 2); // Convert the distance to kilometers and round to 2 decimal places
    echo "{$place_name} ({$place_distance} km away)<br>{$place_address}<br><br>";
}

// Function to calculate the distance between two sets of latitude and longitude coordinates using Haversine formula
function haversine($lat1, $lon1, $lat2, $lon2) {
    $earth_radius = 6371000; // Earth's radius in meters
    $dLat = deg2rad($lat2 - $lat1);
    $dLon = deg2rad($lon2 - $lon1);
    $a = sin($dLat / 2) * sin($dLat / 2) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin($dLon / 2) * sin($dLon / 2);
    $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
    $distance = $earth_radius * $c;
    return $distance;
}

?>
