<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<div class="container" id="main-container">

		<!-- BEGIN Sidebar -->
		<div id="sidebar" class="navbar-collapse collapse">

			<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>

			<div id="sidebar-collapse" class="visible-lg">
				<i class="fa fa-angle-double-left"></i>
			</div>
			<!-- END Sidebar Collapse Button -->
		</div>
		<!-- END Sidebar -->

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			<div class="page-title">
				<div>
					<h1>

						<i class="fa fa-file-o"></i>Schedule Exhibition

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Schedule Exhibition
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addSponsor">Schedule
									Exhibition List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
            <form action="${pageContext.request.contextPath}/insertSponsor" method="post" enctype="multipart/form-data">
						<div class=" box-content" style="border: 4px solid #b6d1f2;">
							
								<div class="box-content">
									<div class="col-md-2">Date *</div>
									<div class="col-md-3">
										<input type="text" id="date" name="date"
											class="form-control date-picker" placeholder="Date" required />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Event*</div>
									<div class="col-md-3">
										<select id="eventId" name="eventId" class="form-control"
											required>
											<option value="">Select Event</option>
											<c:forEach items="${eventList}" var="eventList">
												<c:choose>
													<c:when test="${eventList.eventId==sponsor.eventId}">
														<option value="${eventList.eventId}" selected>${eventList.eventName}</option>
													</c:when>
													<c:otherwise>
														<option value="${eventList.eventId}">${eventList.eventName}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</select>
									</div>
								</div>
								<br>

								<div class="box-content">
									<div class="col-md-2">Day*</div>
									<div class="col-md-3">
										<input type="text" id="day" name="day" class="form-control"
											placeholder="Day" required />
									</div>
								</div>
								<br>
								<hr></hr>
								<div class="box-content">
									<div class="col-md-2">Topic *</div>
									<div class="col-md-3">
										<input type="text" id="topic" name="topic"
											class="form-control" placeholder="Topic" required />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Speaker *</div>
									<div class="col-md-3">
										<input type="text" id="speaker" name="speaker"
											class="form-control" placeholder="Speaker" required />
									</div>
								</div>
								</br>
								<div class="box-content">

									<div class="col-md-2">From Time *</div>
									<div class="col-md-3">
										<input type="time" id="fromTime" name="fromTime"
											class="form-control" placeholder="From Time" required />
									</div>
									<div class="col-md-1"></div>

									<div class="col-md-2">To Time *</div>
									<div class="col-md-3">
										<input type="time" id="toTime" name="toTime"
											class="form-control" placeholder="To Time" required />
									</div>
								</div>
								</br>
								<div class="box-content">
									<div class="col-md-2">Venue *</div>
									<div class="col-md-3">
										<textarea id="venue" name="venue" class="form-control"
											placeholder="Venue" required></textarea>
									</div>
									<div class="col-md-1"></div>

									<div class="col-md-2">Available Seats *</div>
									<div class="col-md-3">
										<input type="number" id="availSeat" name="availSeat"
											class="form-control" placeholder="Available Seats" required />
									</div>
								</div>
								</br></br>
								<div class="col-md-1"></div>
								<div class="box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="button" class="btn btn-info" value="Add Detail"
											id="submit">

									</div></div></div>
								<div class="box" id="pending" style="border: 4px solid #b6d1f2;">

									<div class="box-content">

										<br />
										<div class="clearfix"></div>
										<div class="table-responsive" style="border: 0">
											<table class="table table-advance" id="table1">
												<thead>
													<tr>
														<th style="width: 18px">No</th>
														<th>Date</th>
														<th>Event</th>
														<th>Day</th>
														<th>Topic</th>
														<th>Speaker</th>
														<th>From Time</th>
														<th>To Time</th>
														<th>Venue</th>
														<th>Available Seats</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit">

									</div>
								</div>
							</form>
						
					</div>

				</div>


			</div>
		</div>
		<!-- END Main Content -->
		<footer>
			<p>2018 © ATS EXHIBITION</p>
		</footer>

		<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
			class="fa fa-chevron-up"></i></a>
	</div>
	<!-- END Content -->
	</div>
	<!-- END Container -->

	<!--basic scripts-->

	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>

<script type="text/javascript">

var editFlag=false;
var key1=0;
//$('span').text("Add Item Detail");

