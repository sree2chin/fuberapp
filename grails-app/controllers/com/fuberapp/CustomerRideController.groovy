package com.fuberapp
	
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
@Transactional
class CustomerRideController {

    def index() {
        def criteria = CustomerRide.createCriteria()
        def ridesList = criteria.list{}
        [ridesList: ridesList]
    }

    def getCustomerRides() {
        def criteria = CustomerRide.createCriteria()
        def ridesList = criteria.list{}
        render([ridesList: ridesList] as JSON)
    }

    def create() {
        def requestJson = request.JSON

    	def customerRideInstance = new CustomerRide()
    	def criteria = Cab.createCriteria()
    	def cabsList
    	if(requestJson?.rideColorIsPink) {
            cabsList = Cab.findAllByStatusAndColor("offRide", "pink")
            println cabsList
        }
        else {
            cabsList = Cab.findAllByStatus("offRide")
        }
        
    	
    	println cabsList

        // find the nearest cab over here.
        def nearestAvailableCabId
        // Assuming the max distance as 10000000
        def minDistance = 10000000
        // Assuming the user location, should replace with customer data
        int userLat = 100
        int userLog = 200

        cabsList.each{
            int x = it.currentLocationLatitude.toInteger()
            int y = it.currentLocationLongitude.toInteger()
            int disBtwCabAndUser = Math.sqrt( ((userLat.toInteger() - x) * (userLat.toInteger() - x)) + ((userLog.toInteger() - y) * (userLog.toInteger() - y)) )
            if(disBtwCabAndUser < minDistance) {
                nearestAvailableCabId = it.id
            }
        }

        if(cabsList && cabsList.size() > 0 && nearestAvailableCabId) {
            def cabInstance = Cab.get(nearestAvailableCabId)
            cabInstance.status = "onRide"
            if(!cabInstance.save(flush: true, failOnError: true)) {
                render([success: false] as JSON)
                return
            }
            customerRideInstance.cabId = nearestAvailableCabId
            // hardcoding the user, should replace this with customer data
            customerRideInstance.customerId = 1
            customerRideInstance.cabId = nearestAvailableCabId
            customerRideInstance.startLocationLatitude = requestJson.rideLatitude.toInteger()
            customerRideInstance.startLocationLongitude = requestJson.rideLongitude.toInteger()
            customerRideInstance.status = "onRide"
            customerRideInstance.priceOfTheRide = 0
            if(customerRideInstance.save(flush: true, failOnError: true)) {
                render([success: true] as JSON)
                return
            }
            else {
                render([success: false] as JSON)
                return
            }
        }
        else {
            render([success: false, responseMessage: "cab not found"] as JSON)
            return
        }
    }

    def update() {
        def requestJson = request.JSON
        def customerRideInstance = CustomerRide.get(requestJson?.rideId)
        // updating cab location
        def cabInstance = Cab.get(customerRideInstance.cabId)
        cabInstance.status = "offRide"
        cabInstance.currentLocationLatitude = requestJson?.rideLatitude.toInteger()
        cabInstance.currentLocationLongitude = requestJson?.rideLongitude.toInteger()
        if(!cabInstance.save(flush: true, failOnError: true)){
            render([success: false] as JSON)
        }
        /* UPDATE CUSTOMER RIDE with end location and time so that we can find the total amount
         * the customer owes.
         */
        customerRideInstance.status = "offRide"
        customerRideInstance.endLocationLatitude = requestJson?.rideLatitude.toInteger()
        customerRideInstance.endLocationLongitude = requestJson?.rideLongitude.toInteger()
        customerRideInstance.endTime = new Date()
        // find the distance of the ride
        int lat1 = customerRideInstance.startLocationLatitude.toInteger()
        int log1 = customerRideInstance.startLocationLongitude.toInteger()
        int lat2 = customerRideInstance.endLocationLatitude.toInteger()
        int log2 = customerRideInstance.endLocationLongitude.toInteger()
        // Calculating the total amount over here
        int travelDistance = Math.sqrt( (lat2-lat1) * (lat2-lat1) + (log2-log1) * (log2-log1) )
        Double price = travelDistance * 2
        price += (Math.abs(customerRideInstance.startTime.getTime() - (new Date().getTime()))/60000)
        customerRideInstance.priceOfTheRide = price
        if(!customerRideInstance.save(flush: true, failOnError: true)){
            render([success: false] as JSON)
        }
        else {
            render([success: true] as JSON)
        }
    }
}
