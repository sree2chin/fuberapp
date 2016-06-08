package com.fuberapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
@Transactional
class CabController {
    def cabService
    def index() { 
    	def criteria = Cab.createCriteria()
    	def cabsList = criteria.list{}
    	[cabsList: cabsList]
    }

    def showCabs() { 
        def criteria = Cab.createCriteria()
        def cabsList = criteria.list{
            eq("status", "offRide")
        }
        [cabsList: cabsList]
    }

    def fetchAvailableCabs() { 
        def criteria = Cab.createCriteria()
        def cabsList = criteria.list{
            eq("status", "offRide")
        }
        render([cabsList: cabsList] as JSON)
    }

    def bookedCabs() { 
        def criteria = Cab.createCriteria()
        def cabsList = criteria.list{
            eq("status", "onRide")
        }
        [cabsList: cabsList]
    }

    def bookCab() { 
    }

    def addCab() {
        def requestJson = request.JSON
        def criteria = Cab.createCriteria()
        def cabs = criteria.list{
            eq("cabNumber", requestJson.cabNumber.toString())
        }
        if(cabs && cabs.size() > 0) {
            render([success: false] as JSON)
            return
        }
        
    	def cabInstance = new Cab()
    	cabInstance.name = requestJson.cabName
		cabInstance.cabNumber = requestJson.cabNumber.toString()
		cabInstance.driverPhoneNumber = requestJson.cabDriverPhoneNumber.toInteger()
        if(requestJson.cabColorIsPink) {
            cabInstance.color = "pink"
        }
		// setting starting location to (0,0)
		cabInstance.currentLocationLatitude = 0
		cabInstance.currentLocationLongitude = 0
		cabInstance.status = "offRide"
		if(cabInstance.save(failOnError: true)) {
            render([success: true] as JSON)
        }
		else {
            render([success: false] as JSON)
        }

    }

}
