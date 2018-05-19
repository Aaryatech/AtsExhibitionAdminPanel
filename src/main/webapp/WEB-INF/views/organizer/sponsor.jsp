<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <style>
 .img-upload-btn { 
    position: relative; 
    overflow: hidden; 
    padding-top: 95%;
} 

.img-upload-btn input[type=file] { 
    position: absolute; 
    top: 0; 
    right: 0; 
    min-width: 100%; 
    min-height: 100%; 
    font-size: 100px; 
    text-align: right; 
    filter: alpha(opacity=0); 
    opacity: 0; 
    outline: none; 
    background: white; 
    cursor: inherit; 
    display: block; 
} 

.img-upload-btn i { 
    position: absolute;
    height:36px;
    width: 16px;
    top: 50%;
    left: 50%;
    margin-top: -8px;
    margin-left: -8px;
}

.btn-radio {
    position: relative; 
    overflow: hidden; 
}

.btn-radio input[type=radio] { 
    position: absolute; 
    top: 0; 
    right: 0; 
    min-width: 100%; 
    min-height: 100%; 
    font-size: 100px; 
    text-align: right; 
    filter: alpha(opacity=0); 
    opacity: 0; 
    outline: none; 
    background: white; 
    cursor: inherit; 
    display: block; 
}
 
 </style>
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
								<a href="${pageContext.request.contextPath}/addSponsor">Sponsor List</a> <a data-action="collapse" href="#"><i
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
											placeholder="Sponsor Name " required /> 
											<input type="hidden" name="sponsorId" id="sponsorId" value="${sponsor.sponsorId}" />
									</div>
									 <div class="col-md-1"></div>
									<div class="col-md-2">Event*</div>
									<div class="col-md-3">
										<select id="eventId" name="eventId"  
											class="form-control" required>
                                       <option value="">Select Event</option>
										<c:forEach items="${eventList}" var="eventList" >
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
										<select id="companyId" name="companyId"  
											class="form-control" required>
                                          <option value="">Select Company</option>
										<c:forEach items="${companyList}" var="company" >
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
											placeholder="Designation"  required />
									</div>
								</div> 
								<br>
								<div class="box-content">
                             <div class="col-md-2">Mobile No.*</div>
									<div class="col-md-3">
										<input type="text" name="mobile"
											value="${sponsor.mobile}" class="form-control"
											placeholder="Mobile No"   pattern="^\d{10}$"
											required />
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2"> Email*</div>
									<div class="col-md-3">
										<input type="email" name="emailId" id="emailId"
											value="${sponsor.email}" class="form-control"
											placeholder="Email"  required />
									</div>
								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Website*</div>
									<div class="col-md-3">
										<input type="text" name="website"
											value="${sponsor.website}" class="form-control"
											placeholder="Website Link"  required />
									</div>

									<div class="col-md-1"></div>
										
								</div>
								<br>
								  	<div class="box-content">
                                   <div class="col-md-2">Remark</div>
									<div class="col-md-3">
										<input type="text" name="remark"
											value="${sponsor.remark}" class="form-control"
											placeholder="Remark"  />

									</div>
										<div class="col-md-1"></div>
									<div class="col-md-2">Photo.*</div>	<div class="col-md-3">
                                       <div class="img-picker" style="width: 200px; height: 150px;"></div></div>
							
									</div>
								<br>
									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit"  >

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
									<th>Sponsor Name</th>
									<th>Event</th>
									<th>Company </th>
									<th>Designation</th> 
									<th>Mobile</th>	
									<th>Photo</th>
									<th>Email</th>
									<th>Website</th>
						    		<th>Remark</th>		
						    			<th>Action</th>		
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sponsorList}" var="sponsorRes" varStatus="count">
									<tr class="table-flag-blue">
										<td>${count.index+1}</td>
										<td>${sponsorRes.name}</td>
										<td>${sponsorRes.eventName}</td>
										<td>${sponsorRes.company}</td>
										<td>${sponsorRes.designation}</td>
										<td>${sponsorRes.mobile}</td>
										<td>${sponsorRes.photo}</td>
										<td>${sponsorRes.email}</td>
										<td>${sponsorRes.website}</td>
										<td>${sponsorRes.remark}</td>
										 
										 <td><a href="${pageContext.request.contextPath}/editSponsor/${sponsorRes.sponsorId}"><span
												class="glyphicon glyphicon-edit"></span></a> 
											<a href="${pageContext.request.contextPath}/deleteSponsor/${sponsorRes.sponsorId}"
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
			<p>2018 © SONA ELECTRICALS</p>
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
		(function ( $ ) {
			 
		    $.fn.imagePicker = function( options ) {
		        
		        // Define plugin options
		        var settings = $.extend({
		            // Input name attribute
		            name: "photo",
		            // Classes for styling the input
		            class: "form-control btn btn-default btn-block",
		            // Icon which displays in center of input
		            icon: "glyphicon glyphicon-plus"
		        }, options );
		        
		        // Create an input inside each matched element
		        return this.each(function() {
		            $(this).html(create_btn(this, settings));
		        });
		 
		    };
		 
		    // Private function for creating the input element
		    function create_btn(that, settings) {
		        // The input icon element
		        var picker_btn_icon = $('<i class="'+settings.icon+'"></i>');
		        
		        // The actual file input which stays hidden
		        var picker_btn_input = $('<input type="file" name="'+settings.name+'" />');
		        
		        // The actual element displayed
		        var picker_btn = $('<div class="'+settings.class+' img-upload-btn"></div>')
		            .append(picker_btn_icon)
		            .append(picker_btn_input);
		            
		        // File load listener
		        picker_btn_input.change(function() {
		            if ($(this).prop('files')[0]) {
		                // Use FileReader to get file
		                var reader = new FileReader();
		                
		                // Create a preview once image has loaded
		                reader.onload = function(e) {
		                    var preview = create_preview(that, e.target.result, settings);
		                    $(that).html(preview);
		                }
		                
		                // Load image
		                reader.readAsDataURL(picker_btn_input.prop('files')[0]);
		            }                
		        });

		        return picker_btn
		    };
		    
		    // Private function for creating a preview element
		    function create_preview(that, src, settings) {
		        
		            // The preview image
		            var picker_preview_image = $('<img src="'+src+'" class="img-responsive img-rounded" />');
		            
		            // The remove image button
		            var picker_preview_remove = $('<button class="btn btn-link"><small>Remove</small></button>');
		            
		            // The preview element
		            var picker_preview = $('<div class="text-center"></div>')
		                .append(picker_preview_image)
		                .append(picker_preview_remove);

		            // Remove image listener
		            picker_preview_remove.click(function() {
		                var btn = create_btn(that, settings);
		                $(that).html(btn);
		            });
		            
		            return picker_preview;
		    };
		    
		}( jQuery ));

		$(document).ready(function() {
		    $('.img-picker').imagePicker({name: 'photo'});
		})
	</script>

</body>
</html>