package com.fuberapp

class Customer {

	String name
	int phoneNumber
	Boolean isPinkPreferred
	// setting starting location to (0,0)
	int currentLocationLatitude = 0
	int currentLocationLongitude = 0
	Date createdDate = new Date()

	String status

    static constraints = {
    	phoneNumber nullable:true
    	isPinkPreferred nullable: true
    }
}