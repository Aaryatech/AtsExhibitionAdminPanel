package com.ats.exhibition;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView; 
import com.ats.exhibition.common.Constants;
import com.ats.model.EventWithOrgName;
import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.LoginResponse;
import com.ats.model.Organiser;
import com.ats.model.VisitorWithOrgEventName;
 

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private JavaMailSender mailSender;


	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		try {

			/*
			 SimpleMailMessage email = new SimpleMailMessage();
		        email.setTo("akshaykasar72@gmail.com");
		        email.setSubject("test auto email");
		        email.setText("Hi, This is test email");


		        mailSender.send(email);*/
		        
			
		}catch (Exception e) {
			// TODO: handle exception
e.printStackTrace();
		}
		
		
		
		return "login";
	}
	
	
	@RequestMapping("/loginProcess")
	public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse res) throws IOException {

		String name = request.getParameter("username");
		String password = request.getParameter("userpassword");

		ModelAndView mav = new ModelAndView("login");
		
		Constants.mainAct=0;
		Constants.subAct=0;
		res.setContentType("text/html");
		try {
			System.out.println("Login Process " + name);
			System.out.println("password " + password);

			if (name.equalsIgnoreCase("") || password.equalsIgnoreCase("") || name == null || password == null) {

				mav = new ModelAndView("login");
			} else {

				//String pass = "1234";
				RestTemplate rest = new RestTemplate();
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("userMob", name);
				map.add("userPassword", password);
				LoginResponse loginResponse = rest.postForObject(Constants.url + "/loginResponse", map,
						LoginResponse.class);
				System.out.println("loginResponse" + loginResponse);

				if (loginResponse.isError() == false) {
					mav = new ModelAndView("home");
					HttpSession session = request.getSession();
					session.setAttribute("organiser", loginResponse.getOrganiser());
					session.setAttribute("UserDetail", loginResponse);
					
					if(loginResponse.getOrganiser().getOrgType()==0)
					{
						 EventWithOrgName[]  eventWithOrgName = rest.getForObject(Constants.url + "/getAllEventsByIsUsed",
								 EventWithOrgName[].class);
						 List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
						 
						 
						 ExhibitorWithOrgName[]  exhibitorWithOrgName = rest.getForObject(Constants.url + "/getAllExhibitorsByIsUsed",
								 ExhibitorWithOrgName[].class);
						 List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(exhibitorWithOrgName));
						 
						 Organiser[]  organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed",
								 Organiser[].class);
						 List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
						 
						 
						 VisitorWithOrgEventName[]  visitorWithOrgEventName = rest.getForObject(Constants.url + "/getAllVisitorsByIsUsed",
								 VisitorWithOrgEventName[].class);
						 List<VisitorWithOrgEventName> visitorList = new ArrayList<VisitorWithOrgEventName>(Arrays.asList(visitorWithOrgEventName));
						 
						 mav.addObject("eventList", eventList);
						 mav.addObject("exhibitorList", exhibitorList);
						 mav.addObject("organiserList", organiserList);
						 mav.addObject("visitorList", visitorList);
					}
					else
					{
						map = new LinkedMultiValueMap<String, Object>();
						map.add("orgId", loginResponse.getOrganiser().getOrgId());
						 EventWithOrgName[]  eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map,
								 EventWithOrgName[].class);
						 List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
						 
						 ExhibitorWithOrgName[]  exhibitorWithOrgName = rest.postForObject(Constants.url + "/getAllExhibotorsByorgIdAndIsUsed",map,
								 ExhibitorWithOrgName[].class);
						 List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(exhibitorWithOrgName));
						 
						 VisitorWithOrgEventName[]  visitorWithOrgEventName = rest.postForObject(Constants.url + "/getAllVisitorsByOrgId",map,
								 VisitorWithOrgEventName[].class);
						 List<VisitorWithOrgEventName> visitorList = new ArrayList<VisitorWithOrgEventName>(Arrays.asList(visitorWithOrgEventName));
						 
						 mav.addObject("eventList", eventList);
						 mav.addObject("exhibitorList", exhibitorList); 
						 mav.addObject("visitorList", visitorList);
					}

				} else {

					mav = new ModelAndView("login");
					System.out.println("Invalid login credentials");

				}
				
				/*if (name.equals("tester") && password.equals("1234")) {
					mav = new ModelAndView("home");
					 
				} else {

					mav = new ModelAndView("login");
					System.out.println("Invalid login credentials");

				}*/

			}
		} catch (Exception e) {
			System.out.println("HomeController Login API Excep:  " + e.getMessage());
			e.printStackTrace();
		}

		return mav;

	}
	
	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		logger.info(" /home request mapping.");

		ModelAndView mav = new ModelAndView("home");
		try {
			
		
		RestTemplate restTemplate = new RestTemplate();

		
		mav = new ModelAndView("home");
		HttpSession session = request.getSession();
		LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
		 
		if(login.getOrganiser().getOrgType()==0)
		{
			 EventWithOrgName[]  eventWithOrgName = restTemplate.getForObject(Constants.url + "/getAllEventsByIsUsed",
					 EventWithOrgName[].class);
			 List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			 
			 
			 ExhibitorWithOrgName[]  exhibitorWithOrgName = restTemplate.getForObject(Constants.url + "/getAllExhibitorsByIsUsed",
					 ExhibitorWithOrgName[].class);
			 List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(exhibitorWithOrgName));
			 
			 Organiser[]  organiser = restTemplate.getForObject(Constants.url + "/getAllOrganisersByIsUsed",
					 Organiser[].class);
			 List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			 
			 mav.addObject("eventList", eventList);
			 mav.addObject("exhibitorList", exhibitorList);
			 mav.addObject("organiserList", organiserList);
		}
		else
		{ 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			 EventWithOrgName[]  eventWithOrgName = restTemplate.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map,
					 EventWithOrgName[].class);
			 List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			 
			 ExhibitorWithOrgName[]  exhibitorWithOrgName = restTemplate.postForObject(Constants.url + "/getAllExhibotorsByorgIdAndIsUsed",map,
					 ExhibitorWithOrgName[].class);
			 List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(exhibitorWithOrgName));
			 
			 mav.addObject("eventList", eventList);
			 mav.addObject("exhibitorList", exhibitorList); 
		}
		}
		catch(Exception e)
		{
			System.out.println("HomeController Home Request Page Exception:  " + e.getMessage());
		}
		
		
		
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/sessionTimeOut" , method = RequestMethod.GET)
	public ModelAndView displayLoginAgain(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("login");

		logger.info("/sessionTimeOut request mapping.");

		model.addObject("loginResponseMessage", "Session timeout ! Please login again . . .");

		return model;

	}
	
}
