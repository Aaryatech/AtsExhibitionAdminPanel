package com.ats.exhibition.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ats.model.EventExhMapping;
import com.ats.model.EventWithOrgName;
import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.Location;
import com.ats.model.LoginResponse;
import com.ats.model.Organiser;
import com.ats.model.Package1;
import com.ats.model.SortedExhibitor;

@Controller
@Scope("session")
public class SuperAdminController {
	
	
RestTemplate rest = new RestTemplate();
	
	@RequestMapping(value = "/showEventList", method = RequestMethod.GET)
	public ModelAndView showEventList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/showEventList");
		try
		{ 
		 
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/eventListByOrgId/{orgId}", method = RequestMethod.GET)
	public ModelAndView eventListByOrgId(@PathVariable int orgId,HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/showEventList");
		try
		{ 
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", orgId);
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			 
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList);
			 
			model.addObject("eventList", eventList); 
			model.addObject("orgId", orgId); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/showExhibitorList", method = RequestMethod.GET)
	public ModelAndView showExhibitorList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/showExhibitorList");
		try
		{ 
		 
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList);
			
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
					Location[].class); 
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
			 
			
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed", 
					CompanyType[].class); 
			List<CompanyType> companyTypeList = new ArrayList<CompanyType>(Arrays.asList(companyType));
			
