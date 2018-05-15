<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>


	<c:url var="getMixingListWithDate" value="/getMixingListWithDate"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url> 


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

						<i class="fa fa-file-o"></i>Add Event

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Event
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/eventList"> Event List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertEvent"
								method="post">

								<div class="box-content"> 
								
									<div class="col-md-2">Event Name*</div>
									<div class="col-md-3">
										<input type="text" id="eventName" name="eventName"
											class="form-control" value="${editEvent.eventName}"
											placeholder=" Event Name " required /> 
											<input type="hidden" name="eventId" value="${editEvent.eventId}" />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Event Location*</div>
									<div class="col-md-3">
										<input type="text" name="eventLocation"
											value="${editEvent.eventLocation}" class="form-control"
											placeholder="Event Location" required />
									</div>
									
									 
								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Event From Date*</div>
									<div class="col-md-3">
										<input type="text" name="fromDate"
											value="${editEvent.eventFromDate}" class="form-control date-picker"
											placeholder="From Date" required />
									</div>
									
									<div class="col-md-1"></div>
									<div class="col-md-2">Event To Date*</div>
									<div class="col-md-3">
										<input type="text" name="toDate"
											value="${editEvent.eventToDate}" class="form-control date-picker"
											placeholder="From To" required />
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">From Time*</div>
									<div class="col-md-3">
										<input type="text" name="fromTime"
											value="${editEvent.fromTime}"   class="form-control"
											placeholder="From Time" required />
									</div>
									
									<!-- <div class="col-md-1">
										<select id="orgType" name="orgType"  
											class="form-control" required> 
											<option value="" >Select</option>
											<option value="1" >AM</option>
											<option value="2">PM</option>
										</select>
									</div> -->
									<div class="col-md-1"></div>

									<div class="col-md-2">To Time*</div>
									<div class="col-md-3">
										<input type="text" name="toTime"
											value="${editEvent.toTime}"   class="form-control"
											placeholder="To Time" required />

									</div>
									<!-- <div class="col-md-1">
										<select id="orgType" name="orgType"  
											class="form-control" required> 
											<option value="" >Select</option>
											<option value="1" >AM</option>
											<option value="2">PM</option>
										</select>
									</div> -->
 
								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">About Event*</div>
									<div class="col-md-3">
										<textarea  name="aboutEvent" class="form-control"
											placeholder="About Event" required />${editEvent.aboutEvent}</textarea>
											 

									</div><br>
									<div class="col-md-1"></div>
 
								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Contact Person1*</div>
									<div class="col-md-3">
										<input type="text" name="pers1"
											value="${editEvent.contactPersonName1}" class="form-control"
											placeholder="Contact Person"   
											required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2"> Contact Person2*</div>
									<div class="col-md-3">
										<input type="text" id="pers2" name="pers2"
											 value="${editEvent.contactPersonName2 }" class="form-control"
											placeholder="Contact Person " required>

									</div>


								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Person1 Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="mob1"
											value="${editEvent.person1Mob}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Person2 Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="mob2"
											value="${editEvent.person2Mob}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />

									</div>


								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Person1 Email*</div>
									<div class="col-md-3">
										<input type="email" name="email1"
											value="${editEvent.person1EmailId}" class="form-control"
											placeholder="Email"  required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Person2 Email*</div>
									<div class="col-md-3">
										<input type="email" name="email2"
											value="${editEvent.person2EmailId}" class="form-control"
											placeholder="Email" required />

									</div>


								</div>
								<br>
								  
								  <div class="box-content">

									<div class="col-md-2">Latitude*</div>
									<div class="col-md-3">
										<input type="text" name="latitude"
											value="${editEvent.eventLocLat}" class="form-control"
											placeholder="Latitude"  required />

									</div>
 
									<div class="col-md-1"></div>
									<div class="col-md-2">Longitude*</div>
									<div class="col-md-3">
										<input type="text" name="longitude"
											value="${editEvent.eventLocLong}" class="form-control"
											placeholder="Longitude" required />

									</div>


								</div>
								<br>
								
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit"  >



									</div>
								</div>
							</form>


						</div>
					</div>


				</div>
			</div>
			<!-- END Main Content -->
			<footer>
			<p>2018 © SONA ELECTRICALS</p>
			</footer>

			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->

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
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>


	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>





	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>


	<script type="text/javascript">
		function passwordValidation() {

			var pass = document.getElementById("password").value;
			var pass1 = document.getElementById("rePassword").value;

			if (pass != "" && pass1 != "") {
				if (pass != pass1) {
					alert("Password Not Matched ");
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("submit").disabled = false;

				}

			}
		}
	</script>

</body>
</html>