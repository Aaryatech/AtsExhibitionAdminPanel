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
					<i class="fa fa-file-o"></i>Org Subscription
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Org Subscription
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/addOrganizer">Add </a>
					<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
				</div>

			</div>
			<div class=" box-content">
				<form
					action="${pageContext.request.contextPath}/insertOrgSubscription"
					method="post">
					<div class="box-content">

						<div class="col-md-2">Select Organizer*</div>
						<div class="col-md-3">
							<select id="orgId" name="orgId" class="form-control chosen"
								required>
								<option value=" ">Select Organizer</option>
								<c:forEach items="${organiserList}" var="organiserList">

									<option value="${organiserList.orgId}">${organiserList.orgName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-2">Select Package*</div>
						<div class="col-md-3">
							<select id="pkgId" name="pkgId" onchange="onPackage(this.value)"
								class="form-control chosen" required>
								<option value=" ">Select Package</option>
								<c:forEach items="${packageList}" var="packageList">


									<option value="${packageList.pkgId}">${packageList.pkgName}</option>

								</c:forEach>
							</select>
						</div>
					</div>
					<br> <input type="hidden" name="pkgAmt" id="pkgAmt">

					<div class="box-content">

						<div class="col-md-2">From Date</div>
						<div class="col-md-3">
							<input type="text" name="fromDate"
								value="${editEmployee.empJoiningDate}" placeholder="From Date"
								id="fromDate" class="form-control date-picker" required />
						</div>


						<div class="col-md-2">To Date</div>
						<div class="col-md-3">
							<input type="text" name="toDate"
								value="${editEmployee.empJoiningDate}" placeholder="To Date"
								id="toDate" class="form-control date-picker" required />
						</div>


					</div>
					<br>

					<div class=" box-content">
						<div class="col-md-12" style="text-align: center">
							<select id="isPay" name="isPay" required>
								<option value=" ">Do you Want to pay Amount??</option>

								<option value="0">No</option>
								<option value="1">Yes</option>
							</select>

						</div>

					</div>



					<div id="hidden_div" style="display: none;">
						<div class="box-content">

							<div class="col-md-2">Paid Amount*</div>
							<div class="col-md-3">
								<input type="text" id="paidAmt" name="paidAmt"
									class="form-control" value="${editEmployee.empName}"
									placeholder=" Paid Amount" /> <input type="hidden"
									name="empId" value="${editEmployee.empId}" />
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-2">Remaining Amount.*</div>
							<div class="col-md-3">
								<input type="text" id="remAmt" name="remAmt"
									value="${editEmployee.empMobile}" class="form-control"
									placeholder=" Received Amount " /> <input type="hidden"
									name="empId" value="${editEmployee.empId}" />

							</div>


						</div>
						<br>



						<div class="box-content">

							<div class="col-md-2">Select Mode Of Payment*</div>
							<div class="col-md-3">
								<select id="isCheque" name="isCheque">
									<option value=" ">Select Mode Of Payment</option>


									<option value="1">Cash</option>
									<option value="2">Cheque</option>
									<option value="3">Online</option>

								</select>
							</div>


						</div>
						<br> <br>
						<div id="hidden_div2" style="display: none;">
							<div class="box-content">

								<div class="col-md-2">Bank Name*</div>
								<div class="col-md-3">
									<input type="text" id="bankName" name="bankName"
										value="${editEmployee.empDesignation}" class="form-control"
										placeholder="Bank Name" />
								</div>

								<div class="col-md-1"></div>
								<div class="col-md-2">Cheque Date*</div>
								<div class="col-md-3">
									<input type="text" id=chequeDate name="chequeDate"
										value="${editEmployee.empPerHrRate}" class="form-control"
										placeholder="Cheque Date" />
								</div>
							</div>
						</div>
						<br>

						<div id="hidden_div3" style="display: none;">
							<div class="box-content">

								<div class="col-md-2">Transaction No*</div>
								<div class="col-md-3">
									<input type="text" id="trNo" name="trNo"
										value="${editEmployee.empDesignation}" class="form-control"
										placeholder="Transaction No" />
								</div>
							</div>
						</div>
						<br>
					</div>



					<div class=" box-content">
						<div class="col-md-12" style="text-align: center">
							<input type="submit" class="btn btn-info" value="Submit"
								id="submit">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- END Main Content -->

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
		$(function() {
			$('#fromDate').datetimepicker();
		});
	</script>
	<script type="text/javascript">
		$('#fromDate').datetimepicker().on('dp.change', function() {
			alert("dasd");
		})
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

	<script  type="text/javascript">
function onPackage(pkgId) {
 
	
	//pkgId
	
	
	alert(pkgId);
	$.getJSON(
					'${getPackage}',
					{
						pkgId : pkgId, 
						ajax : 'true'

					},
					function(data) { 
						
						document.getElementById("pkgId").value=data.pkgAmt;
						
					});

 
	</script>

	}
</body>
</html>