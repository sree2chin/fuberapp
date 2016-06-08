class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')

        "/fuberapp/cab" {
            controller = "cab"
            action = [GET: "fetchAvailableCabs", POST: "addCab"]
        }

        "/fuberapp/customerRide" {
            controller = "customerRide"
            action = [GET: "getCustomerRides", POST: "create", PUT: "update"]
        }
	}
}
