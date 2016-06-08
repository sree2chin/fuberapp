<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<style>
			button {
				width: 100%;
			}
			.carImage {
				width: 30%;
			}
		</style>
		<script>
			
		</script>
	</head>
	<body>
		<div class = "row">
			<div class = "col-md-1">
			</div>
			<div class = "col-md-9">
				<center><h1>Already booked cabs info</h1></center>

				<table class="table table-bordered" id="fmaFormTable">
				
              	<tbody>
              		<td>
					</td>
					<td>
						<b>Name</b>
					</td>
					<td>
						<b>Number</b>
					</td>
					<td>
						<b>Latitude</b>
					</td>
					<td>
						<b>Longitude</b>
					</td>
					<td>
						<b>Status</b>
					</td>
              		<g:each in="${cabsList}" var="cab" status="i">
              			<tr>
              				<td>
              					<g:if test="${cab.color == 'pink'}">
                  						<img src="http://img.diytrade.com/cdimg/177009/435368/0/1059473653/Pink_Princess_Pedal_Car.jpg" />
                  				</g:if>
                  				<g:else>
                  					<img src="https://pixabay.com/static/uploads/photo/2014/04/03/10/27/car-310523_960_720.png" class = "carImage" />
                  				</g:else>
              				</td>
              				<td>
              					${cab.name}
              				</td>
              				<td>
              					${cab.cabNumber}
              				</td>
              				<td>
              					${cab.currentLocationLatitude}
              				</td>
              				<td>
              					${cab.currentLocationLongitude}
              				</td>
              				<td>
              					${cab.status}
              				</td>
              			</tr>
					</g:each>
              	<tbody>
              	</table>

			</div>
		</div>
	</body>
</html>