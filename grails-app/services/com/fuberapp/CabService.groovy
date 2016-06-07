package com.fuberapp

import grails.transaction.Transactional

import grails.converters.JSON

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Transactional
class CabService {

    def save(def obj){
        if (!obj.save(flush: true)) {
            return false
        }
        else{
            return true
        }
    }

}