			model.addObject("companyTypeList", companyTypeList);
			model.addObject("locationList", locationList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	List<EventWithOrgName> eventListByOrgId = new ArrayList<EventWithOrgName>();
	
	@RequestMapping(value = "/eventListByOrganizerId", method = RequestMethod.GET)
	@ResponseBody
	public List<EventWithOrgName> eventListByOrganizerId(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("inside eventlist ajax");
		
		try
		{ 
			 int orgId = Integer.parseInt(request.getParameter("orgId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", orgId);
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			 eventListByOrgId = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return eventListByOrgId;
	}
	
	
	@RequestMapping(value = "/sortedExhibitorList", method = RequestMethod.GET)
	@ResponseBody
	public List<SortedExhibitor> sortedExhibitorList(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("inside eventlist ajax");
		List<SortedExhibitor> sortedExhibitorList = new ArrayList<SortedExhibitor>();
		try
		{ 
			 String[] eventId =  request.getParameterValues("eventId[]") ;
			 String[] compType = request.getParameterValues("compType[]");
			 String[] locationId = request.getParameterValues("locationId[]");
			 
			 String compTypeList = new String();
			 String LocationList = new String();
			 String eventIdList = new String();
			 
			 if(compType[0].equals("0"))
			 {
				 compTypeList="0";
			 }
			 else
			 {
				 for(int i = 0 ; i<compType.length;i++)
				 {
					 compTypeList = compTypeList + "," + compType[i];
				 }
				 compTypeList = compTypeList.substring(1, compTypeList.length());
			 }
			 
			 if(locationId[0].equals("0"))
			 {
				 LocationList="0";
			 }
			 else
			 {
				 for(int i = 0 ; i<locationId.length;i++)
				 {
					 LocationList = LocationList + "," + locationId[i];
				 }
				 LocationList = LocationList.substring(1, LocationList.length());
			 }
			 
			 if(eventId[0].equals("0"))
			 {
				 for(int i = 0 ; i<eventListByOrgId.size();i++)
				 {
					 eventIdList = eventIdList + "," + eventListByOrgId.get(i).getEventId();
				 }
				 eventIdList = eventIdList.substring(1, eventIdList.length());
			 }
			 else
			 {
				 for(int i = 0 ; i<eventId.length;i++)
				 {
					 eventIdList = eventIdList + "," + eventId[i];
				 }
				 eventIdList = eventIdList.substring(1, eventIdList.length());
			 }
			 
			 System.out.println("LocationList" + LocationList);
			 System.out.println("compTypeList" + compTypeList);
			 System.out.println("eventIdList" + eventIdList);
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventIdList);
			map.add("locationId", LocationList);
			map.add("companyType", compTypeList);
			
			System.out.println(map);
			
			SortedExhibitor[] sortedExhibitor = rest.postForObject(Constants.url + "/sortedExhibitorByLocationAndCompanyType",map, 
					SortedExhibitor[].class); 
			sortedExhibitorList = new ArrayList<SortedExhibitor>(Arrays.asList(sortedExhibitor));
			 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return sortedExhibitorList;
	}
	
	@RequestMapping(value = "/exhibitorListByLocationAndCompType", method = RequestMethod.GET) 
	public ModelAndView exhibitorListByLocationAndCompType(HttpServletRequest request, HttpServletResponse response) {

		  
		ModelAndView model = new ModelAndView("SuperAdmin/showExhibitorListByLocation");
		try
		{ 
			
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
					Location[].class); 
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
			 
			
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed", 
					CompanyType[].class); 
			List<CompanyType> companyTypeList = new ArrayList<CompanyType>(Arrays.asList(companyType));
			
			model.addObject("companyTypeList", companyTypeList);
			model.addObject("locationList", locationList);
			 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/sortedExhibitorListByLocationAndCompType", method = RequestMethod.GET)
	@ResponseBody
	public List<ExhibitorWithOrgName> sortedExhibitorListByLocationAndCompType(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("inside eventlist ajax");
		List<ExhibitorWithOrgName> sortedExhibitorList = new ArrayList<ExhibitorWithOrgName>();
		try
		{ 
			 
			 String[] compType = request.getParameterValues("compType[]");
			 String[] locationId = request.getParameterValues("locationId[]");
			 
			 String compTypeList = new String();
			 String LocationList = new String();
			 
			 
			 if(compType[0].equals("0"))
			 {
				 compTypeList="0";
			 }
			 else
			 {
				 for(int i = 0 ; i<compType.length;i++)
				 {
					 compTypeList = compTypeList + "," + compType[i];
				 }
				 compTypeList = compTypeList.substring(1, compTypeList.length());
			 }
			 
			 if(locationId[0].equals("0"))
			 {
				 LocationList="0";
			 }
			 else
			 {
				 for(int i = 0 ; i<locationId.length;i++)
				 {
					 LocationList = LocationList + "," + locationId[i];
				 }
				 LocationList = LocationList.substring(1, LocationList.length());
			 }
			 
			 
			 
			 System.out.println("LocationList" + LocationList);
			 System.out.println("compTypeList" + compTypeList); 
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 
			map.add("locationId", LocationList);
			map.add("companyType", compTypeList);
			
			System.out.println(map);
			
			ExhibitorWithOrgName[] exhibitorWithOrgName = rest.postForObject(Constants.url + "/sortedExhibitorListByLocationAndCompType",map, 
					ExhibitorWithOrgName[].class); 
			sortedExhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(exhibitorWithOrgName));
			 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return sortedExhibitorList;
	}
	
	@RequestMapping(value = "/exhibitorListByOrgId/{orgId}", method = RequestMethod.GET)
	public ModelAndView exhibitorListByOrgId(@PathVariable int orgId,HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/showExhibitorList");
		try
		{ 
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", orgId);
			ExhibitorWithOrgName[] ExhibitorWithOrgName = rest.postForObject(Constants.url + "/getAllExhibotorsByorgIdAndIsUsed",map, 
					ExhibitorWithOrgName[].class); 
			List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(ExhibitorWithOrgName));
			
			model.addObject("exhibitorList", exhibitorList); 
			 
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList); 
			model.addObject("exhibitorList", exhibitorList); 
			model.addObject("orgId", orgId); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/addOrganizerPackage", method = RequestMethod.GET)
	public ModelAndView exhibitorListByOrgId(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/addOrganizerPackage");
		try
		{ 
			  
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/organizerPakageList", method = RequestMethod.GET)
	public ModelAndView organizerPakageList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/organizerPakageList");
		try
		{ 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgType", 1);
			Package1[] package1 = rest.postForObject(Constants.url + "/getAllPackagesByPkgType",map, 
					Package1[].class); 
			List<Package1> packageList = new ArrayList<Package1>(Arrays.asList(package1));
			model.addObject("packageList", packageList); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/editOrganizerPackage/{pkgId}", method = RequestMethod.GET)
	public ModelAndView editOrganizerPackage(@PathVariable int pkgId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/addOrganizerPackage");
		try
		{ 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgId", pkgId);
			Package1  package1 = rest.postForObject(Constants.url + "/getPackageByPkgId",map, 
					Package1 .class); 
			model.addObject("package1", package1); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/deleteOrganizerPackage/{pkgId}", method = RequestMethod.GET)
	public String deleteOrganizerPackage(@PathVariable int pkgId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("SuperAdmin/addOrganizerPackage");
		try
		{ 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgId", pkgId);
			ErrorMessage  errorMessage = rest.postForObject(Constants.url + "/deletePackage",map, 
					ErrorMessage .class); 
			//model.addObject("package1", package1); 
			System.out.println(errorMessage.toString());
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/organizerPakageList";
	}
	
	@RequestMapping(value = "/insertOrganizerPackage", method = RequestMethod.POST)
	public String insertOrganizerPackage(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String pkgId = request.getParameter("pkgId");
			String pkgName = request.getParameter("pkgName");
			int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
			float pkgAmt = Float.parseFloat(request.getParameter("pkgAmt"));
			 
			 
			Package1 insert = new Package1();
			if(pkgId=="" || pkgId == null)
				insert.setPkgId(0);
			else
				insert.setPkgId(Integer.parseInt(pkgId));
			insert.setPkgName(pkgName);
			insert.setSubDuration(noOfDays);
			insert.setPkgAmt(pkgAmt);
			insert.setIsUsed(1);
			insert.setPkgType(1);
			
			Package1 res = rest.postForObject(Constants.url + "/savePackage",insert,
					Package1.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/organizerPakageList";
	}
	
	
	@RequestMapping(value = "/addExhibitorPackage", method = RequestMethod.GET)
	public ModelAndView addExhibitorPackage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/addExhibitorPackage");
		try
		{ 
			  
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/exhibitorPakageList", method = RequestMethod.GET)
	public ModelAndView exhibitorPakageList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/exhibitorPakageList");
		try
		{ 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgType", 2);
			Package1[] package1 = rest.postForObject(Constants.url + "/getAllPackagesByPkgType",map, 
					Package1[].class); 
			List<Package1> packageList = new ArrayList<Package1>(Arrays.asList(package1));
			model.addObject("packageList", packageList); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/editExhibitorPackage/{pkgId}", method = RequestMethod.GET)
	public ModelAndView editExhibitorPackage(@PathVariable int pkgId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/addExhibitorPackage");
		try
		{ 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgId", pkgId);
			Package1  package1 = rest.postForObject(Constants.url + "/getPackageByPkgId",map, 
					Package1 .class); 
			model.addObject("package1", package1); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/deleteExhibitorPackage/{pkgId}", method = RequestMethod.GET)
	public String deleteExhibitorPackage(@PathVariable int pkgId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("SuperAdmin/addOrganizerPackage");
		try
		{ 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgId", pkgId);
			ErrorMessage  errorMessage = rest.postForObject(Constants.url + "/deletePackage",map, 
					ErrorMessage .class); 
			//model.addObject("package1", package1); 
			System.out.println(errorMessage.toString());
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/exhibitorPakageList";
	}
	
	@RequestMapping(value = "/insertExhibitorPackage", method = RequestMethod.POST)
	public String insertExhibitorPackage(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String pkgId = request.getParameter("pkgId");
			String pkgName = request.getParameter("pkgName");
			int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
			float pkgAmt = Float.parseFloat(request.getParameter("pkgAmt"));
			 
			 
			Package1 insert = new Package1();
			if(pkgId=="" || pkgId == null)
				insert.setPkgId(0);
			else
				insert.setPkgId(Integer.parseInt(pkgId));
			insert.setPkgName(pkgName);
			insert.setSubDuration(noOfDays);
			insert.setPkgAmt(pkgAmt);
			insert.setIsUsed(1);
			insert.setPkgType(2);
			
			Package1 res = rest.postForObject(Constants.url + "/savePackage",insert,
					Package1.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/exhibitorPakageList";
	}

}
