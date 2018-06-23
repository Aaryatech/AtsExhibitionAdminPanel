<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getMixingListWithDate" value="/getMixingListWithDate"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>
	<c:url var="organiserMobileNo" value="/organiserMobileNo"></c:url>

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

						<i class="fa fa-file-o"></i>
						<c:choose>
							<c:when test="${isEdit==1}">Edit Organizer</c:when>
							<c:otherwise>Add Organizers</c:otherwise>
						</c:choose>

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
									<c:when test="${isEdit==1}">Edit Organizer</c:when>
									<c:otherwise>Add Organizer</c:otherwise>
								</c:choose>
							</h3>

							<div class="box-tool">
								<c:choose>
									<c:when test="${userType==0}">
										<a href="${pageContext.request.contextPath}/orgnizerList">
											Organizer List</a>
										<a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
									</c:when>

								</c:choose>

							</div>
						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertOrganizer"
								method="post" enctype="multipart/form-data">

								<div class="box-content">

									<div class="col-md-2">Organizer Name*</div>
									<div class="col-md-3">
										<input type="text" id="orgName" name="orgName"
											class="form-control" value="${editOrganiser.orgName}"
											placeholder=" Organizer Name " required
											oninvalid="this.setCustomValidity('Enter Organizer Name')"
											oninput="this.setCustomValidity('')" /> <input
											maxlength="50" type="hidden" name="orgId"
											value="${editOrganiser.orgId}" />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Organizer Address*</div>
									<div class="col-md-3">
										<input type="text" name="orgAdd"
											value="${editOrganiser.orgAddress}" class="form-control"
											maxlength="50" placeholder="Organizer Address" required
											oninvalid="this.setCustomValidity('Enter Organizer Address')"
											oninput="this.setCustomValidity('')" />
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Contact No.*</div>
									<div class="col-md-3">
										<input type="text" name="contNo" id="contNo"
											value="${editOrganiser.orgContactNo}" class="form-control"
											maxlength="10" placeholder="Contact No" autofocus
											pattern="^(\+\d{1,3}[- ]?)?\d{10}$"
											title="Enter 10 digit mobile number" required
											oninvalid="this.setCustomValidity('Enter Organizer Mobile No')"
											oninput="this.setCustomValidity('')" />

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">E-Mail*</div>
									<div class="col-md-3">
										<input type="email" name="email" placeholder="Email"
											value="${editOrganiser.orgEmailId}" id="email"
											class="form-control " required
											oninvalid="this.setCustomValidity('Enter Organizer EmailId')"
											oninput="this.setCustomValidity('')" />
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Website Link</div>
									<div class="col-md-3">
										<input type="text" name="webLink"
											value="${editOrganiser.websiteLink}" class="form-control"
											placeholder="Website Link" />
									</div>
									<div class="col-md-1"></div>

									<div class="col-md-2">Work, Area*</div>
									<div class="col-md-3">
										<input type="text" name="workArea" maxlength="50"
											value="${editOrganiser.workAreaKeywords}"
											class="form-control" placeholder="Work Area" required
											oninvalid="this.setCustomValidity('Enter Work Area')"
											oninput="this.setCustomValidity('')" />

									</div>



								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Color1*</div>
									<div class="col-md-3">
										<input type="color" name="color1"
											value="${editOrganiser.color1}" class="form-control"
											placeholder="Color" />
									</div>
									<div class="col-md-1"></div>

									<div class="col-md-2">Color2*</div>
									<div class="col-md-3">
										<input type="color" name="color2" maxlength="50"
											value="${editOrganiser.color2}" class="form-control"
											placeholder="Color" required
											oninvalid="this.setCustomValidity('Fill Color')"
											oninput="this.setCustomValidity('')" />

									</div>



								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Color3*</div>
									<div class="col-md-3">
										<input type="color" name="color3"
											value="${editOrganiser.color3}" class="form-control"
											placeholder="Color" />
									</div>
									<div class="col-md-1"></div>

									<div class="col-md-2">Color4*</div>
									<div class="col-md-3">
										<input type="color" name="color4" maxlength="50"
											value="${editOrganiser.color4}" class="form-control"
											placeholder="Color" required
											oninvalid="this.setCustomValidity('Fill Color')"
											oninput="this.setCustomValidity('')" />

									</div>



								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">User Type*</div>
									<div class="col-md-3">
										<select id="orgType" name="orgType"
											class="form-control chosen" required>
											<option value="">Select User Type</option>
											<c:choose>
												<c:when test="${editOrganiser.orgType==0}">
													<option value="0" selected>Super Admin</option>
													<option value="1">Regular</option>
												</c:when>
												<c:when test="${editOrganiser.orgType==1}">
													<option value="0">Super Admin</option>
													<option value="1" selected>Regular</option>
												</c:when>
												<c:otherwise>
													<option value="0">Super Admin</option>
													<option value="1">Regular</option>
												</c:otherwise>
											</c:choose>

										</select>
									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Location*</div>
									<div class="col-md-3">
										<select name="location" id="location"
											class="form-control chosen" required>
											<option value="">Select Location</option>


											<c:forEach items="${locationList}" var="locationList">
												<c:choose>
													<c:when
														test="${locationList.locationId==editOrganiser.locationId}">
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
										<c:choose>
											<c:when test="${isEdit==1}">
												<input type="text" name="mob" id="mob"
													value="${editOrganiser.userMob}" class="form-control"
													placeholder="Mobile No" autofocus onkeyup="checkMobileNo()"
													pattern="^(\+\d{1,3}[- ]?)?\d{10}$"
													title="Enter 10 digit mobile number" readonly />

											</c:when>
											<c:otherwise>
												<input type="text" name="mob" id="mob"
													value="${editOrganiser.userMob}" class="form-control"
													placeholder="Mobile No" autofocus onkeyup="checkMobileNo()"
													maxlength="10" pattern="^(\+\d{1,3}[- ]?)?\d{10}$"
													title="Enter 10 digit mobile number" required />

											</c:otherwise>
										</c:choose>

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Password*</div>
									<div class="col-md-3">
										<input type="text" id="password" name="password"
											value="${editOrganiser.userPassword }" class="form-control"
											placeholder="Password "
											oninvalid="this.setCustomValidity('Enter Menember Name')"
											oninput="this.setCustomValidity('')" requirde
											oninvalid="this.setCustomValidity('Enter Password')"
											oninput="this.setCustomValidity('')" />

									</div>

									<br>
								</div>
								<div class="box-content">
									<div class="col-md-2">About Organization*</div>
									<div class="col-md-3">
										<textarea name="aboutOrg" class="form-control" rows="3"
											maxlength="100" placeholder="About Organization" required>${editOrganiser.aboutOrg}</textarea>

									</div>
									<br>
								</div>
								<br> <br> <br>
								<div class="box-content">
									<div class="form-group">
										<div class="col-md-2">Image</div>
										<div class="col-md-3">
											<div class="fileupload fileupload-new"
												data-provides="fileupload">
												<div class="fileupload-new img-thumbnail"
													style="width: 150px; height: 150px;">
													<img src="${imageUrl}${editOrganiser.orgImage}"
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
														oninvalid="this.setCustomValidity('Select Organizer Image Here')"
														oninput="this.setCustomValidity('')"
														/
														class="file-input" name="documentFile"
														id="documentFile" /></span> <a href="#"
														class="btn btn-default fileupload-exists"
														data-dismiss="fileupload">Remove</a>

												</div>
											</div>
											<input class="form-control" id="docPath"
												placeholder="Current Km" value="${editOrganiser.orgImage}"
												size="16" type="hidden" name="docPath" />
										</div>

									</div>

								</div>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<c:choose>
											<c:when test="${isEdit==1}">
												<input type="submit" class="btn btn-info" value="Submit"
													onclick="check();" id="submit">
											</c:when>
											<c:otherwise>
												<input type="submit" class="btn btn-info" value="Submit"
													onclick="check();" id="submit" disabled>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${userType==0}">
												<a href="${pageContext.request.contextPath}/orgnizerList">
													<input type="button" class="btn btn-default" value="Cancel"
													id="Cancel">
												</a>
											</c:when>

										</c:choose>



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
		$('#contNo')
				.on(
						'input',
						function(e) {
							this.setCustomValidity('')
							if ($(this).val().length > 10) {
								this
										.setCustomValidity('Please enter 10 digit valid mobile No.')
							}
							// e.target.checkValidity()
							this.reportValidity();
						})
		$('#mob')
				.on(
						'input',
						function(e) {
							this.setCustomValidity('')
							if ($(this).val().length > 10) {
								this
										.setCustomValidity('Please enter 10 digit valid mobile No.')
							}
							// e.target.checkValidity()
							this.reportValidity();
						})

		function check() {

			var orgType = document.getElementById("orgType").value;
			var location = document.getElementById("location").value;

			if (orgType == "" || orgType == null) {
				alert("Select User Type");
			} else if (location == "" || location == null) {
				alert("Select Location");
			}
		}
	</script>

	<script type="text/javascript">
		function checkMobileNo() {

			var userMob = $('#mob').val();

			if (userMob.length == 10) {

				$.getJSON('${organiserMobileNo}', {
					userMob : userMob,

					ajax : 'true'
				}, function(data) {

					/* 				document.getElementById("").value = data; */
					if (data.orgId == 0) {
						document.getElementById("submit").disabled = false;
					} else {
						document.getElementById("submit").disabled = true;
						alert("Mobile Already Register ");
					}
				});
			}
		}
	</script>

</body>
</html>