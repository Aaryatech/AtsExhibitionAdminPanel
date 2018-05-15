<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

						<i class="fa fa-file-o"></i>Add Organizer

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Organizer
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/orgnizerList"> Organizer List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertOrganizer"
								method="post">

								<div class="box-content"> 
								
									<div class="col-md-2">Organizer Name*</div>
									<div class="col-md-3">
										<input type="text" id="orgName" name="orgName"
											class="form-control" value="${editOrganiser.orgName}"
											placeholder=" Organizer Name " required /> 
											<input type="hidden" name="orgId" value="${editOrganiser.orgId}" />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Organizer Address*</div>
									<div class="col-md-3">
										<input type="text" name="orgAdd"
											value="${editOrganiser.orgAddress}" class="form-control"
											placeholder="Organizer Address" required />
									</div>
									
									 
								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="contNo"
											value="${editOrganiser.orgContactNo}" class="form-control"
											placeholder="Contact No"   pattern="^\d{10}$"
											required />

									</div>
									
									<div class="col-md-1"></div>
									<div class="col-md-2">E-Mail*</div>
									<div class="col-md-3">
										<input type="email" name="email" placeholder="Email"
											value="${editOrganiser.orgEmailId}" id="email"
											class="form-control " required />
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Website Link*</div>
									<div class="col-md-3">
										<input type="text" name="webLink"
											value="${editOrganiser.websiteLink}" class="form-control"
											placeholder="Website Link" required />
									</div>
									<div class="col-md-1"></div>

									<div class="col-md-2">Work Area*</div>
									<div class="col-md-3">
										<input type="text" name="workArea"
											value="${editOrganiser.workAreaKeywords}" class="form-control"
											placeholder="Work Area" required />

									</div>



								</div>
								<br>
								 

								<c:choose>
									<c:when test="${editOrganiser.orgType==0}">
										<c:set var="type" value="ATS"></c:set>
									</c:when>
									<c:when test="${editOrganiser.orgType==1}">
										<c:set var="type" value="OTHER"></c:set>
									</c:when>
								</c:choose>

								<div class="box-content">

									<div class="col-md-2">Organization Type*</div>
									<div class="col-md-3">
										<select id="orgType" name="orgType"  
											class="form-control chosen" required>

											<option value=""></option>
											<option value="${editOrganiser.orgType}" selected>${type}</option>
											<option value="0">ATS</option>
											<option value="1">OTHER</option>
										</select>
									</div>

									<div class="col-md-1"></div> 
									<div class="col-md-2">About Organization*</div>
									<div class="col-md-3">
										<textarea  name="aboutOrg" class="form-control"
											placeholder="About Organization" required />${editOrganiser.aboutOrg}</textarea>

									</div><br>
									 
								</div>
								<br>




								<div class="box-content">

									<div class="col-md-2">Mobile No*</div>
									<div class="col-md-3">
										<input type="text" name="mob"
											value="${editOrganiser.userMob}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2"> Password*</div>
									<div class="col-md-3">
										<input type="password" id="password" name="password"
											 value="${editOrganiser.userPassword }" class="form-control"
											placeholder="Password " required>

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