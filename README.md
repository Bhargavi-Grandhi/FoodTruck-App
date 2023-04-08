# FoodTruck-App

Setup:
*******
Install XAMPP (MAC) :
https://www.apachefriends.org/download.html
Link - https://sourceforge.net/projects/xampp/files/XAMPP%20Mac%20OS%20X/8.0.25/xampp-osx-8.0.25-0-installer.dmg

Copy all git files under htdocs to htdocs folder in XAMPPFILES

Make sure Apache is running in XAMP, then use https://localhost:<port>/EnterCity.html to load html page in chrome.

Development :
*************
APIs Used :
To get location Points of given location :  http://api.openweathermap.org/geo/1.0/direct?q=Sausalito&appid=<API KEY>

<API KEY> => Signup into http://api.openweathermap.org and get API Key

To get Data set provided by San Francisco  : http://data.sfgov.org/resource/rqzj-sfat.json

Project : Dispalys Food Truck details within 10miles range of given city in San Francisco.
https://localhost:<port>/EnterCity.html

Web API:
http://localhost/api.php?locationname=Sausalito

We can add more parameters to filter based on food items, address of Truck located.

CLI :
perl  /Applications/XAMPP/xamppfiles/htdocs/cgi-bin/GetNearMobileTruckDetails.pl "Santa Rosa"


Developmet view point:
*********************
Finding Geolocation points [latitude and longitude] of given location and calculating distance between the all truck details [latitude and longitude] and given location. Displaying Tuck details [Name, Address, Distance ] in UI which are less than 10miles of distance.

Points can improve :
******************
Sort based on the distance.
If JSON data is large, Load data into Mysql and use Mysql.
As data get changed on daily and weekly bases schedule one PL file which loads data into DB. We can replace Table or update table

 Schedule cronjob : 59 23 * * * perlfile with path  [Perl file Runs at midnight 11:59 pm]


As we have CSV data URL, Using "LWP::UserAgent" we can get the data and load into database.

Using Dataset API's we can get data in JSON [on daily bases and store in a file with filename using date] and parse through those JSON data and get object IDS of Food truck locations. Based on Object Ids we can fetch related data like Food items, availability etc..

