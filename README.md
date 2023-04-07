# FoodTruck-App

XAMPP Install :
https://www.apachefriends.org/download.html
Link - https://sourceforge.net/projects/xampp/files/XAMPP%20Mac%20OS%20X/8.0.25/xampp-osx-8.0.25-0-installer.dmg
PHP Download and install:
https://windows.php.net/downloads/releases/php-8.2.4-Win32-vs16-x64.zip

1. Web API Creation:
C:\Users\user\Desktop\FoodTruck-App\Backend\currentLocation.pl
Using CGI and JSON modules to get request data of latitude and longitude of user entered location.

Web API:
http://your-server.com/location_api.pl?lat=<xxxx>&lng=<yyyy>

2.Collecting San Francisco's food truck open dataset :
As we have many options like Data Set which can be get in JSON and CSV file provided.
In many ways we can get data, they are : Based on Data size need to decide.
i) As the data is getting published on daily or weekly bases, collect data on daily bases and use that data for locating food trucks. If we are aware of publishing time we can schedule accordingly.

    Schedule cronjob : 59 23 * * * perlfile with path  [Perl file Runs at midnight 11:59 pm]

ii) As we have CSV data URL, Using "LWP::UserAgent" we can get the data and load into database.

iii)Using Dataset API's we can get data in JSON [on daily bases and store in a file with filename using date] and parse through those JSON data and get object IDS of Food truck locations. Based on Object Ids we can fetch related data like Food items, availability etc..

iv)

Approach 
