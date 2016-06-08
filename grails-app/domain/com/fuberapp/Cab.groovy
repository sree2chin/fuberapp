package com.fuberapp

class Cab {

	String name
	String cabNumber
	int driverPhoneNumber
	String color	
	// setting starting location to (0,0)
	int currentLocationLatitude = 0
	int currentLocationLongitude = 0
	Date createdDate = new Date()

	String status

    static constraints = {
    	cabNumber nullable:true
    	driverPhoneNumber nullable:true
    	color nullable: true
    }
}