$(document).ready(function() {
	$("#add").click(function() {
		
	var isValid = validation();
	if (isValid) {
		
 	var date = $("#date").val();
	//alert(itemId);
	var eventId=$('#eventId option:selected').val();
	//alert(selectedValue);

	var day = $("#day").val();
	//alert("baseQty"+baseQty)
	
	var topic = $("#topic").val();

	var speaker = $("#speaker").val();
	
	var fromTime = $("#fromTime").val();
	
	var toTime = $("#toTime").val();
	
	var rmName=$('#venue').text();

	if(editFlag==true)
	{
		editFlag=false;

		$.getJSON('${editItem}', {
			
			itemId : itemId,
			itemName:itemName,
			baseQty:baseQty,
			rmType:rmType,
			rmId:rmId,
			rmName:rmName,
			rmQty:rmQty,
			rmWeight:rmWeight,
			key:key1,
			
			ajax : 'true',
		},  function(data) { 
			 //$('#loader').hide();
			var len = data.length;

			//alert(len);

			$('#table1 td').remove();

			$.each(data,function(key, item) {

	      if(item.delStatus==0)
		  {
			var tr = $('<tr></tr>');

		  	tr.append($('<td></td>').html(key+1));

		  	tr.append($('<td></td>').html(item.itemName));

		  	if(item.rmType==1)
		  		{
			  	
		  		 tr.append($('<td></td>').html("Raw Material"));

		  		}
		  	else
		  		{
			  	tr.append($('<td></td>').html("Semi Finished"));

		  		}

		  	tr.append($('<td></td>').html(item.rmName));

/* 		  	tr.append($('<td></td>').html(item.rmUomId));
 */		  	
		  	tr.append($('<td></td>').html(item.rmWeight));
		  	
		  	tr.append($('<td></td>').html(item.rmQty));
		  	
		  	tr.append($('<td></td>').html(item.noOfPiecesPerItem));
		  	
		 	tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=editItemDetail("+key+")> <abbr title='edit'> <i class='fa fa-edit  fa-lg' ></i></abbr> </a> <a href='#' class='action_btn'onclick=deleteItemDetail("+key+ ")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
		  
		  //	tr.append($('<td></td>').html());
		  	
			$('#table1 tbody').append(tr);
	
		  }
		 }); 
		
		});
	}//if edit false then else....
	else
		{

//	alert(rmId);
	$.getJSON('${insertItemDetail}', {
		
		itemId : itemId,
		itemName:itemName,
		baseQty:baseQty,
		rmType:rmType,
		rmId:rmId,
		rmName:rmName,
		rmQty:rmQty,
		rmWeight:rmWeight,
		
		ajax : 'true',
	},  function(data) { 
 
		 //$('#loader').hide();
		var len = data.length;

		//alert(len);

		$('#table1 td').remove();

		$.each(data,function(key, item) {

	   if(item.delStatus==0)
	   {
		var tr = $('<tr></tr>');

	  	tr.append($('<td></td>').html(key+1));

	  	tr.append($('<td></td>').html(item.itemName));

	  	if(item.rmType==1)
	  		{
		  	
	  		 tr.append($('<td></td>').html("Raw Material"));

	  		}
	  	else
	  		{
		  	tr.append($('<td></td>').html("Semi Finished"));

	  		}

	  	tr.append($('<td></td>').html(item.rmName));

/* 	  	tr.append($('<td></td>').html(item.rmUomId));
 */	  	
	  	tr.append($('<td></td>').html(item.rmWeight));
	  	
	  	tr.append($('<td></td>').html(item.rmQty));
	  	
	  	tr.append($('<td></td>').html(item.noOfPiecesPerItem));

	  	
	 	tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=editItemDetail("+key+")> <abbr title='edit'> <i class='fa fa-edit  fa-lg' ></i></abbr> </a> <a href='#' class='action_btn'onclick=deleteItemDetail("+key+ ")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
	  
	  //	tr.append($('<td></td>').html());
	  	
		$('#table1 tbody').append(tr);
	 }
	 }); 
	
	});
 }
	 document.getElementById("rm_weight").value="";
	 document.getElementById("rm_type").selectedIndex = "0"; 
		var html = '<option value="0" selected >Select Raw Material</option>';
		html += '</option>';
		$('#rm_id').html(html);
		$("#rm_id").trigger("chosen:updated");
	 document.getElementById("rm_id").selectedIndex = "0"; 
	 
	 document.getElementById("rm_qty").value="";
	 document.getElementById("base_qty").value ="";
	 document.getElementById("rm_group").selectedIndex = "0";  
	 document.getElementById("rm_cat").selectedIndex = "0";  

	}
});

});
$(document).ready(function() {
	$("#cancel").click(function() {
		 document.getElementById("rm_weight").value="";
		 document.getElementById("rm_type").selectedIndex = "0"; 
			var html = '<option value="0" selected >Select Raw Material</option>';
			html += '</option>';
			$('#rm_id').html(html);
			$("#rm_id").trigger("chosen:updated");
		 document.getElementById("rm_id").selectedIndex = "0"; 
		 document.getElementById("rm_qty").value="";
		 document.getElementById("base_qty").value ="";
		 document.getElementById("rm_group").selectedIndex = "0";  
		 document.getElementById("rm_cat").selectedIndex = "0";  
	});
});

