package com.ats.exhibition.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.exhibition.common.Constants;
import com.ats.model.CompanyType;
import com.ats.model.ErrorMessage;
import com.ats.model.Location;
import com.ats.model.Organiser;

@Controller
@Scope("session")
public class LocationController {
	
	RestTemplate rest = new RestTemplate();
	
	@RequestMapping(value = "/addLocation", method = RequestMethod.GET)
	public ModelAndView addLocation(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addLocation");
		try
		{ 
		 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/loctionList", method = RequestMethod.GET)
	public ModelAndView loctionList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/loctionList");
		try
		{ 
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
					Location[].class); 
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
			
			model.addObject("locationList", locationList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/insertLocation", method = RequestMethod.POST)
	public String insertLocation(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String locationId = request.getParameter("locationId");
			String locationName = request.getParameter("locationName");
			String locationLong = request.getParameter("locationLongi");
			String locationLat = request.getParameter("locationLat");
			String remark = request.getParameter("remark");
			
			
			Location location=new Location();
			if(locationId=="" || locationId == null)
				location.setLocationId(0);
			else
				
				location.setLocationId(Integer.parseInt(locationId));
				location.setLocationName(locationName);
			location.setLocationLong(locationLong);
			location.setLocationLat(locationLat);
			location.setRemark(remark);
			location.setIsUsed(1);
			Location res = rest.postForObject(Constants.url + "/saveLocation",location,
					Location.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/addLocation";
	}
	
	
	@RequestMapping(value = "/editLocation/{locationId}", method = RequestMethod.GET)
	public ModelAndView editLocation(@PathVariable int locationId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addLocation");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("locationId", locationId);
			Location editLocation = rest.postForObject(Constants.url + "/getLocationByLocIdAndIsUsed",map,
					Location.class); 
			model.addObject("editLocation", editLocation);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteLocation/{locationId}", method = RequestMethod.GET)
	public String deleteLocation(@PathVariable int locationId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("locationId", locationId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteLocation",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/loctionList";
	}
	
	
	
	@RequestMapping(value = "/addCompanyType", method = RequestMethod.GET)
	public ModelAndView addCompanyType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addCompanyType");
		try
		{ 
		 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	
	@RequestMapping(value = "/companyTypeList", method = RequestMethod.GET)
	public ModelAndView companyTypeList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/companyList");
		try
		{ 
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed", 
					CompanyType[].class); 
			List<CompanyType> companyList = new ArrayList<CompanyType>(Arrays.asList(companyType));
			
			model.addObject("companyList", companyList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/insertCompanyType", method = RequestMethod.POST)
	public String insertCompantType(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String companyTypeId = request.getParameter("companyTypeId");
			String companyTypeName = request.getParameter("companyTypeName");
			String companyTypeDesc = request.getParameter("companyTypeDesc");
			
			
			CompanyType companyType=new CompanyType();
			if(companyTypeId=="" || companyTypeId == null)
				companyType.setCompanyTypeId(0);
			else
				
				companyType.setCompanyTypeId(Integer.parseInt(companyTypeId));
			companyType.setCompanyTypeName(companyTypeName);
			companyType.setCompanyTypeDesc(companyTypeDesc);
			companyType.setIsUsed(1);
		
			
			CompanyType res = rest.postForObject(Constants.url + "/saveCompanyType",companyType,
					CompanyType.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/addCompanyType";
	}
	
	@RequestMapping(value = "/editCompanyType/{companyTypeId}", method = RequestMethod.GET)
	public ModelAndView editCompanyType(@PathVariable int companyTypeId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addCompanyType");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("companyTypeId", companyTypeId);
			CompanyType editCompanyType = rest.postForObject(Constants.url + "/getCompanyTypeByCompanyTypeIdAndIsUsed",map,
					CompanyType.class); 
			model.addObject("editCompanyType", editCompanyType);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteCompanyType/{companyTypeId}", method = RequestMethod.GET)
	public String deleteOrg(@PathVariable int companyTypeId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("companyTypeId", companyTypeId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteCompanyType",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/companyTypeList";
	}
	
	
	

}
