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
					<i class="fa fa-file-o"></i>Event Detail
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Event Detail
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/showEventList">Event List</a> <a data-action="collapse" href="#"><i
						class="fa fa-chevron-up"></i></a>
				</div>

			</div>
			
			
			<div class=" box-content">
				<form
					action="${pageContext.request.contextPath}/addExhibitorSubScriptionDetailTransaction"
					method="post">
					<div class="box-content">

						<div class="col-md-2">Event Name</div>
						<div class="col-md-3">
						${eventDetail.eventName}
						<%-- <input type="text" name="eventName" id="eventName" class="form-control"
								  value="${eventDetail.eventName}" readonly/> --%>
							 
						</div>
						<div class="col-md-2">Organiser Name</div>
						<div class="col-md-3">
						${eventDetail.orgName}
							<%-- <input type="text" name="orgName" id="orgName" class="form-control"
								  value="${eventDetail.orgName}" readonly/> --%>
						</div>
					</div>
					<br>
					 

					<div class="box-content">

						<div class="col-md-2">From Date</div>
						<div class="col-md-3">
						${eventDetail.eventFromDate}
							<%-- <input type="text" name="fromDate"
								value="${eventDetail.eventFromDate}" placeholder="From Date"
								onblur="calculateToDate()" id="fromDate"
								class="form-control" readonly/> --%>
						</div>


						<div class="col-md-2">To Date</div>
						<div class="col-md-3">
						${eventDetail.eventFromDate}
							<%-- <input type="text" name="toDate"
								value="${eventDetail.eventFromDate}" placeholder="To Date"
								id="toDate" class="form-control" readonly/> --%>
						</div>


					</div>
					<br>  
					<div class="box-content">

						<div class="col-md-2">From Time</div>
						<div class="col-md-3">
						${eventDetail.fromTime}
							<%-- <input type="text" name="fromDate"
								value="${eventDetail.fromTime}" placeholder="From Date"
								onblur="calculateToDate()" id="fromDate"
								class="form-control" readonly/> --%>
						</div>


						<div class="col-md-2">To Time</div>
						<div class="col-md-3">
						${eventDetail.toTime}
							<%-- <input type="text" name="toDate"
								value="${eventDetail.toTime}" placeholder="To Date"
								id="toDate" class="form-control" readonly/> --%>
						</div>


					</div>
					<br>
					
					<div class="box-content">

						<div class="col-md-2">Location</div>
						<div class="col-md-3">
						${eventDetail.eventLocation}
							<%-- <input type="text" name="fromDate"
								value="${eventDetail.eventLocation}" placeholder="From Date"
								onblur="calculateToDate()" id="fromDate"
								class="form-control" readonly/> --%>
						</div>


						<div class="col-md-2">About Event</div>
						<div class="col-md-3">
						${eventDetail.aboutEvent}
							<%-- <input type="text" name="toDate"
								value="${eventDetail.aboutEvent}" placeholder="To Date"
								id="toDate" class="form-control" readonly/> --%>
						</div>


					</div>
					<br> 
				 
				</form>
			</div>
			
			
			
			
			<div class=" box-content">

				<div class="box-content">

					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">
							<thead>
								<tr>

									<th style="width: 18px">Sr No</th> 
									<th>Exhibitor Name</th> 
									<th>Company Name</th> 
									<th>User Mobile</th> 
									<th>Address</th> 
									<th>Location Name</th> 
									<th>Company Type</th> 
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${eventExhMappingList}"
									var="eventExhMappingList" varStatus="count">
 
									<tr class="table-flag-blue">
										<td>${count.index+1}</td>
										
										 <c:forEach items="${exhibitorList}" var="exhibitorList" > 
											 <c:choose>
											 	<c:when test="${exhibitorList.exhId==eventExhMappingList.exhId}">
											 	<td>${exhibitorList.exhName}</td>
											 	<td>${exhibitorList.exhCompany}</td>
											 	<td>${exhibitorList.userMob}</td> 
											 	<td>${exhibitorList.address}</td>
											 	<td>${exhibitorList.locationName}</td>
											 	<td>${exhibitorList.companyTypeName}</td>
											 	
											 	</c:when> 
											 </c:choose>
										</c:forEach>
										
										 
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
	<script type="text/javascript">	
			function searchEventList() {

			var orgId = $('#orgId').val();

			if (orgId != "" && orgId != null) {
				window.location.href = '${pageContext.request.contextPath}/eventListByOrgId/'
						+ orgId + '';

			}

		}
	</script>

	<script>
		document.getElementById('isPay').addEventListener('change', function() {
			var style = this.value == 1 ? 'block' : 'none';
			document.getElementById('hidden_div').style.display = style;

		});
	</script>

	<script type="text/javascript">
		function calculateToDate() {

			var pkgId = $('#pkgId').val();
			var fromDate = $('#fromDate').val();

			$.getJSON('${getToDate}', {
				pkgId : pkgId,
				fromDate : fromDate,
				ajax : 'true'
			}, function(data) {

				document.getElementById("toDate").value = data;
			});

		}
	</script>
	<script>
		document
				.getElementById('isCheque')
				.addEventListener(
						'change',
						function() {

							var style = this.value == 2 ? 'block' : 'none';

							document.getElementById('hidden_div2').style.display = style;

						});
	</script>

	<script>
		document
				.getElementById('isCheque')
				.addEventListener(
						'change',
						function() {

							var style = this.value == 3 ? 'block' : 'none';

							document.getElementById('hidden_div3').style.display = style;

						});
	</script>

	<script type="text/javascript">
		function onPackage(pkgId) {

			//pkgId

			$.getJSON('${getPackage}', {
				pkgId : pkgId,
				ajax : 'true'

			}, function(data) {
				alert(data)

				document.getElementById("pkgAmt").value = data.pkgAmt;

			});

		}
	</script>


	<script type="text/javascript">
		function onAmount() {
			var paidAmt = parseFloat($('#paidAmt').val());
			var remAmt = parseFloat($('#remainingAmt').val());
			 
			document.getElementById("remAmt").value = remAmt - paidAmt;

		}
	</script>
		

</body>
</html>