<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!--  <style>
.container {
	margin-top: 1px;
}

.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.image-preview-input-title {
	margin-left: 2px;
}
</style>  -->
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

						<i class="fa fa-file-o"></i>Add Sponsor

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Sponsor
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addSponsor">Sponsor
									List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form action="${pageContext.request.contextPath}/insertSponsor"
								method="post" enctype="multipart/form-data">

								<div class="box-content">
									<div class="col-md-2">Sponsor Name*</div>
									<div class="col-md-3">
										<input type="text" id="sponsorName" name="sponsorName"
											class="form-control" value="${sponsor.name}"
											placeholder="Sponsor Name " required
											oninvalid="this.setCustomValidity('Enter Sponsor Name')"
											oninput="this.setCustomValidity('')" /> <input type="hidden"
											name="sponsorId" id="sponsorId" value="${sponsor.sponsorId}" />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Event*</div>
									<div class="col-md-3">
										<select id="eventId" name="eventId" class="form-control"
											required
											oninvalid="this.setCustomValidity('Please Select Event')"
											oninput="this.setCustomValidity('')">
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

									<div class="col-md-2">Company*</div>
									<div class="col-md-3">
										<select id="companyId" name="companyId" class="form-control"
											required>
											<option value="">Select Company</option>
											<c:forEach items="${companyList}" var="company">
												<c:choose>
													<c:when test="${sponsor.companyId==company.companyTypeId}">
														<option value="${company.companyTypeId}" selected>${company.companyTypeName}</option>
													</c:when>
													<c:otherwise>
														<option value="${company.companyTypeId}">${company.companyTypeName}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</select>
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Designation*</div>
									<div class="col-md-3">
										<input type="text" name="designation"
											value="${sponsor.designation}" class="form-control"
											placeholder="Designation" required
											oninvalid="this.setCustomValidity('Enter Designation')"
											oninput="this.setCustomValidity('')" />
									</div>
								</div>
								<br>
								<div class="box-content">
									<div class="col-md-2">Mobile No.*</div>
									<div class="col-md-3">
										<input type="text" name="mobile" value="${sponsor.mobile}"
											class="form-control" placeholder="Mobile No"
											pattern="^\d{10}$" required
											oninvalid="this.setCustomValidity('Enter Sponsor Mobile No')"
											oninput="this.setCustomValidity('')" />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Email*</div>
									<div class="col-md-3">
										<input type="email" name="emailId" id="emailId"
											value="${sponsor.email}" class="form-control"
											placeholder="Email" required
											oninvalid="this.setCustomValidity('Enter Sponsor Email Id')"
											oninput="this.setCustomValidity('')" />
									</div>
								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Website*</div>
									<div class="col-md-3">
										<input type="text" name="website" value="${sponsor.website}"
											class="form-control" placeholder="Website Link" required
											oninvalid="this.setCustomValidity('Enter Website Link')"
											oninput="this.setCustomValidity('')" />
									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Remark</div>
									<div class="col-md-3">
										<input type="text" name="remark" value="${sponsor.remark}"
											class="form-control" placeholder="Remark" required
											oninvalid="this.setCustomValidity('Enter Remark')"
											oninput="this.setCustomValidity('')" />

									</div>
								</div>
								<br>
								<div class="box-content">

									<div class="col-md-2">Photo *</div>

									<div class="col-md-3">
										<div class="fileupload fileupload-new"
											data-provides="fileupload">
											<div class="fileupload-new img-thumbnail"
												style="width: 250px; height: 70px;">
												<img src="${sponserImage}${sponsor.photo}"
													onerror="this.src='http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image"
													alt="" />
											</div>
											<div
												class="fileupload-preview fileupload-exists img-thumbnail"
												style="max-width: 230px; max-height: 150px; line-height: 20px;"></div>
											<div>
												<span class="btn btn-default btn-file"><span
													class="fileupload-new">Select image</span> <span
													class="fileupload-exists">Change</span> <input type="file"
													oninvalid="this.setCustomValidity('Please Insert Image Here')"
													oninput="this.setCustomValidity('')" class="file-input"
													name="img1" id="img1" /></span> <a href="#"
													class="btn btn-default fileupload-exists"
													data-dismiss="fileupload">Remove</a>

											</div>
										</div>


									</div>
									<div class="col-md-1"></div>
									<br>

									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit">

									</div>
							</form>
						</div>
						<!-- BEGIN Main Content -->


						<div class="box" id="pending">

							<div class="box-content">

								<br />
								<div class="clearfix"></div>
								<div class="table-responsive" style="border: 0">
									<table class="table table-advance" id="table1">
										<thead>
											<tr>
												<th style="width: 18px">No</th>
												<th class="col-md-1">Sponsor Name</th>
												<th class="col-md-1">Event</th>
												<th class="col-md-1">Company</th>
												<th class="col-md-1">Designation</th>
												<th class="col-md-1">Mobile</th>
												<th class="col-md-3">Photo</th>
												<th class="col-md-1">Email</th>
												<th class="col-md-2">Website</th>
												<th class="col-md-2">Remark</th>
												<th class="col-md-1">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${sponsorList}" var="sponsorRes"
												varStatus="count">
												<tr class="table-flag-blue">
													<td>${count.index+1}</td>
													<td>${sponsorRes.name}</td>
													<td>${sponsorRes.eventName}</td>
													<td>${sponsorRes.company}</td>
													<td>${sponsorRes.designation}</td>
													<td>${sponsorRes.mobile}</td>
													<td class="col-md-4"><img
														src="${sponserImage}${sponsorRes.photo}"
														alt="no image available" height="100" width="100"></img></td>
													<td>${sponsorRes.email}</td>
													<td>${sponsorRes.website}</td>
													<td>${sponsorRes.remark}</td>

													<td><a
														href="${pageContext.request.contextPath}/editSponsor/${sponsorRes.sponsorId}"><span
															class="glyphicon glyphicon-edit"></span></a> <a
														href="${pageContext.request.contextPath}/deleteSponsor/${sponsorRes.sponsorId}"
														onClick="return confirm('Are you sure want to delete this record');"><span
															class="glyphicon glyphicon-remove"></span></a></td>
												</tr>
											</c:forEach>


										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

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
	<!-- 	<script type="text/javascript">

		$(document).on('click', '#close-preview', function(){ 
		    $('.image-preview').popover('hide');
		    // Hover befor close the preview
		    $('.image-preview').hover(
		        function () {
		           $('.image-preview').popover('show');
		        }, 
		         function () {
		           $('.image-preview').popover('hide');
		        }
		    );    
		});

		$(function() {
		    // Create the close button
		    var closebtn = $('<button/>', {
		        type:"button",
		        text: 'x',
		        id: 'close-preview',
		        style: 'font-size: initial;',
		    });
		    closebtn.attr("class","close pull-right");
		    // Set the popover default content
		    $('.image-preview').popover({
		        trigger:'manual',
		        html:true,
		        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
		        content: "There's no image",
		        placement:'bottom'
		    });
		    // Clear event
		    $('.image-preview-clear').click(function(){
		        $('.image-preview').attr("data-content","").popover('hide');
		        $('.image-preview-filename').val("");
		        $('.image-preview-clear').hide();
		        $('.image-preview-input input:file').val("");
		        $(".image-preview-input-title").text("Browse"); 
		    }); 
		    // Create the preview image
		    $(".image-preview-input input:file").change(function (){     
		        var img = $('<img/>', {
		            id: 'dynamic',
		            width:250,
		            height:200
		        });      
		        var file = this.files[0];
		        var reader = new FileReader();
		        // Set preview image into the popover data-content
		        reader.onload = function (e) {
		            $(".image-preview-input-title").text("Change");
		            $(".image-preview-clear").show();
		            $(".image-preview-filename").val(file.name);            
		            img.attr('src', e.target.result);
		            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
		        }        
		        reader.readAsDataURL(file);
		    });  
		});
		</script> -->


</body>
</html>