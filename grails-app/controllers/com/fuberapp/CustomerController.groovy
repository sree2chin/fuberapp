package com.fuberapp
import grails.transaction.Transactional

@Transactional
class CustomerController {

    def index() { 
    	[cabsList: "hi"]
    }
}
