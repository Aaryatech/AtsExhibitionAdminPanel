<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	 
<c:url var="eventListByOrganizerId" value="/eventListByOrganizerId"></c:url> 
<c:url var="sortedExhibitorListByLocationAndCompType" value="/sortedExhibitorListByLocationAndCompType"></c:url> 

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
					<i class="fa fa-file-o"></i>Exhibitor List
				</h1>
				
				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		
		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Exhibitor List
				</h3>
				<div class="box-tool">
				<a href="${pageContext.request.contextPath}/addExhibitorBySuperAdmin">Add Exhibitor</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
				</div>

			</div> 
			
			
				<div class=" box-content">
				 
								
								<div class="box-content">
 
									<div class="col-md-2">Select Location*</div>
									<div class="col-md-3">
										<select id="locationId" name="locationId" class="form-control chosen" multiple="multiple" required >  
										<option value="0" selected>All</option>
										<c:forEach items="${locationList}" var="locationList" >
										 
											<option value="${locationList.locationId}">${locationList.locationName}</option>
											 
											</c:forEach>
											</select>

									</div>
									<div class="col-md-1"></div>
									
									<div class="col-md-2">Select Company Type*</div>
									<div class="col-md-3">
										<select id="compType" name="compType" multiple="multiple" class="form-control chosen" required >  
										<option value="0" selected>All</option>
										<c:forEach items="${companyTypeList}" var="companyTypeList" >
										 
											<option value="${companyTypeList.companyTypeId}">${companyTypeList.companyTypeName}</option>
											 
											</c:forEach>
											</select>

									</div>


								</div>
								<br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="button" class="btn btn-info" value="Search"
										onclick="searchExhibitorList()"	id="search"  >

 

									</div>
								</div>
				 
					 <div class="box-content"> 
					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">
							<thead>
								<tr>
											 
								
									<th style="width: 18px">Sr No</th>
									<th>Exhibitor Name</th>
									 <th>Organizer Name</th>
									 <th>Mobile No.</th>
									 <th>Location</th>
									 <th>Company Type</th>
									 <th>Action</th>
									 
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${exhibitorList}" var="exhibitorList" varStatus="count">
									<tr class="table-flag-blue">
									 
									
										<td>${count.index+1}</td> 
										<td>${exhibitorList.exhName}</td>
										<td>${exhibitorList.orgName}</td>
										<td>${exhibitorList.userMob}</td>	 
										 <td>${exhibitorList.locationName}</td>	
										 <td>${exhibitorList.companyTypeName}</td>	
										  
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div><br>

		</div>
		
				 
	 
	</div>
	 
	</div>
	<!-- END Main Content -->

	<footer>
	<p>2018 © AARYATECH SOLUTIONS</p>
	</footer>

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>

 

	

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
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>
		
		<script type="text/javascript">
		
		function eventListByOrganizerId()
		{
			var orgId=$('#orgId').val();
		   // alert(orgId); 

			$ .getJSON( '${eventListByOrganizerId}',

							{
								 
								 
								orgId : orgId,
								ajax : 'true'

							},
							function(data) { 
								
								var html = '<option value="0" selected>All</option>';
								
								var len = data.length;
								for ( var i = 0; i < len; i++) {
									html += '<option value="' + data[i].eventId + '">'
											+ data[i].eventName + '</option>';
								}
								html += '</option>';
								$('#eventId').html(html);
								$("#eventId").trigger("chosen:updated");
										 
										 
							});
		}
		
		function searchExhibitorList() {
			 
			 
			 
			var locationId = $('#locationId').val();
			var compType = $('#compType').val();
			var valid=0;
			/* if(orgId!="" && orgId!=null)
				{
				window.location.href='${pageContext.request.contextPath}/exhibitorListByOrgId/'+orgId+'';
				
				} */
				 
				 if(locationId==null)
				{
				alert("Select Minimum One Loacation");
				valid=1;
				}
				else if(compType==null)
				{
					alert("Select Minimum One Company Type");
					valid=1;
				}
			if(valid==0)
				{
			$.getJSON('${sortedExhibitorListByLocationAndCompType}',

					{
						 
						 
						compType : compType,
						locationId : locationId,
						ajax : 'true'

					},
					function(data) {
 
						$('#table1 td').remove();
						  
						if (data == "") {
							alert("No records found !!");
							 
						}
					 

					  $.each( data, function(key, itemList) {
						 
										 
										var tr = $('<tr></tr>');
									  	tr.append($('<td></td>').html(key+1)); 
									  	tr.append($('<td></td>').html(itemList.exhName)); 
									  	tr.append($('<td></td>').html(itemList.orgName)); 
									  	tr.append($('<td></td>').html(itemList.userMob));
									  	tr.append($('<td></td>').html(itemList.locationName)); 
									  	tr.append($('<td></td>').html(itemList.companyTypeName)); 
									  	tr.append($('<td ></td>').html("<a href='${pageContext.request.contextPath}/editExhibitorBySuperAdmin/"+itemList.exhId+"' class='action_btn'data-toggle='tooltip' title='Edit'><i class='glyphicon glyphicon-edit'></i></a> " + 
									  			"<a href='${pageContext.request.contextPath}/deleteExhibitorBySuperAdmin/"+itemList.exhId+"' onClick='return confirm('Are you sure want to delete this record'); data-toggle='tooltip' title='Delete''><span class='glyphicon glyphicon-remove'></span></a> "));
									  	 
										$('#table1 tbody').append(tr);
										

									})  
									 
									
					});
			 
				}
	}
		
		</script>
		
</body>
</html>