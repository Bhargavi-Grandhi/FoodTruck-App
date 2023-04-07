use LWP::UserAgent;

my $url = 'https://data.sfgov.org/api/views/rqzj-sfat/rows.csv';   # Replace with your CSV URL
my $ua = LWP::UserAgent->new;
my $response = $ua->get($url);

if ($response->is_success) {
    my $csv_data = $response->decoded_content;
    open(my $fh, '>', 'data.csv') or die "Failed to open file: $!";
    print $fh $csv_data;
    close($fh);
    ../../FoodTrucksData/Mobile_Food_Facility_Permit.csv
}
else {
    die "Failed to retrieve CSV data: " . $response->status_line;
}