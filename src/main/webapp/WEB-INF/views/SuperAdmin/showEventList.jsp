<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>


	<c:url var="eventListByOrgId" value="/eventListByOrgId"></c:url>


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
					<i class="fa fa-file-o"></i>Event List
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Event List
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/addOrganizer">Add
						Organizer</a> <a data-action="collapse" href="#"><i
						class="fa fa-chevron-up"></i></a>
				</div>

			</div>
			<div class=" box-content">
			<form id="addSupplier"
								action="${pageContext.request.contextPath}/sumbitMapping"
								method="post">
					<div class="box-content">
 
									<div class="col-md-2">Select Organizer*</div>
									<div class="col-md-3">
										<select id="orgId" name="orgId" multiple="multiple" class="form-control chosen" required >  
										<option value="0" selected>All</option>
										<c:forEach items="${organiserList}" var="organiserList" >
										 
											<option value="${organiserList.orgId}">${organiserList.orgName}</option>
										 
											</c:forEach>
											</select>

									</div>


								</div>
								<br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="button" class="btn btn-info" value="Search"
										onclick="searchEventList()"	id="search"  >

 

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
									<th>Event Name</th>
									<th>Location</th>
									<th>From Date</th>
									<th>To Date</th> 
									<th>Organizer Name</th> 
								     <th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${eventList}" var="eventList" varStatus="count">
									<tr class="table-flag-blue">
									 
									
										<td>${count.index+1}</td>
											 
											 
											<td>${eventList.eventName}</td>
										 <td>${eventList.eventLocation}</td>
										 <td>${eventList.eventFromDate}</td>
										 <td>${eventList.eventToDate}</td>
										 <td>${eventList.orgName}</td>	 
										  <td>
										  <a href='${pageContext.request.contextPath}/editEventBySuperAdmin/${eventList.eventId}' class='action_btn' data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a> 
							  			<a href='${pageContext.request.contextPath}/eventDetailAndAssignExhList/${eventList.eventId}' class='action_btn' data-toggle="tooltip" title="Exhibitor List"><i class="glyphicon glyphicon-list"></i></a>  
							  			<a href='${pageContext.request.contextPath}/eventSchedule/${eventList.eventId}' class='action_btn' data-toggle="tooltip" title="Schedule"><i class="glyphicon glyphicon-calendar"></i></a>
							  			<a href="${pageContext.request.contextPath}/deleteEvent/${eventList.eventId}/1" onClick="return confirm('Are you sure want to delete this record');" data-toggle="tooltip" title="Delete"><span class="glyphicon glyphicon-remove"></span></a>
										  </td>
										 
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div><br>
				
				<!-- <div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit"  >



									</div>
								</div> -->
</form>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
	 <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	 
		<script>
/* function searchEventList() {
	 
		var orgId = $('#orgId').val();
		 
		if(orgId!="" && orgId!=null)
			{
			window.location.href='${pageContext.request.contextPath}/eventListByOrgId/'+orgId+'';
			
			}
		 
	 
} */


function searchEventList() {
	 
	 
	var orgId = $('#orgId').val(); 
	var valid=0;
 
		if(orgId==null || orgId=="")
		{
		alert("Select Minimum One Organiser");
		valid=1;
		}
		 
		 
	if(valid==0)
		{
	$.getJSON('${eventListByOrgId}',

			{
				 
				orgId : orgId, 
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
							  	tr.append($('<td></td>').html(itemList.eventName)); 
							  	tr.append($('<td></td>').html(itemList.eventLocation)); 
							  	tr.append($('<td></td>').html(itemList.eventFromDate)); 
							  	tr.append($('<td></td>').html(itemList.eventToDate)); 
							  	tr.append($('<td></td>').html(itemList.orgName)); 
							  	tr.append($('<td ></td>').html("<a href='${pageContext.request.contextPath}/editEventBySuperAdmin/"+itemList.eventId+"' class='action_btn'data-toggle='tooltip' title='Edit'><i class='glyphicon glyphicon-edit'></i></a> " +
							  			"<a href='${pageContext.request.contextPath}/eventDetailAndAssignExhList/"+itemList.eventId+"' class='action_btn' data-toggle='tooltip' title='Exhibitor List'><i class='glyphicon glyphicon-list'></i></a> " + 
							  			"<a href='${pageContext.request.contextPath}/eventSchedule/"+itemList.eventId+"' class='action_btn' data-toggle='tooltip' title='Schedule'><i class='glyphicon glyphicon-calendar'></i></a> " + 
							  			"<a href='${pageContext.request.contextPath}/deleteEvent/"+itemList.eventId+"/1' onClick='return confirm('Are you sure want to delete this record'); data-toggle='tooltip' title='Delete''><span class='glyphicon glyphicon-remove'></span></a> "));
								  
								$('#table1 tbody').append(tr);
								 

							})  
			});
	 
		}
}
 </script>

</body>
</html>