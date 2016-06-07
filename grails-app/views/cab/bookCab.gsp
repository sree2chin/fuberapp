<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<style>
			button {
				width: 100%;
			}
		</style>
		<script>
			$(document).on("click","#addRideButton",function() {
				var inputJson = {}
				var rideCustomerName = $('#rideCustomerName').val();
				var rideLongitude = $('#rideLongitude').val();
				var rideLatitude = $('#rideLatitude').val();
				var rideColorIsPink = $('#rideColorIsPink').is(':checked');
				debugger;
				if(rideCustomerName && rideLongitude && rideLatitude) {
					inputJson.rideCustomerName = rideCustomerName;
					inputJson.rideLongitude = rideLongitude;
					inputJson.rideLatitude = rideLatitude;
					inputJson.rideColorIsPink = rideColorIsPink;
					$.ajax({
			            cache: false,
			            type: 'POST',
			            async: true,
			            url: "/fuberApp/customerRide/create",
			            data: JSON.stringify(inputJson),
			            dataType: 'json',
			            contentType: 'application/json; charset=utf-8',
			            success: function (result, status, xhr) {
			                console.log("success.")
			            }.bind(this),
			            error: function (xhr) {
			            	console.log("error.")
			            }.bind(this),
			            complete: function(){

			            }.bind(this)
			        });
				}
				else {
					$('#cabErrorMessage').show()
				}
			});
		</script>
	</head>
	<body>
		<div class = "row">
			<div class = "col-md-1">
			</div>
			<div class = "col-md-9">
				<div id = "cabErrorMessage" style = "display: none;">
					please enter all fields
				</div>
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label class="control-label col-sm-3">Name:</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id = "rideCustomerName" placeholder="Enter name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-3">Choose your latitude location</label>
				    <div class="col-sm-9"> 
				      <input type = "number" class="form-control" id = "rideLatitude" placeholder="Enter latitude">
				    </div>
				  </div>

				  <div class="form-group">
				    <label class="control-label col-sm-3">Choose your longitude location</label>
				    <div class="col-sm-9"> 
				      <input type = "number" class="form-control" id = "rideLongitude" placeholder="Enter longitude">
				    </div>
				  </div>

				  <div class="form-group">
				    <label class="control-label col-sm-3">Want a pink car:</label>
				    <div class="col-sm-1"> 
				      <input type="checkbox" id = "rideColorIsPink" value = "false">
				    </div>
				  </div>
				  
				  <div class="form-group"> 
				  	<div class = "col-sm-3">
				  	</div>
				    <div class="col-sm-9">
				      <button type="submit" class="btn btn-primary" id = "addRideButton">
				      		Book
				      </button>
				    </div>
				  </div>
				</form>

			</div>
		</div>
	</body>
</html>