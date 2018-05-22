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
					<i class="fa fa-file-o"></i>OrgSubscriptionDetail List
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>OrgSubscriptionDetail List
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/orgSubscriptionList">
						OrgSubscription List</a> <a data-action="collapse" href="#"><i
						class="fa fa-chevron-up"></i></a>
				</div>

			</div>
			
			
			<div class=" box-content">
				<form
					action="${pageContext.request.contextPath}/addSubScriptionDetailTransaction"
					method="post">
					<div class="box-content">

						<div class="col-md-2">Select Organizer*</div>
						<div class="col-md-3">
						<input type="text" name="pkgAmt" id="pkgAmt" class="form-control"
								readonly="readonly" value="${orgSubscription.orgName}" readonly/>
							 
						</div>
						<div class="col-md-2">Select Package*</div>
						<div class="col-md-3">
						<input type="text" name="pkgAmt" id="pkgAmt" class="form-control"
								readonly="readonly" value="${orgSubscription.pkgName}" readonly/>
						 
						</div>
					</div>
					<br>
					<div class="box-content">
						<div class="col-md-2">Package Amount*</div>
						<div class="col-md-3">
							<input type="text" name="pkgAmt" id="pkgAmt" class="form-control"
								readonly="readonly" value="${orgSubscription.pkgAmt}" readonly/>
						</div>

					</div>
					<br>

					<div class="box-content">

						<div class="col-md-2">From Date</div>
						<div class="col-md-3">
							<input type="text" name="fromDate"
								value="${orgSubscription.fromDate}" placeholder="From Date"
								onblur="calculateToDate()" id="fromDate"
								class="form-control date-picker" required / readonly/>
						</div>


						<div class="col-md-2">To Date</div>
						<div class="col-md-3">
							<input type="text" name="toDate"
								value="${orgSubscription.toDate}" placeholder="To Date"
								id="toDate" class="form-control date-picker" required / readonly/>
						</div>


					</div>
					<br> <br>
					<div class=" box-content">
						<div class="col-md-2">Do you Want to pay Amount??</div>
						<div class="col-md-3">
							<select id="isPay" name="isPay" class="form-control">

								<option value="0">No</option>
								<option value="1">Yes</option>
							</select>

						</div>
						
						<div class="col-md-2">You have Paid</div>
						<div class="col-md-3">
							<input type="text" name="totalPaidAmt"
								value="${orgSubscription.paidAmt}"  
								id="totalPaidAmt" class="form-control"  readonly/>
						</div>

					</div><br>
					
					<div class=" box-content">
						 
						
						<div class="col-md-2">Remain Amt</div>
						<div class="col-md-3">
							<input type="text" name="remainingAmt"  
								value="${orgSubscription.remAmt}" placeholder="Remaining Amount"
								id="remainingAmt" class="form-control" required / readonly/>
						</div>

					</div>
<br>
				


					<div id="hidden_div" style="display: none;">
						<div class="box-content">

							<div class="col-md-2">Paid Amount*</div>
							<div class="col-md-3">
								<input type="text" id="paidAmt" name="paidAmt"
									 class="form-control"
									value="${editEmployee.empName}" onchange="onAmount();" placeholder=" Paid Amount" />
								<input type="hidden" name="empId" value="" />
							</div>

							<div class="col-md-2">Remaining Amount.*</div>
							<div class="col-md-3">
								<input type="text" id="remAmt" name="remAmt"
									value="${editEmployee.empMobile}" class="form-control"
									placeholder=" Remaining Amount " /> <input type="hidden"
									name="empId" value="" />

							</div>
						</div>
						<br>
						<div class="box-content">

							<div class="col-md-2">Select Mode Of Payment*</div>
							<div class="col-md-3">

								<select id="isCheque" name="isCheque" class="form-control">

									<option value="1">Cash</option>
									<option value="2">Cheque</option>
									<option value="3">Online</option>

								</select>
							</div>


							<div class="col-md-2">Transaction Date</div>
							<div class="col-md-3">
								<input type="text" name="trDate" placeholder="Transaction Date"
									id="trDate" class="form-control date-picker" />
							</div>

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
									value="${editEmployee.empPerHrRate}"
									class="form-control date-picker" placeholder="Cheque Date" />
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

					<div class=" box-content">
						<div class="col-md-12" style="text-align: center">
							<input type="submit" class="btn btn-info" value="Submit"
								id="submit">
						</div>
					</div>
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
									<th>Sub Id</th>
									<th>Payment Date</th>
									<th>Payment Amount</th>
									<th>Mode OF Payment</th>
									<th>Transaction No</th>
									<th>Bank Name</th>
								
									<th>Cheque Date</th>


								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orgSubscriptionList}"
									var="orgSubscriptionList" varStatus="count">

									<c:choose>
										<c:when test="${orgSubscriptionList.paymentMode==1}">
											<c:set var="modType" value="Cash"></c:set>
										</c:when>
										<c:when test="${orgSubscriptionList.paymentMode==2}">
											<c:set var="modType" value="Check"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="modType" value="Online"></c:set>
										</c:otherwise>
									</c:choose>

									<tr class="table-flag-blue">
										<td>${count.index+1}</td>
										<td>${orgSubscriptionList.subId}</td>
										<td>${orgSubscriptionList.paymentDate}</td>
										<td>${orgSubscriptionList.paymentAmt}</td>
										<td>${modType}</td>
										<td>${orgSubscriptionList.trNo}</td>
										<td>${orgSubscriptionList.bankName}</td>

										<td>${orgSubscriptionList.chequeDate}</td>
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