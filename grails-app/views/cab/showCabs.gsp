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
			
		</script>
	</head>
	<body>
		<div class = "row">
			<div class = "col-md-1">
			</div>
			<div class = "col-md-9">
				<table class="table table-condensed" id="fmaFormTable">
				
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
              					image
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