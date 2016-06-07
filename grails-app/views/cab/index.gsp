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
			$(document).on("click","#addCabButton",function() {
				var inputJson = {}
				var cabName = $('#cabName').val();
				var cabNumber = $('#cabNumber').val();
				var cabDriverPhoneNumber = $('#cabDriverPhoneNumber').val();
				var cabColorIsPink = $('#cabColorIsPink').is(':checked');
				if(cabName && cabNumber && cabDriverPhoneNumber) {
					inputJson.cabName = cabName;
					inputJson.cabNumber = cabNumber;
					inputJson.cabDriverPhoneNumber = cabDriverPhoneNumber;
					inputJson.cabColorIsPink = cabColorIsPink;
					$.ajax({
			            cache: false,
			            type: 'POST',
			            async: true,
			            url: "/fuberApp/cab/addCab",
			            data: JSON.stringify(inputJson),
			            dataType: 'json',
			            contentType: 'application/json; charset=utf-8',
			            success: function (result, status, xhr) {
			                console.log("success")
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
			});
		</script>
	</head>
	<body>
		<div class = "row">
			<div class = "col-md-2">
			</div>
			<div class = "col-md-6">
				<div id = "cabErrorMessage" style = "display: none;">
					please enter all fields
				</div>
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label class="control-label col-sm-3">Name:</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="cabName" placeholder="Enter name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-3">Cab #</label>
				    <div class="col-sm-9"> 
				      <input type = "number" class="form-control" id = "cabNumber" placeholder="Enter cab number">
				    </div>
				  </div>

				  <div class="form-group">
				    <label class="control-label col-sm-3">Driver phone #:</label>
				    <div class="col-sm-9"> 
				      <input type = "number" class="form-control" id = "cabDriverPhoneNumber" placeholder="Enter phone number">
				    </div>
				  </div>

				  <div class="form-group">
				    <label class="control-label col-sm-3">Color is pink:</label>
				    <div class="col-sm-1"> 
				      <input type="checkbox" id = "cabColorIsPink" value = "false">
				    </div>
				  </div>
				  
				  <div class="form-group"> 
				  	<div class = "col-sm-3">
				  	</div>
				    <div class="col-sm-9">
				      <button type="submit" class="btn btn-primary" id = "addCabButton">Add</button>
				    </div>
				  </div>
				</form>

			</div>
		</div>
	</body>
</html>