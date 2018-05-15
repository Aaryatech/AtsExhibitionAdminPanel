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
										<select id="orgId" name="orgId" class="form-control chosen" required >  
										<option value=" ">Select Organizer</option>
										<c:forEach items="${organiserList}" var="organiserList" >
										<c:choose>
											<c:when test="${organiserList.orgId==orgId}">
												<option value="${organiserList.orgId}" selected>${organiserList.orgName}</option>
											</c:when>
											<c:otherwise>
											<option value="${organiserList.orgId}">${organiserList.orgName}</option>
											</c:otherwise>
										</c:choose>
									 	
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
								<%-- <c:set var="sts" value="${0}"></c:set>
									<c:forEach items="${eventExhMappingList}" var="eventExhMappingList">
												<c:choose>
														<c:when test="${eventExhMappingList.mapId!=0}">
														<c:set var="sts" value="${1}"></c:set>
														</c:when>
												</c:choose>
									</c:forEach> --%>

				<div class="box-content"> 
					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">
							<thead>
								<tr>
											<%--  <c:choose>
											<c:when test="${sts==1}">
											 <th style="width:18px"><input type="checkbox" onClick="selectAll(this)" disabled/></th>
											 </c:when>
											<c:otherwise>
											<th style="width:18px"><input type="checkbox" onClick="selectAll(this)" /></th>
											</c:otherwise>
											</c:choose> --%>
								
									<th style="width: 18px">Sr No</th>
									<th>Event Name</th>
								 <th>Organizer Name</th>
									<!-- <th>Action</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${eventList}" var="eventList" varStatus="count">
									<tr class="table-flag-blue">
									<%-- <td><c:choose>
											<c:when test="${eventExhMappingList.mapId!=0}">
											<input type="checkbox"   name="select_to_approve" id="select_to_approve${eventExhMappingList.exhId}" value="${eventExhMappingList.exhId}" disabled/>
											</c:when>
											<c:otherwise>
											<input type="checkbox"   name="select_to_approve" id="select_to_approve${eventExhMappingList.exhId}" value="${eventExhMappingList.exhId}"/>
											</c:otherwise>
											</c:choose>
											</td> --%>
									
										<td>${count.index+1}</td>
											 
											 
											<td>${eventList.eventName}</td>
										<td>${eventList.orgName}</td>	 
										 
										<%--  <td> 
										 <c:choose>
											<c:when test="${eventExhMappingList.mapId!=0}">
											<a href="${pageContext.request.contextPath}/deleteExhibitorFromMapping/${eventExhMappingList.mapId}/${eventExhMappingList.eventId}"
											onClick="return confirm('Are you sure want to delete this record');"><span
												class="glyphicon glyphicon-remove"></span></a>
											</c:when>
											</c:choose>
											
											</td>  --%> 
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
		<p>2018 © SONA ELECTRICALS.</p>
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
function searchEventList() {
	 
		var orgId = $('#orgId').val();
		 
		if(orgId!="" && orgId!=null)
			{
			window.location.href='${pageContext.request.contextPath}/eventListByOrgId/'+orgId+'';
			
			}
		 
	 
}
 </script>

</body>
</html>