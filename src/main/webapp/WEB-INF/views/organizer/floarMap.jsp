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
					<i class="fa fa-file-o"></i>Floar Map
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Floar Map
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/addSchedule"></a> <a
						data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
				</div>

			</div>
			<form action="${pageContext.request.contextPath}/insertFloarMap"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="floarMapId" id="floarMapId"
					value="${floarMap.floarMapId}" /> <input type="hidden"
					name="editFloarMap1" id="editFloarMap1"
					value="${floarMap.floarMap1}" /> <input type="hidden"
					name="isEdit" id="isEdit" value="${isEdit}" /> <input
					type="hidden" name="editFloarMap2" id="editFloarMap2"
					value="${floarMap.floarMap2}" /> <input type="hidden"
					name="editFloarMap3" id="editFloarMap3"
					value="${floarMap.floarMap3}" /> <input type="hidden"
					name="editFloarMap4" id="editFloarMap4"
					value="${floarMap.floarMap4}" />

				<div class=" box-content">
					<div class="box-content">
						<div class="col-md-2">Event*</div>
						<div class="col-md-3">
							<select id="eventId" name="eventId" class="form-control" required
								oninvalid="this.setCustomValidity('Please Select Event')"
								oninput="this.setCustomValidity('')">
								<option value="">Select Event</option>
								<c:forEach items="${eventList}" var="eventList">
									<c:choose>
										<c:when test="${eventList.eventId==floarMap.eventId}">
											<option value="${eventList.eventId}" selected>${eventList.eventName}</option>
										</c:when>
										<c:otherwise>
											<option value="${eventList.eventId}">${eventList.eventName}</option>
										</c:otherwise>
									</c:choose>

								</c:forEach>
							</select>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2">Floar Map1 *</div>
						<div class="col-md-3">
							<input type="file" id="floarMap1" name="floarMap1"
								placeholder="Floar Map1" required
								oninvalid="this.setCustomValidity('Enter Floar Map1')"
								oninput="this.setCustomValidity('')" />
						</div>

					</div>
					<br> <br>
					<div class="box-content">

						<div class="col-md-2">Floar Map2: *</div>
						<div class="col-md-3">
							<input type="file" id="floarMap2" name="floarMap2"
								placeholder="Floar Map2" />
						</div>
						<div class="col-md-1"></div>

						<div class="col-md-2">Floar Map3 *</div>
						<div class="col-md-3">
							<input type="file" id="floarMap3" name="floarMap3"
								placeholder="Floar Map3" />
						</div>
					</div>
					<br>
					<div class="box-content">

						<div class="col-md-2">Floar Map4: *</div>
						<div class="col-md-3">
							<input type="file" id="floarMap4" name="floarMap4"
								placeholder="Floar Map4" value="${URL}${floarMap.floarMap4}" />
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="box-content">
						<div class="col-md-3" style="text-align: center">
							<input type="submit" class="btn btn-info" value="Save">

						</div>
					</div>
				</div>
			</form>

			<div class=" box-content">

				<div class="box-content">

					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">
							<thead>
								<tr>
									<th style="width: 18px">Sr No</th>
									<th>Event</th>
									<th>Floar Map1</th>
									<th>Floar Map2</th>
									<th>Floar Map3</th>
									<th>Floar Map4</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${floarMapList}" var="floarMap"
									varStatus="count">
									<tr class="table-flag-blue">
										<td>${count.index+1}</td>
										<td>${floarMap.eventName}</td>
										<td><c:choose>
												<c:when test="${floarMap.floarMap1 eq ''}">

												</c:when>
												<c:otherwise>
													<a href="${URL}${floarMap.floarMap1}" target="_blank">Floar
														Map1</a>

												</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${floarMap.floarMap2 eq ''}">

												</c:when>
												<c:otherwise>
													<a href="${URL}${floarMap.floarMap2}" target="_blank">Floar
														Map2</a>

												</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${floarMap.floarMap3 eq ''}">

												</c:when>
												<c:otherwise>
													<a href="${URL}${floarMap.floarMap3}" target="_blank">Floar
														Map3</a>

												</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${floarMap.floarMap4 eq ''}">

												</c:when>
												<c:otherwise>
													<a href="${URL}${floarMap.floarMap4}" target="_blank">Floar
														Map4</a>

												</c:otherwise>
											</c:choose></td>
										<td><a
											href="${pageContext.request.contextPath}/editFloarMap/${floarMap.floarMapId}"><span
												class="glyphicon glyphicon-edit"></span></a> <a
											href="${pageContext.request.contextPath}/deleteFloarMap/${floarMap.floarMapId}"
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