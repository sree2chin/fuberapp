<html>
<p>App can be viewed on the below link WEBSITE LINK:</p>
		<a href = "https://thawing-brook-91824.herokuapp.com/">fuberApp</a>

		<p><b>DEPLOYED SERVER:</b> Heroku</p>

		<p>TECHNOLOGIES: Grails, jquery and mysql.</p>

		<p>GITHUB LINK: https://github.com/sree2chin/fuberapp/</p>

		<p><b>APIS:</b></p>

		<p>For fetching available cabs: /fuberapp/cab action: GET</p>

		<p>For adding to new cab with default location: /fuberapp/cab action: POST</p>

		<p>sample request payLoad: </p>
		<p>
			</pre>
			{ 	
				"cabName":"testingApi1", 
				"cabNumber":"3435", 
				"cabDriverPhoneNumber":"345", 
				"cabColorIsPink":false 
			}
			</pre>
		</p>
		<p>For fetching the customer ride details: /fuberapp/customerRide action: GET</p>

		<p>For booking a ride: /fuberapp/customerRide action: POST </p>
		<p>sample request payLoad:</p>

		<p>
			<pre>
			{ 
			  "rideCustomerName":"hi", 
			  "rideLongitude":"8888", 
			  "rideLatitude":"4567", 
			  "rideColorIsPink":false 
			}
			</pre>
		</p>

		<p>For ending the ride: /fuberapp/customerRide action: PUT </p>
		<p>sample request payLoad: </p>
		<p>
			<pre>
			{ 
				"rideId":10, "rideLatitude":"3456", 
				"rideLongitude":"7000" 
			}
			</pre>
		</p>

		<p><b>Data modeling</b></p>

		<p><b>Cab:</b></p> 
		<p>
			<pre>
				String cabId 
				String name 
				String cabNumber 
				int driverPhoneNumber 
				String color
				int currentLocationLatitude 
				int currentLocationLongitude 
				Date createdDate 
				String status
			</pre>
		</p>

		<p><b>Customer:</b></p> 
		<p>
			<pre>
				String customerId
				String name
				int phoneNumber
				Boolean isPinkPreferred
				int currentLocationLatitude
				int currentLocationLongitude
				Date createdDate
				String status
			</pre>
		</p>
		
		<p><b>CustomerRide:</b></p> 
		<p>
			<pre>
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
			</pre>
		</p>

		<p><b>Description:</b></p>
		<p>
		 Initially cabs can be added to the database using cabs api with default location, color, cab # etc.
		</p>
		<p>All available cabs will be shown under Available cabs section.</p>
		<p>Cab can be booked by the customer by giving the location and preferred color of the car as input and the nearest available preferred color cab will be allocated to him.</p>
		<p>Booked cabs can be viewed under ‘Booked cabs’ tab.</p>
		<p>Customer rides information can be viewed under ‘Rides’ tab and there is an option of ending the ride with the locations as input. After ending the ride the price will be calculated and shown on the ui.</p>
</html>
