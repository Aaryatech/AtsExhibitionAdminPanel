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
					<i class="fa fa-file-o"></i>Organizer Subscription List
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Organizer Subscription List
				</h3>
				<div class="box-tool">
					<a href="${pageContext.request.contextPath}/showOrgSubscription">Add
						Organizer Subscription</a> <a data-action="collapse" href="#"><i
						class="fa fa-chevron-up"></i></a>
				</div>

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
									<th>Org Name</th>
									<th>Package Name</th>
									<th>From Date</th>
									<th>To Date</th>
									<th style="width: 100px">Subscription Amount</th>
									<th>Paid Amount</th>
									<th>Remaining Amount</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orgSubscriptionList}"
									var="orgSubscriptionList" varStatus="count">
									<tr class="table-flag-blue">
										<td>${count.index+1}</td>
										<td>${orgSubscriptionList.orgName}</td>
										<td>${orgSubscriptionList.pkgName}</td>
										<td>${orgSubscriptionList.fromDate}</td>
										<td>${orgSubscriptionList.toDate}</td>
										<td >${orgSubscriptionList.pkgAmt}</td>
										<td style="width: 18px">${orgSubscriptionList.paidAmt}</td>
										<td style="width: 18px">${orgSubscriptionList.remAmt}</td>
								<%--  <td><a
											href="${pageContext.request.contextPath}/editOrgSubscriptionDetails/${orgSubscriptionList.subId}"><span
												class="glyphicon glyphicon-edit"></span></a>  </td>
												 --%>
												<td><a 
												href="${pageContext.request.contextPath}/orgSubscriptionDetailsList/${orgSubscriptionList.subId}" data-toggle="tooltip" title="Detail"> <i class="fa fa-list"></i></a></td>
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
						.write('_$tag_________________________________________________________________________________________$tag_____')
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
		function onAmount(paidAmt) {
			var pkgAmt = parseFloat($('#pkgAmt').val());
			var remAmt = pkgAmt - paidAmt;
			document.getElementById("remAmt").value = remAmt;

		}
	</script>


</body>
</html>