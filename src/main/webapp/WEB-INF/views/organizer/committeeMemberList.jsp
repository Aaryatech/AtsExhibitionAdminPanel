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
					<i class="fa fa-file-o"></i>Committee Member List
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Committee Member List
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/addCommitteeMember">Committee
						Member Organizer</a> <a data-action="collapse" href="#"><i
						class="fa fa-chevron-up"></i></a>
				</div>

			</div>

			<%-- <div class=" box-content">

				<div class="box-content">

					<div class="col-md-2">Organizer Name</div>
					<div class="col-md-3">
						<input type="text" name="orgName" id="orgName"
							class="form-control" readonly="readonly"
							value="${organiser.orgName}" readonly />

					</div>
					<div class="col-md-2">Address</div>
					<div class="col-md-3">
						<input type="text" name="orgAddress" id="orgAddress"
							class="form-control" readonly="readonly"
							value="${organiser.orgAddress}" readonly />
					</div>
				</div>
				<br>


				<div class="box-content">

					<div class="col-md-2">Contact No</div>
					<div class="col-md-3">
						<input type="text" name="orgContactNo" id="orgContactNo"
							class="form-control" readonly="readonly"
							value="${organiser.orgContactNo}" readonly />

					</div>
					<div class="col-md-2">Email Id</div>
					<div class="col-md-3">
						<input type="text" name="orgEmailId" id="orgEmailId"
							class="form-control" readonly="readonly"
							value="${organiser.orgEmailId}" readonly />
					</div>
				</div>
				<br>




				<div class=" box-content">


					<div class="col-md-2">Website Link</div>
					<div class="col-md-3">
						<input type="text" name="websiteLink"
							value="${organiser.websiteLink}" placeholder="Website Link"
							id="websiteLink" class="form-control" required / readonly />
					</div>

				</div>
				<br>



 --%>
				<div class=" box-content">

					<div class="box-content">

						<br /> <br />
						<div class="clearfix"></div>
						<div class="table-responsive" style="border: 0">
							<table class="table table-advance" id="table1">
								<thead>
									<tr>
										<th style="width: 18px">Sr No</th>
										<th>Member Name</th>
										<th>Designation</th>
										<th>Contact No</th>
										<th>Email</th>
										<th>Company Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${committeeMemberList}"
										var="committeeMemberList" varStatus="count">
										<tr class="table-flag-blue">
											<td>${count.index+1}</td>
											<td>${committeeMemberList.memberName}</td>
											<td>${committeeMemberList.designation}</td>
											<td>${committeeMemberList.contactNo}</td>
											<td>${committeeMemberList.emailId}</td>
											<td>${committeeMemberList.companyName}</td>
											<td><a
												href="${pageContext.request.contextPath}/editMember/${committeeMemberList.memId}" data-toggle="tooltip" title="Edit"><span
													class="glyphicon glyphicon-edit"></span></a> <a
												href="${pageContext.request.contextPath}/deleteMember/${committeeMemberList.memId}"
												onClick="return confirm('Are you sure want to delete this record');" data-toggle="tooltip" title="Delete"><span
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
</body>
</html>