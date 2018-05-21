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

						<i class="fa fa-file-o"></i>Add Exhibitor

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Exhibitor
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/exhibitorList"> Exhibitor List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertExhibitor"
								method="post">

								<div class="box-content"> 
								
									<div class="col-md-2">Exhibitor Name*</div>
									<div class="col-md-3">
										<input type="text" id="exhibitorName" name="exhibitorName"
											class="form-control" value="${editExhibitor.exhName}"
											placeholder=" Exhibitor Name " required /> 
											<input type="hidden" name="exhId" value="${editExhibitor.exhId}" />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Company Name*</div>
									<div class="col-md-3">
										<input type="text" name="compnyName"
											value="${editExhibitor.exhCompany}" class="form-control"
											placeholder="Company Name" required />
									</div>
									
									 
								</div>
								<br>
 
								<div class="box-content">
								
								<div class="col-md-2">Company Type*</div>
									<div class="col-md-3">
										<select  name="companyTypeId" id="companyTypeId" class="form-control" required >
											<option value="">select</option>
										 <c:forEach items="${companyTypeList}" var="companyTypeList" >
										 	<c:choose>
										 		<c:when test="${companyTypeList.companyTypeId==editExhibitor.companyTypeId}">
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
									<div class="col-md-2">About Company*</div>
									<div class="col-md-3">
										<textarea  name="aboutCompany" class="form-control"
											placeholder="About Company" required />${editExhibitor.aboutCompany}</textarea>
											 

									</div><br>
									<div class="col-md-1"></div>
 
								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Contact Person1*</div>
									<div class="col-md-3">
										<input type="text" name="pers1"
											value="${editExhibitor.contactPersonName1}" class="form-control"
											placeholder="Contact Person"   
											required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2"> Contact Person2*</div>
									<div class="col-md-3">
										<input type="text" id="pers2" name="pers2"
											 value="${editExhibitor.contactPersonName2 }" class="form-control"
											placeholder="Contact Person " required>

									</div>


								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Person1 Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="mob1"
											value="${editExhibitor.personMob1}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Person2 Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="mob2"
											value="${editExhibitor.personMob2}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />

									</div>


								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Person1 Email*</div>
									<div class="col-md-3">
										<input type="email" name="email1"
											value="${editExhibitor.personEmail2}" class="form-control"
											placeholder="Email"  required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Person2 Email*</div>
									<div class="col-md-3">
										<input type="email" name="email2"
											value="${editExhibitor.personEmail2}" class="form-control"
											placeholder="Email" required />

									</div>


								</div>
								<br>
								  
								  <div class="box-content">

									<div class="col-md-2">Latitude*</div>
									<div class="col-md-3">
										<input type="text" name="latitude"
											value="${editExhibitor.compLat}" class="form-control"
											placeholder="Latitude"  required />

									</div>
 
									<div class="col-md-1"></div>
									<div class="col-md-2">Longitude*</div>
									<div class="col-md-3">
										<input type="text" name="longitude"
											value="${editExhibitor.compLong}" class="form-control"
											placeholder="Longitude" required />

									</div>


								</div>
								<br>
								 
								<div class="box-content">

									<div class="col-md-2">Address*</div>
									<div class="col-md-3">
										<input type="text" name="address"
											value="${editExhibitor.address}" class="form-control"
											placeholder="Address"  required />

									</div>
  
									<div class="col-md-1"></div>
									<div class="col-md-2">Select Location*</div>
									<div class="col-md-3">
										<select  name="location" class="form-control" required >
										<option value="">select</option>
										  
										 
										  <c:forEach items="${locationList}" var="locationList" >
										<c:choose>
											<c:when test="${locationList.locationId==editExhibitor.locationId}">
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

									<div class="col-md-2">Mobile No*</div>
									<div class="col-md-3">
										<input type="text" name="usesrMob"
											value="${editExhibitor.userMob}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />

									</div>
 
									<div class="col-md-1"></div>
									<div class="col-md-2">Password*</div>
									<div class="col-md-3">
										<input type="password" name="password"
											value="${editExhibitor.password}" class="form-control"
											placeholder="Password" required />

									</div>


								</div><br>
								
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