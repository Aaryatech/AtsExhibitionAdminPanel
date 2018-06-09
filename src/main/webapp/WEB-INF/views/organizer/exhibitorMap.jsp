<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>


	<c:url var="allRecordwithDate" value="/allRecordwithDate"></c:url>


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
					<i class="fa fa-file-o"></i>Exhibitor Search & Map
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Exhibitor Mapping
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/addExhibitor">Add
						Exhibitor</a> <a data-action="collapse" href="#"><i
						class="fa fa-chevron-up"></i></a>
				</div>

			</div>
			
			<div class=" box-content">
					<div class="box-content">
 			<form action="${pageContext.request.contextPath}/searchExhibitorAvail"	method="post">
 
									<div class="col-md-5">
									<c:choose>
									<c:when test="${check==1}">
									 <input type="checkbox"  name="check" value="1" checked="checked"/><b>Mobile No.</b> OR
									     <input type="checkbox"  name="check" value="2"/><b>Exhibitor Id </b>OR
									     <input type="checkbox"  name="check" value="3"/><b>Exhibitor Name </b>
									</c:when>
									<c:when test="${check==2}">
									 <input type="checkbox"  name="check" value="1"/><b>Mobile No.</b> OR
									     <input type="checkbox"  name="check" value="2"checked="checked"/><b>Exhibitor Id </b>OR
									     <input type="checkbox"  name="check" value="3"/><b>Exhibitor Name </b>
									</c:when>
									<c:when test="${check==3}">
									 <input type="checkbox"  name="check" value="1"/><b>Mobile No.</b> OR
									     <input type="checkbox"  name="check" value="2"/><b>Exhibitor Id </b>OR
									     <input type="checkbox"  name="check" value="3" checked="checked"/><b>Exhibitor Name </b>
									</c:when>
									<c:otherwise>
										 <input type="checkbox"  name="check" value="1"/><b>Mobile No.</b> OR
									     <input type="checkbox"  name="check" value="2"/><b>Exhibitor Id </b>OR
									     <input type="checkbox"  name="check" value="3"/><b>Exhibitor Name </b>
									</c:otherwise>
									</c:choose>
									   

									     </div>
									<div class="col-md-3">
										<input type="text" name="exh" id="exh" class="form-control" value="${exh}"/>
									</div>


								
								
									<div class="col-md-2" >
										<input type="submit" class="btn btn-info" value="Search"
											id="search"  >

<input type="hidden"   name="eventId" id="eventId" value="${eventId}"/>

									</div>
									</form>
								</div> 
							
	<form action="${pageContext.request.contextPath}/sumbitMapping"
								method="post">
				<div class="box-content"> 
					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">
							<thead>
								<tr>
										
									<th style="width: 18px">Sr No</th>
									<th>Exhibitor Name</th>
								    <th>Company</th>
								    <th>Mobile</th>
								     <th class="col-md-2">Stall No.</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${exhList}" var="exhibitorList" varStatus="count">
									<tr class="table-flag-blue">
									
										<td>${count.index+1}</td>
											<td>${exhibitorList.exhName}</td>
											<td>${exhibitorList.exhCompany}</td>
											<td>${exhibitorList.userMob}</td>
						<td><input type="text" name="stallNo${exhibitorList.exhId}" id="stallNo${exhibitorList.exhId}" class="form-control" /></td>
											
										 <td> 
										<input type="checkbox"   name="select_to_approve" id="select_to_approve${exhibitorList.exhId}" value="${exhibitorList.exhId}"/>

										</td>  
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div><br>
				
				<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
 
									<div class="col-md-2">Select Event*</div>
									<div class="col-md-3">
										<select id="eventId" name="eventId" class="form-control chosen" required >  
										<option value="">Select Event</option>
										<c:forEach items="${eventList}" var="eventList" >
										<c:choose>
											<c:when test="${eventList.eventId==eventId}">
												<option value="${eventList.eventId}" selected>${eventList.eventName}</option>
											</c:when>
											<c:otherwise>
											<option value="${eventList.eventId}">${eventList.eventName}</option>
											</c:otherwise>
										</c:choose>
									 	
											</c:forEach>
											</select>
								</div>
                       <input type="submit" class="btn btn-info" value="Submit"		id="submit"  >

									</div>
								</div>

			</div>

</form>

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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>
		<script>
function searchExibitor() {
	 
		var eventId = $('#eventId').val();
		 
		if(eventId!="" && eventId!=null)
			{
			window.location.href='${pageContext.request.contextPath}/eventMapList/'+eventId+'';
			
			}
		 
	 
}
$('input[type="checkbox"]').on('change', function() {
	   $(this).siblings('input[type="checkbox"]').prop('checked', false);
	});
 </script>

</body>
</html>