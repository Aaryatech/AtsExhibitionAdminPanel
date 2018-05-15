package com.ats.exhibition.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.exhibition.common.Constants;
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
	public ModelAndView orgnizerList(HttpServletRequest request, HttpServletResponse response) {

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

}