function editScheduleDetail(token){
 
	editFlag=true;
	$.getJSON('${editScheduleDetail}', {
		
		key:token,
		ajax : 'true',

	}, function(data) {
	   
		var len = data.length;

		 document.getElementById("rm_group").disabled = true;
		 document.getElementById("rm_cat").disabled = true;
		         document.getElementById("rm_weight").value=data.rmWeight;
				 document.getElementById("rm_qty").value=data.rmQty;
				 document.getElementById("rm_type").options.selectedIndex =data.rmType;
				 document.getElementById("base_qty").value =data.noOfPiecesPerItem;
				 document.getElementById("rm_id").options.selectedIndex =data.rmId;
				 key1=token;
				 
					appendRmItem(data.rmId);

		});
	
	
}
function validation() {
	
	var eventId = $("#eventId").val();
	var date = $("#date").val();
	var day = $("#day").val();
	var numbers = /^[0-9]+$/; 
	var topic = $("#topic").val();
	var speaker = $("#speaker").val();
	var fromTime = $("#fromTime").val();
	var toTime = $("#toTime").val();
	var venue = $("#venue").val();
	var availSeat = $("#availSeat").val();
	
	var isValid = true;
	if (date==""||date==null) { 
		isValid = false;
		alert("Please Select Date");
	} else if (eventId ==""||eventId==null) {
		isValid = false;
		alert("Please Select Event ");
	}else if (day == ""||day==null) {
		isValid = false;
		alert("Please Enter Day");
	}
	else if (topic == ""||topic==null) {
		isValid = false;
		alert("Please Enter Topic");
	}else if (speaker == ""||speaker==null) {
		isValid = false;
		alert("Please Enter Speaker");
	}else if (fromTime == ""||fromTime==null) {
		isValid = false;
		alert("Please Enter From Time");
	}else if (toTime == ""||toTime==null) {
		isValid = false;
		alert("Please Enter To Time");
	}else if (venue == ""||venue==null) {
		isValid = false;
		alert("Please Enter Venue");
	}
	else if (availSeat == ""||availSeat=='0'||isNaN(availSeat) ) {
		isValid = false;
		alert("Please Enter Available Seats");
	}
	return isValid;
}

</script>
<script type="text/javascript">
function deleteScheduleDetail(key){
	var isDel=confirm('Are you sure want to delete this record');
	if(isDel==true)
	{
	$.getJSON('${deleteScheduleDetail}', {
		
		key:key,
	
		ajax : 'true',

	}, function(data) {
		
		 //$('#loader').hide();
		var len = data.length;

		//alert(len);

		$('#table1 td').remove();

		$.each(data,function(key, schedule) {
			
	if(schedule.delStatus==0)
	{
			
		var tr = $('<tr></tr>');

	  	tr.append($('<td></td>').html(key+1));

	  	tr.append($('<td></td>').html(schedule.date));

	  	tr.append($('<td></td>').html(schedule.eventName));
  	
		tr.append($('<td></td>').html(schedule.day));
	  	
	  	tr.append($('<td></td>').html(schedule.topic));
	  	
	  	tr.append($('<td></td>').html(schedule.speaker));
	  	
	  	tr.append($('<td></td>').html(schedule.fromTime));

	  	
	  	tr.append($('<td></td>').html(schedule.toTime));
	  	
	  	tr.append($('<td></td>').html(schedule.venue));

	  	tr.append($('<td></td>').html(schedule.availableSeats));


	 	tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=editScheduleDetail("+key+")> <abbr title='edit'> <i class='fa fa-edit  fa-lg' ></i></abbr> </a> <a href='#' class='action_btn'onclick=deleteScheduleDetail("+key+ ")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
	  
	  //	tr.append($('<td></td>').html());
	  	
		$('#table1 tbody').append(tr);

	}
		})
		
		});
	}
	else
		{
		isDel=false;
		}
}
</script>
</body>
</html>