App can be viewed on the below link
WEBSITE LINK:
https://thawing-brook-91824.herokuapp.com/

DEPLOYED SERVER:
Heroku

TECHNOLOGIES:
Grails, jquery and mysql.

GITHUB LINK:
https://github.com/sree2chin/fuberapp/

APIS:

For fetching available cabs:
/fuberapp/cab
action: GET

For adding to new cab with default location:
/fuberapp/cab
action: POST

sample request payLoad: 
{
   "cabName":"testingApi1",
   "cabNumber":"3435",
   "cabDriverPhoneNumber":"345",
   "cabColorIsPink":false
}


For fetching the customer ride details:
/fuberapp/customerRide
action: GET

For booking a ride:
/fuberapp/customerRide
action: POST
sample request payLoad:

{
   "rideCustomerName":"hi",
   "rideLongitude":"8888",
   "rideLatitude":"4567",
   "rideColorIsPink":false
}

For ending the ride:
/fuberapp/customerRide
action: PUT
sample request payLoad:
{
   "rideId":10,
   "rideLatitude":"3456",
   "rideLongitude":"7000"
}


Data modeling

Cab:
	String cabId
    	String name
	String cabNumber
	int driverPhoneNumber
	String color	
	int currentLocationLatitude
	int currentLocationLongitude
	Date createdDate
	String status

Customer:
	String customerId
	String name
	int phoneNumber
	Boolean isPinkPreferred
	int currentLocationLatitude
	int currentLocationLongitude
	Date createdDate
	String status

CustomerRide:
	String cabId
	String customerId
	int startLocationLatitude
	int startLocationLongitude
	int endLocationLatitude
	int endLocationLongitude
	Double priceOfTheRide
	Date startTime
	Date endTime
	Date createdDate
	String status

Description:
	Initially cabs can be added to the database using cabs api with default location, color, cab # etc.



	All available cabs will be shown under Available cabs section.



	Cab can be booked by the customer by giving the location and preferred color of the car as input and the nearest available preferred color cab will be allocated to him.



	Booked cabs can be viewed under ‘Booked cabs’ tab.

	Customer rides information can be viewed under ‘Rides’ tab and there is an option of ending the ride with the locations as input. After ending the ride the price will be calculated and shown on the ui


