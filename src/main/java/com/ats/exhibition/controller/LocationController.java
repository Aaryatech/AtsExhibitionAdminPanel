package com.ats.exhibition.controller;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import com.ats.model.CompanyType;
import com.ats.model.ErrorMessage;
import com.ats.model.Location;
import com.ats.model.OrgSubscription;
import com.ats.model.OrgSubscriptionDetail;
import com.ats.model.Organiser;
import com.ats.model.Package1;

@Controller
@Scope("session")
public class LocationController {

	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/addLocation", method = RequestMethod.GET)
	public ModelAndView addLocation(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addLocation");
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/loctionList", method = RequestMethod.GET)
	public ModelAndView loctionList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/loctionList");
		try {
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", Location[].class);
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));

			model.addObject("locationList", locationList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertLocation", method = RequestMethod.POST)
	public String insertLocation(HttpServletRequest request, HttpServletResponse response) {

		try {
			String locationId = request.getParameter("locationId");
			String locationName = request.getParameter("locationName");
			String locationLong = request.getParameter("locationLongi");
			String locationLat = request.getParameter("locationLat");
			String remark = request.getParameter("remark");

			Location location = new Location();
			if (locationId == "" || locationId == null)
				location.setLocationId(0);
			else

				location.setLocationId(Integer.parseInt(locationId));
			location.setLocationName(locationName);
			location.setLocationLong(locationLong);
			location.setLocationLat(locationLat);
			location.setRemark(remark);
			location.setIsUsed(1);
			Location res = rest.postForObject(Constants.url + "/saveLocation", location, Location.class);

			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/addLocation";
	}

	@RequestMapping(value = "/editLocation/{locationId}", method = RequestMethod.GET)
	public ModelAndView editLocation(@PathVariable int locationId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addLocation");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("locationId", locationId);
			Location editLocation = rest.postForObject(Constants.url + "/getLocationByLocIdAndIsUsed", map,
					Location.class);
			model.addObject("editLocation", editLocation);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteLocation/{locationId}", method = RequestMethod.GET)
	public String deleteLocation(@PathVariable int locationId, HttpServletRequest request,
			HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("locationId", locationId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteLocation", map, ErrorMessage.class);
			System.out.println(delete);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/loctionList";
	}

	@RequestMapping(value = "/addCompanyType", method = RequestMethod.GET)
	public ModelAndView addCompanyType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addCompanyType");
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/companyTypeList", method = RequestMethod.GET)
	public ModelAndView companyTypeList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/companyList");
		try {
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed",
					CompanyType[].class);
			List<CompanyType> companyList = new ArrayList<CompanyType>(Arrays.asList(companyType));

			model.addObject("companyList", companyList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertCompanyType", method = RequestMethod.POST)
	public String insertCompantType(HttpServletRequest request, HttpServletResponse response) {

		try {
			String companyTypeId = request.getParameter("companyTypeId");
			String companyTypeName = request.getParameter("companyTypeName");
			String companyTypeDesc = request.getParameter("companyTypeDesc");

			CompanyType companyType = new CompanyType();
			if (companyTypeId == "" || companyTypeId == null)
				companyType.setCompanyTypeId(0);
			else

				companyType.setCompanyTypeId(Integer.parseInt(companyTypeId));
			companyType.setCompanyTypeName(companyTypeName);
			companyType.setCompanyTypeDesc(companyTypeDesc);
			companyType.setIsUsed(1);

			CompanyType res = rest.postForObject(Constants.url + "/saveCompanyType", companyType, CompanyType.class);

			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/addCompanyType";
	}

	@RequestMapping(value = "/editCompanyType/{companyTypeId}", method = RequestMethod.GET)
	public ModelAndView editCompanyType(@PathVariable int companyTypeId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addCompanyType");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("companyTypeId", companyTypeId);
			CompanyType editCompanyType = rest.postForObject(Constants.url + "/getCompanyTypeByCompanyTypeIdAndIsUsed",
					map, CompanyType.class);
			model.addObject("editCompanyType", editCompanyType);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteCompanyType/{companyTypeId}", method = RequestMethod.GET)
	public String deleteOrg(@PathVariable int companyTypeId, HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("companyTypeId", companyTypeId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteCompanyType", map, ErrorMessage.class);
			System.out.println(delete);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/companyTypeList";
	}

	@RequestMapping(value = "/showOrgSubscription", method = RequestMethod.GET)
	public ModelAndView showOrgSubscription(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/showOrgSubscription");
		try {

			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsedAndIsActive",
					Organiser[].class);
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));

			Package1[] package1 = rest.getForObject(Constants.url + "/getAllPackagesByIsUsed", Package1[].class);
			List<Package1> packageList = new ArrayList<Package1>(Arrays.asList(package1));

			model.addObject("organiserList", organiserList);

			model.addObject("packageList", packageList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getPackage", method = RequestMethod.GET)
	public @ResponseBody Package1 getPackage(HttpServletRequest request, HttpServletResponse response) {

		Package1 package1 = new Package1();
		try {
			int pkgId = Integer.parseInt(request.getParameter("pkgId"));

			System.err.println(pkgId);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgId", pkgId);
			package1 = rest.postForObject(Constants.url + "/getPackageByPkgId", map, Package1.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return package1;
	}

	// AJAX Call
	@RequestMapping(value = "/calculateToDate", method = RequestMethod.GET)
	public @ResponseBody List<String> calculateToDate(HttpServletRequest request, HttpServletResponse response) {

		Package1 package1 = new Package1();
		String toDate = null;

		try {

			String pkgId = request.getParameter("pkgId");
			String fromDate = request.getParameter("fromDate");

			System.out.println("PkgId " + pkgId);
			System.out.println("From Date " + fromDate);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgId", pkgId);
			package1 = rest.postForObject(Constants.url + "/getPackageByPkgId", map, Package1.class);

			// consume webservice- pkg by pkgId
			int duration = package1.getSubDuration();

			//
			System.out.println("Date before Addition: " + fromDate);

			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c = Calendar.getInstance();
			try {
				c.setTime(sdf.parse(fromDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}

			c.add(Calendar.DAY_OF_MONTH, duration);
			toDate = sdf.format(c.getTime());

			System.out.println("Date after Addition: " + toDate);

		} catch (Exception e) {
			e.printStackTrace();
		}
		List<String> list = new ArrayList<String>();
		list.add(toDate);
		return list;
	}

	@RequestMapping(value = "/insertOrgSubscription", method = RequestMethod.POST)
	public String insertOrgSubscription(HttpServletRequest request, HttpServletResponse response) {

		try {

			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// dd/MM/yyyy

			SimpleDateFormat originalFormat = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");

			Date now = new Date();
			String strDate = sdfDate.format(now);

			String orgId = request.getParameter("orgId");
			String pkgId = request.getParameter("pkgId");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int isPay = Integer.parseInt(request.getParameter("isPay"));
			String pkgAmt = request.getParameter("pkgAmt");
			String isCheque = request.getParameter("isCheque");
			String paymentDate = request.getParameter("trDate");
			String chequeDate = request.getParameter("chequeDate");			
			
			
			System.out.println("orgId" + orgId);
			System.out.println("pkgId" + pkgId);
			System.out.println("fromDate" + fromDate);
			System.out.println("toDate" + toDate);
			System.out.println("IsPay" + isPay);
			System.out.println("chequeDate" + chequeDate);

			Date ymdFromDate = null;
			Date ymdToDate = null;
			Date ymdPayDate = null;
			Date ymdchequeDate = null;

			try {
				ymdFromDate = originalFormat.parse(fromDate);
				ymdToDate = originalFormat.parse(toDate);
ymdPayDate=originalFormat.parse(paymentDate);


				System.out.println("From date :   " + targetFormat.format(ymdFromDate));
				System.out.println("TDate ymdToDate = null;\r\n" + 
						"o Date :   " + targetFormat.format(ymdToDate));

			} catch (ParseException ex) {
				// Handle Exception.
			}

			OrgSubscription orgSubscription = new OrgSubscription();
			OrgSubscriptionDetail orgSubscriptionDetail = new OrgSubscriptionDetail();

			orgSubscription.setSubId(0);
			orgSubscription.setOrgId(Integer.parseInt(orgId));
			orgSubscription.setPkgId(Integer.parseInt(pkgId));
			orgSubscription.setFromDate(targetFormat.format(ymdFromDate));
			orgSubscription.setToDate(targetFormat.format(ymdToDate));
			orgSubscription.setIsUsed(1);
			orgSubscription.setStatus(1);
			orgSubscription.setPkgAmt(Float.parseFloat(pkgAmt));
			orgSubscription.setTransDatetime(strDate);
			
			
		

			if (isPay!=0) {
				String paidAmt = request.getParameter("paidAmt");
				String remAmt = request.getParameter("remAmt");
				
				orgSubscription.setPaidAmt(Float.parseFloat(paidAmt));
				orgSubscription.setRemAmt(Float.parseFloat(remAmt));
				orgSubscriptionDetail.setPaymentDate(targetFormat.format(ymdPayDate));
				orgSubscriptionDetail.setPaymentAmt(Float.parseFloat(paidAmt));
				orgSubscriptionDetail.setChequeDate("0000-00-00");
				
				if (isCheque.equalsIgnoreCase("2")) {

					String bankName = request.getParameter("bankName");
					ymdchequeDate=originalFormat.parse(chequeDate);

					orgSubscriptionDetail.setPaymentMode(2);
					
					orgSubscriptionDetail.setPaymentAmt(Float.parseFloat(paidAmt));
					orgSubscriptionDetail.setBankName(bankName);
					
					orgSubscriptionDetail.setChequeDate(targetFormat.format(ymdchequeDate));
					orgSubscriptionDetail.setTrNo("");


				} else if (isCheque.equalsIgnoreCase("3")) {
					String trNo = request.getParameter("trNo");
					
					orgSubscriptionDetail.setPaymentMode(3);
					orgSubscriptionDetail.setTrNo(trNo);
					
				} else if( isCheque.equalsIgnoreCase("1"))
				{
					orgSubscriptionDetail.setPaymentMode(1);
					orgSubscriptionDetail.setBankName("");
					orgSubscriptionDetail.setTrNo("");
				
				}
				
			} else {
				orgSubscription.setPaidAmt(0);
				orgSubscription.setRemAmt(Float.parseFloat(pkgAmt));
				orgSubscriptionDetail.setBankName("");
				orgSubscriptionDetail.setChequeDate("0000-00-00");
				orgSubscriptionDetail.setTrNo("");

			}

			OrgSubscription res = rest.postForObject(Constants.url + "/saveOrgSubscription", orgSubscription,
					OrgSubscription.class);

			if(isPay==1)
			{
				orgSubscriptionDetail.setSubId(res.getSubId());
				System.out.println("subId"+res.getSubId());
				OrgSubscriptionDetail res1 = rest.postForObject(Constants.url + "/saveOrgSubscrptionDetails",
						orgSubscriptionDetail, OrgSubscriptionDetail.class);
				System.out.println("res1"+res1);

			}
			
			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showOrgSubscription";
	}

	@RequestMapping(value = "/orgSubscriptionList", method = RequestMethod.GET)
	public ModelAndView orgSubscriptionList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/orgSubscriptionList");
		try {

			OrgSubscription[] orgSubscription = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", OrgSubscription[].class);
			List<OrgSubscription> orgSubscriptionList = new ArrayList<OrgSubscription>(Arrays.asList(orgSubscription));

			model.addObject("orgSubscriptionList", orgSubscriptionList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
