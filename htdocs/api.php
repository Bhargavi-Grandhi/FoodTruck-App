<?php

// Set the content type header to JSON
header('Content-Type: application/json');

// Define the API endpoint and HTTP method
$locationName = urlencode($_REQUEST["locationname"]);
$method = $_SERVER['REQUEST_METHOD'];
$perl_command = "perl /Applications/XAMPP/xamppfiles/htdocs/cgi-bin/GetNearMobileTruckDetails.pl $locationName";
$output = array();
$return_var = 0;


// Handle GET requests to the endpoint
if ($method === 'GET' && $locationName != '') {
    // Fetch data from a database or external API
    $output = exec($perl_command, $output, $return_var);
    if($output && $return_var == 0) {
        echo $output;
    }
    else{
        echo json_encode(['error' => "No Food Trucks found in give location" ]);
    }
    

    // Encode the data as JSON and output it
  #  echo json_encode($data);
} else {
    // Handle invalid requests
   # http_response_code(404);
   echo json_encode(['error' => 'Invalid API endpoint']);
   #echo "Invalid ";
}

?>