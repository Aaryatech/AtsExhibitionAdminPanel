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

						<i class="fa fa-file-o"></i> Event

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>
								<c:choose>
									<c:when test="${isEdit==1}">Edit Event</c:when>
									<c:otherwise>Add Event</c:otherwise>
								</c:choose>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showEventList">
									Event List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertEventByAdmin"
								method="post" enctype="multipart/form-data">

								<div class="box-content">

									<div class="col-md-2">Event Name*</div>
									<div class="col-md-3">
										<input type="text" id="eventName" name="eventName"
											class="form-control" value="${editEvent.eventName}"
											placeholder=" Event Name " required /> <input type="hidden"
											name="eventId" value="${editEvent.eventId}" />
										<%-- <input type="hidden" name="orgId" value="${editEvent.orgId}" /> --%>
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Organizer Name</div>
									<div class="col-md-3">
										<select name="orgId" id="orgId" class="form-control chosen"
											required>
											<option value="">Select Organizer</option>
											<c:forEach items="${organiserList}" var="organiserList">
												<c:choose>
													<c:when test="${organiserList.orgId==editEvent.orgId}">
														<option value="${organiserList.orgId}" selected>${organiserList.orgName}</option>
													</c:when>
													<c:otherwise>
														<option value="${organiserList.orgId}"> ${organiserList.orgName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</select>

									</div>

								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">From Date*</div>
									<div class="col-md-3">
										<input type="text" name="fromDate"
											value="${editEvent.eventFromDate}"
											class="form-control date-picker" placeholder="From Date"
											required />
									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">To Date*</div>
									<div class="col-md-3">
										<input type="text" name="toDate"
											value="${editEvent.eventToDate}"
											class="form-control date-picker" placeholder="To Date"
											required />
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">From Time*</div>
									<div class="col-md-3">
										<input type="time" name="fromTime"
											value="${editEvent.fromTime}" class="form-control"
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
										<input type="time" name="toTime" value="${editEvent.toTime}"
											class="form-control" placeholder="To Time" required />

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
										<textarea name="aboutEvent" class="form-control"
											placeholder="About Event" required>${editEvent.aboutEvent}</textarea>


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Event Location*</div>
									<div class="col-md-3">
										<textarea name="eventLocation" class="form-control"
											placeholder="Event Location" required>${editEvent.eventLocation}</textarea>
									</div>


									<br>
								</div>
								<br><br>

								<div class="box-content">

									<div class="col-md-2">Contact Person1*</div>
									<div class="col-md-3">
										<input type="text" name="pers1"
											value="${editEvent.contactPersonName1}" class="form-control"
											placeholder="Contact Person1" required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Contact Person2*</div>
									<div class="col-md-3">
										<input type="text" id="pers2" name="pers2"
											value="${editEvent.contactPersonName2 }" class="form-control"
											placeholder="Contact Person2 " required>

									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Person1 Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="mob1" id="mob1"
											value="${editEvent.person1Mob}" class="form-control"
											placeholder="Person1 Contact No." autofocus
											pattern="^(\+\d{1,3}[- ]?)?\d{10}$"
											title="Enter 10 digit mobile number" required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Person2 Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="mob2" id="mob2"
											value="${editEvent.person2Mob}" class="form-control"
											placeholder="Person2 Contact No." autofocus
											pattern="^(\+\d{1,3}[- ]?)?\d{10}$"
											title="Enter 10 digit mobile number" required />

									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Person1 Email*</div>
									<div class="col-md-3">
										<input type="email" name="email1"
											value="${editEvent.person1EmailId}" class="form-control"
											placeholder="Person1 Email" required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Person2 Email*</div>
									<div class="col-md-3">
										<input type="email" name="email2"
											value="${editEvent.person2EmailId}" class="form-control"
											placeholder="Person2 Email" required />

									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Stall Size *</div>
									<div class="col-md-3">
										<input type="text" name="stall_size"
											value="${editEventSup.stallSize}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" class="form-control"
											placeholder="Stall Size" required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Price For Exhibitor*</div>
									<div class="col-md-3">
										<input type="text" name="price_for_exh" id="price_for_exh"
											onchange="calcDisc()" class="form-control"
											placeholder="Price For Exhibitor" value="${editEventSup.priceForExh}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" required />

									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Discount % for Exhibitor</div>
									<div class="col-md-3">
										<input type="text" name="disc_per" id="disc_per"
											onchange="calcDisc()" value="${editEventSup.discPer}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" class="form-control"
											placeholder="Discount %" required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Disounted Price</div>
									<div class="col-md-3">
										<input type="text" name="disc_price" id="disc_price"
											value="${editEventSup.discountedPrice}" class="form-control" readonly="readonly"
											placeholder="Disounted Price"
											pattern="[+-]?([0-9]*[.])?[0-9]+" required />

									</div>

								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Latitude*</div>
									<div class="col-md-3">
										<input type="text" name="latitude"
											value="${editEvent.eventLocLat}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" class="form-control"
											placeholder="Latitude" required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Longitude*</div>
									<div class="col-md-3">
										<input type="text" name="longitude"
											value="${editEvent.eventLocLong}" class="form-control"
											placeholder="Longitude" pattern="[+-]?([0-9]*[.])?[0-9]+"
											required />

									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Company Type*</div>
									<div class="col-md-3">
										<select name="companyTypeId" id="companyTypeId"
											class="form-control chosen" required>
											<option value="">select</option>
											<c:forEach items="${companyTypeList}" var="companyTypeList">
												<c:choose>
													<c:when
														test="${companyTypeList.companyTypeId==editEvent.companyTypeId}">
														<option value="${companyTypeList.companyTypeId}" selected>${companyTypeList.companyTypeName}</option>
													</c:when>
													<c:otherwise>
														<option value="${companyTypeList.companyTypeId}"> ${companyTypeList.companyTypeName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>

									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Select Location*</div>
									<div class="col-md-3">
										<select name="location" id="location"
											class="form-control chosen" required>
											<option value="">select</option>

											<c:forEach items="${locationList}" var="locationList">
												<c:choose>
													<c:when
														test="${locationList.locationId==editEvent.locationId}">
														<option value="${locationList.locationId}" selected>${locationList.locationName}</option>
													</c:when>
													<c:otherwise>
														<option value="${locationList.locationId}">${locationList.locationName}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>

										</select>

									</div>

								</div>
								<br>

								<div class="box-content">
									<div class="form-group">
										<div class="col-md-2">Image</div>
										<div class="col-md-3">
											<div class="fileupload fileupload-new"
												data-provides="fileupload">
												<div class="fileupload-new img-thumbnail"
													style="width: 150px; height: 150px;">
													<img src="${imageUrl}${editEvent.eventLogo}"
														onerror="this.src='http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image"
														alt="" />
												</div>
												<div
													class="fileupload-preview fileupload-exists img-thumbnail"
													style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
												<div>
													<span class="btn btn-default btn-file"><span
														class="fileupload-new">Select image</span> <span
														class="fileupload-exists">Change</span> <input type="file"
														class="file-input" name="documentFile" id="documentFile" /></span>
													<a href="#" class="btn btn-default fileupload-exists"
														data-dismiss="fileupload">Remove</a>

												</div>
											</div>
											<input class="form-control" id="docPath"
												placeholder="Current Km" value="${editEvent.eventLogo}"
												size="16" type="hidden" name="docPath" />
										</div>

									</div>

								</div>



								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>

								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="Submit"
											onclick="check();" id="submit"> <a
											href="${pageContext.request.contextPath}/showEventList">
											<input type="button" class="btn btn-default" value="Cancel"
											id="Cancel">
										</a>

									</div>
								</div>
							</form>


						</div>
					</div>


				</div>
			</div>
			<!-- END Main Content -->
			<footer>
				<p>2018 © AARYATECH SOLUTIONS</p>
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
		  $('#mob1').on('input', function(e) {
			   this.setCustomValidity('')
			     if ($(this).val().length>10) {
			       this.setCustomValidity('Please enter 10 digit valid mobile No.')
			     }
			     // e.target.checkValidity()
			     this.reportValidity();
			   })
			    $('#mob2').on('input', function(e) {
			   this.setCustomValidity('')
			     if ($(this).val().length>10) {
			       this.setCustomValidity('Please enter 10 digit valid mobile No.')
			     }
			     // e.target.checkValidity()
			     this.reportValidity();
			   })
			   
			  function check() {
			   
			var companyTypeId = document.getElementById("companyTypeId").value;
			var location = document.getElementById("location").value;
			var orgId = document.getElementById("orgId").value;
			
			if (orgId == "" || orgId == null) {
				 alert("Select Organisation");
			}
			else if (companyTypeId == "" || companyTypeId == null) {
				 alert("Select Company Type");
			}
			else if(location == "" || location == null)
				{
					 alert("Select Location");
				}
		}
	</script>

	<script type="text/javascript">
	
	function calcDisc() {
		//alert("Hi");
		var discPer = document.getElementById("disc_per").value;
		//alert("Per" + discPer);
		var price = document.getElementById("price_for_exh").value;

		var disAmt=price*discPer/100;
		
		var discPrice=price-disAmt;
		 document.getElementById("disc_price").value=discPrice;
		//alert("disAmt" +disAmt );
		
	}
	</script>


</body>
</html>