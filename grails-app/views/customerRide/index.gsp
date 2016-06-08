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
			function endRide(rideId) {
				$('#cabErrorMessage').hide()
				
				var inputJson = {}
				var rideLatitude = $('#rideLatitude').val();
				var rideLongitude = $('#rideLongitude').val();
				if(rideId && rideLatitude && rideLongitude) {
					inputJson.rideId = rideId;
					inputJson.rideLatitude = rideLatitude;
					inputJson.rideLongitude = rideLongitude;
					$.ajax({
			            cache: false,
			            type: 'POST',
			            async: true,
			            url: "/customerRide/update",
			            data: JSON.stringify(inputJson),
			            dataType: 'json',
			            contentType: 'application/json; charset=utf-8',
			            success: function (result, status, xhr) {
			                console.log("success")
			                location.reload();
			                
			            }.bind(this),
			            error: function (xhr) {
			            	console.log("error")
			            }.bind(this),
			            complete: function(){

			            }.bind(this)
			        });
				}
				else {
					$('#cabErrorMessage').show()
				}
			}
		</script>
	</head>
	<body>
		<div class = "row">
			<div id = "cabErrorMessage" style = "display: none;">
					please enter all fields
			</div>
			
			<div class = "col-md-1">
			</div>
			<div class = "col-md-10">
				<div class="form-group">
				    <label class="control-label col-sm-3">Choose end latitude location</label>
				    <div class="col-sm-9"> 
				      <input type = "number" class="form-control" id = "rideLatitude" placeholder="Enter latitude">
				    </div>
				</div>
				<br />
				<div class="form-group">
				    <label class="control-label col-sm-3">Choose end longitude location</label>
				    <div class="col-sm-9"> 
				      <input type = "number" class="form-control" id = "rideLongitude" placeholder="Enter longitude">
				    </div>
				</div>
				<br />
				<table class="table table-condensed" id="fmaFormTable">
				
              	<tbody>
					<td>
						<b>Starting latitude</b>
					</td>
					<td>
						<b>Starting longitude</b>
					</td>
					<td>
						<b>Ending latitude</b>
					</td>
					<td>
						<b>Ending latitude</b>
					</td>
					<td>
						<b>Start time</b>
					</td>
					<td>
						<b>End time</b>
					</td>
					<td>
						<b>Status</b>
					</td>
					<td>
						<b>Price</b>
					</td>
					<td>
						
					</td>
              		<g:each in="${ridesList}" var="ride" status="i">
              			<tr>
              				<td>
              					${ride.startLocationLatitude}
              				</td>
              				<td>
              					${ride.startLocationLongitude}
              				</td>
              				<td>
              					${ride.endLocationLatitude}
              				</td>
              				<td>
              					${ride.endLocationLongitude}
              				</td>
              				<td>
              					${ride.startTime}
              				</td>
              				<td>
              					<g:if test="${ride.endTime}">
              						${ride.endTime}
              					</g:if>
              				</td>
              				<td>
              					${ride.status}
              				</td>
              				<td>
              					${ride.priceOfTheRide}
              				</td>
              				<td>
              					<g:if test="${ride.status == 'onRide'}">
              						<button class="btn btn-primary" id = "endRideButton" onclick = endRide(${ride.id})>
              							End ride
              						</button>
              					</g:if>
              				</td>
              			</tr>
					</g:each>
              	<tbody>
              	</table>

			</div>
		</div>
	</body>
</html>