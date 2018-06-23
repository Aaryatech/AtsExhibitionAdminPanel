package com.ats.exhibition.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.exhibition.common.Constants;
import com.ats.exhibition.common.DateConvertor;
import com.ats.model.ExhSubDetail;
import com.ats.model.ExhSubHeader;
import com.ats.model.ExhSubHeaderWithExhName;
import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.OrgSubscription;
import com.ats.model.OrgSubscriptionDetail;
import com.ats.model.OrgSubscriptionWithName;
import com.ats.model.Package1;

@Controller
@Scope("session")
public class ExhibitorController {
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showExhibitor", method = RequestMethod.GET)
	public ModelAndView addLocation(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 2;
		Constants.subAct = 27;

		ModelAndView model = new ModelAndView("organizer/exhibitorSubscription");
		try {

			ExhibitorWithOrgName[] exhibitorWithOrgName = rest.getForObject(Constants.url + "/getAllExhibitorsByIsUsed",
					ExhibitorWithOrgName[].class);
			List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(
					Arrays.asList(exhibitorWithOrgName));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgType", 2);
			Package1[] package1 = rest.postForObject(Constants.url + "/getAllPackagesByPkgType", map, Package1[].class);
			List<Package1> packageList = new ArrayList<Package1>(Arrays.asList(package1));
			model.addObject("packageList", packageList);

			model.addObject("exhibitorList", exhibitorList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertExhibitorSubscription", method = RequestMethod.POST) // navigation from submit
	public String insertOrgSubscription(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new
		// ModelAndView("organizer/exhibitorSubscriptionDetails");
		try {

			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// dd/MM/yyyy

			SimpleDateFormat originalFormat = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");

			Date now = new Date();
			String strDate = sdfDate.format(now);

			String exhId = request.getParameter("exhId");
			String pkgId = request.getParameter("pkgId");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String pkgAmt = request.getParameter("pkgAmt");

			Integer empNos = Integer.parseInt(request.getParameter("empNos"));

			System.out.println("exhId" + exhId);
			System.out.println("pkgId" + pkgId);
			System.out.println("fromDate" + fromDate);
			System.out.println("toDate" + toDate);
			System.err.println("Emp Nos " + empNos);
			
			Date ymdFromDate = null;
			Date ymdToDate = null;
			try {
				ymdFromDate = originalFormat.parse(fromDate);
				ymdToDate = originalFormat.parse(toDate);

				System.out.println("From date :   " + targetFormat.format(ymdFromDate));
				System.out.println("TDate ymdToDate = null;\r\n" + "o Date :   " + targetFormat.format(ymdToDate));

			} catch (ParseException ex) {
				// Handle Exception.
			}

			ExhSubHeader exhSubHeader = new ExhSubHeader();
			exhSubHeader.setExhId(Integer.parseInt(exhId));
			exhSubHeader.setFromDate(DateConvertor.convertToYMD(fromDate));
			exhSubHeader.setToDate(DateConvertor.convertToYMD(toDate));
			exhSubHeader.setTotolAmt(Float.parseFloat(pkgAmt));
			exhSubHeader.setIsUsed(1);
			exhSubHeader.setRemAmt(Float.parseFloat(pkgAmt));
			exhSubHeader.setStatus(empNos);

			ExhSubHeader res = rest.postForObject(Constants.url + "/saveExhSubHeader", exhSubHeader,
					ExhSubHeader.class);
			System.out.println("res" + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showExhibitorSubscriptionList";
	}

	@RequestMapping(value = "/showExhibitorSubscriptionList", method = RequestMethod.GET)
	public ModelAndView showExhibitorSubscriptionList(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 2;
		Constants.subAct = 28;

		ModelAndView model = new ModelAndView("organizer/showExhibitorSubscriptionList");
		try {

			ExhSubHeaderWithExhName[] exhSubHeaderWithExhName = rest
					.getForObject(Constants.url + "/getAllSubHeaderByIsUsed", ExhSubHeaderWithExhName[].class);
			List<ExhSubHeaderWithExhName> exhibitorSubList = new ArrayList<ExhSubHeaderWithExhName>(
					Arrays.asList(exhSubHeaderWithExhName));

			model.addObject("exhibitorSubList", exhibitorSubList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	ExhSubHeaderWithExhName updateExhSubHeaderWithExhName = new ExhSubHeaderWithExhName();

	@RequestMapping(value = "/exhiSubscriptionTranDetail/{subId}", method = RequestMethod.GET)
	public ModelAndView exhiSubscriptionTranDetail(@PathVariable int subId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/exhiSubscriptionTranDetail");
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("subId", subId);
			updateExhSubHeaderWithExhName = rest.postForObject(Constants.url + "/getSubHeaderBySubIdAndIsUsed", map,
					ExhSubHeaderWithExhName.class);
			model.addObject("exhSubHeader", updateExhSubHeaderWithExhName);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("subHeaderId", subId);
			ExhSubDetail[] exhSubDetail = rest.postForObject(Constants.url + "/exhSubDetailBySubHeaderIdAndIsUsed", map,
					ExhSubDetail[].class);
			List<ExhSubDetail> exhSubDetailList = new ArrayList<>(Arrays.asList(exhSubDetail));
			model.addObject("exhSubDetailList", exhSubDetailList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/addExhibitorSubScriptionDetailTransaction", method = RequestMethod.POST)
	public String addExhibitorSubScriptionDetailTransaction(HttpServletRequest request, HttpServletResponse response) {

		ExhSubHeader res = new ExhSubHeader();

		try {

			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// dd/MM/yyyy
			SimpleDateFormat originalFormat = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");

			Date now = new Date();
			String strDate = sdfDate.format(now);
			String paymentDate = "00-00-0000";
			int isPay = Integer.parseInt(request.getParameter("isPay"));
			String pkgAmt = request.getParameter("pkgAmt");
			String isCheque = request.getParameter("isCheque");
			try {
				paymentDate = request.getParameter("trDate");

			} catch (Exception e) {
				// TODO: handle exception
				paymentDate = "00-00-0000";
			}
			String chequeDate = request.getParameter("chequeDate");

			System.out.println("IsPay" + isPay);
			System.out.println("chequeDate" + chequeDate);
			float totalPaidAmt = Float.parseFloat(request.getParameter("totalPaidAmt"));
			float paidAmt = Float.parseFloat(request.getParameter("paidAmt"));

			String remAmt = request.getParameter("remAmt");

			/*
			 * Date ymdFromDate = null; Date ymdToDate = null;
			 */
			Date ymdPayDate = null;
			Date ymdchequeDate = null;

			try {
				// ymdFromDate = originalFormat.parse(fromDate);
				// ymdToDate = originalFormat.parse(toDate);
				ymdPayDate = originalFormat.parse(paymentDate);

			} catch (ParseException ex) {
				// Handle Exception.
				ex.printStackTrace();
			}

			ExhSubDetail exhSubDetail = new ExhSubDetail();
			if (isPay != 0) {

				exhSubDetail.setPaymentDate(targetFormat.format(ymdPayDate));
				exhSubDetail.setPaymentAmt(paidAmt);
				// orgSubscriptionDetail.setChequeDate("0000-00-00");

				if (isCheque.equalsIgnoreCase("2")) {

					String bankName = request.getParameter("bankName");
					ymdchequeDate = originalFormat.parse(chequeDate);

					exhSubDetail.setPaymentMode(2);

					exhSubDetail.setPaymentAmt(paidAmt);
					exhSubDetail.setBankName(bankName);

					exhSubDetail.setChequeDate(targetFormat.format(ymdchequeDate));
					exhSubDetail.setTrNo("");

				} else if (isCheque.equalsIgnoreCase("3")) {
					String trNo = request.getParameter("trNo");

					exhSubDetail.setPaymentMode(3);
					exhSubDetail.setTrNo(trNo);

				} else if (isCheque.equalsIgnoreCase("1")) {
					exhSubDetail.setPaymentMode(1);
					exhSubDetail.setBankName("");
					exhSubDetail.setTrNo("");

				}

			} else {

				exhSubDetail.setBankName("");
				// orgSubscriptionDetail.setChequeDate("0000-00-00");
				exhSubDetail.setTrNo("");

			}

			updateExhSubHeaderWithExhName.setPaidAmt(paidAmt + totalPaidAmt);
			updateExhSubHeaderWithExhName.setRemAmt(Float.parseFloat(remAmt));
			updateExhSubHeaderWithExhName
					.setFromDate(DateConvertor.convertToYMD(updateExhSubHeaderWithExhName.getFromDate()));
			updateExhSubHeaderWithExhName
					.setToDate(DateConvertor.convertToYMD(updateExhSubHeaderWithExhName.getToDate()));

			System.out.println("update " + updateExhSubHeaderWithExhName);

			res = rest.postForObject(Constants.url + "/saveExhSubHeader", updateExhSubHeaderWithExhName,
					ExhSubHeader.class);

			if (isPay == 1) {
				exhSubDetail.setSubHeaderId(res.getSubHeaderId());
				exhSubDetail.setIsUsed(1);

				ExhSubDetail res1 = rest.postForObject(Constants.url + "/saveExhSubDetail", exhSubDetail,
						ExhSubDetail.class);
				System.out.println("res1" + res1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/exhiSubscriptionTranDetail/" + res.getSubHeaderId();
	}

	// Sachin 20-06-2018

	@RequestMapping(value = "/isMobileNoExist", method = RequestMethod.GET)
	public @ResponseBody Integer isMobileNoExist(HttpServletRequest request, HttpServletResponse response) {
		Integer res = null;
		// ModelAndView model = new ModelAndView("masters/empDetail");
		try {

			String mobileNo = request.getParameter("mobileNo");
			String callService = request.getParameter("callService");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("mobileNo", mobileNo);
			map.add("callService", callService);

			res = rest.postForObject(Constants.url + "isMobileNoExist", map, Integer.class);
			System.out.println(res);

		} catch (Exception e) {
			System.err.println("Exception in mobile no exis /isMobileNoExist @Exhibicontr admin" + e.getMessage());
			e.printStackTrace();
		}

		return res;
	}

}
