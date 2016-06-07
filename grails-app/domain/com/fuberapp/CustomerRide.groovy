package com.fuberapp

class CustomerRide {
	// maintaining relationship between tables manually by not depending on grails funcitonality which is slow
	String cabId
	String customerId
	int startLocationLatitude
	int startLocationLongitude
	int endLocationLatitude
	int endLocationLongitude
	Double priceOfTheRide
	Date startTime = new Date()
	Date endTime
	Date createdDate = new Date()

	String status

    static constraints = {
    	endLocationLatitude nullable:true
    	endLocationLongitude nullable:true
    	startTime nullable: true
    	endTime nullable: true
    	priceOfTheRide nullable: true
    }
}
