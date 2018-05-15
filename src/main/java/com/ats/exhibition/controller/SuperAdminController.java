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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.exhibition.common.Constants;
import com.ats.model.EventExhMapping;
import com.ats.model.EventWithOrgName;
import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.LoginResponse;
import com.ats.model.Organiser;

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
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
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

}
