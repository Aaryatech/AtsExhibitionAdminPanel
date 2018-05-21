package com.ats.exhibition.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ats.exhibition.common.Constants;
import com.ats.exhibition.common.DateConvertor;
import com.ats.exhibition.common.VpsImageUpload;
import com.ats.model.ComMemWithOrgName;
import com.ats.model.CommitteeMembers;
import com.ats.model.CompanyType;
import com.ats.model.ErrorMessage;
import com.ats.model.EventExhMapping;
import com.ats.model.EventWithOrgName;
import com.ats.model.Events;
import com.ats.model.Exhibitor;
import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.FloarMap;
import com.ats.model.GetFloarMap;
import com.ats.model.GetSchedule;
import com.ats.model.GetSponsor;
import com.ats.model.LoginResponse;
import com.ats.model.Organiser;
import com.ats.model.ScheduleDetail;
import com.ats.model.ScheduleHeader;
import com.ats.model.Sponsor;
 
 
@Controller
@Scope("session")
public class OrganizerController {
	
	RestTemplate rest = new RestTemplate();
	
	@RequestMapping(value = "/addOrganizer", method = RequestMethod.GET)
	public ModelAndView addOrganizer(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{ 
		 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/orgnizerList", method = RequestMethod.GET)
	public ModelAndView orgnizerList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/orgnizerList");
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
	
	@RequestMapping(value = "/insertOrganizer", method = RequestMethod.POST)
	public String insertOrganizer(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String orgId = request.getParameter("orgId");
			String orgName = request.getParameter("orgName");
			String orgAdd = request.getParameter("orgAdd");
			String email = request.getParameter("email");
			String contNo = request.getParameter("contNo");
			String webLink = request.getParameter("webLink");
			String workArea = request.getParameter("workArea");
			String aboutOrg = request.getParameter("aboutOrg"); 
			int orgType = Integer.parseInt(request.getParameter("orgType"));
			
			String mob = request.getParameter("mob"); 
			String password = request.getParameter("password");
			
			Organiser organiser = new Organiser();
			if(orgId=="" || orgId == null)
				organiser.setOrgId(0);
			else
				organiser.setOrgId(Integer.parseInt(orgId));
			organiser.setOrgName(orgName);
			organiser.setOrgAddress(orgAdd);
			organiser.setOrgEmailId(email);
			organiser.setOrgContactNo(contNo);
			organiser.setWebsiteLink(webLink);
			organiser.setWorkAreaKeywords(workArea);
			organiser.setOrgType(orgType);
			organiser.setAboutOrg(aboutOrg);
			organiser.setIsUsed(1);
			organiser.setIsActive(1);
			organiser.setUserMob(mob);
			organiser.setUserPassword(password);
			
			Organiser res = rest.postForObject(Constants.url + "/saveOrganiser",organiser,
					Organiser.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/orgnizerList";
	}
	
	@RequestMapping(value = "/editOrg/{orgId}", method = RequestMethod.GET)
	public ModelAndView editOrg(@PathVariable int orgId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", orgId);
			Organiser editOrganiser = rest.postForObject(Constants.url + "/getOrganiserByOrgId",map,
					Organiser.class); 
			model.addObject("editOrganiser", editOrganiser);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteOrg/{orgId}", method = RequestMethod.GET)
	public String deleteOrg(@PathVariable int orgId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", orgId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteOrganiser",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/orgnizerList";
	}
	
	@RequestMapping(value = "/addEvent", method = RequestMethod.GET)
	public ModelAndView addEmployee(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addEvent");
		try
		{ 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/insertEvent", method = RequestMethod.POST)
	public String insertEvent(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String eventId = request.getParameter("eventId");
			String eventName = request.getParameter("eventName");
			String eventLocation = request.getParameter("eventLocation");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String fromTime = request.getParameter("fromTime");
			String toTime = request.getParameter("toTime");
			String aboutEvent = request.getParameter("aboutEvent"); 
			String pers1 = request.getParameter("pers1"); 
			String pers2 = request.getParameter("pers2"); 
			String mob1 = request.getParameter("mob1"); 
			String mob2 = request.getParameter("mob2"); 
			String email1 = request.getParameter("email1"); 
			String email2 = request.getParameter("email2"); 
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			 
			Events event = new Events();
			
			if(eventId=="" || eventId == null)
				event.setEventId(0);
			else
				event.setEventId(Integer.parseInt(eventId));
			event.setEventName(eventName);
			event.setEventLocation(eventLocation);
			event.setEventFromDate(DateConvertor.convertToYMD(fromDate));
			event.setEventToDate(DateConvertor.convertToYMD(toDate));
			event.setFromTime(fromTime); 
			event.setFromTime(fromTime);
			event.setToTime(toTime);
			event.setAboutEvent(aboutEvent);
			event.setContactPersonName1(pers1);
			event.setContactPersonName2(pers2);
			event.setPerson1Mob(mob1);
			event.setPerson2Mob(mob2);
			event.setPerson1EmailId(email1);
			event.setPerson2EmailId(email2);
			event.setEventLocLat(latitude);
			event.setEventLocLong(longitude);
			event.setIsUsed(1);
			event.setOrgId(login.getOrganiser().getOrgId());
			
			Events res = rest.postForObject(Constants.url + "/saveEvents",event,
					Events.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/eventList";
	}
	
	
	@RequestMapping(value = "/eventList", method = RequestMethod.GET)
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/eventList");
		try
		{ 
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteEvent/{eventId}", method = RequestMethod.GET)
	public String deleteEvent(@PathVariable int eventId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteEvent",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/eventList";
	}
	
	@RequestMapping(value = "/editEvent/{eventId}", method = RequestMethod.GET)
	public ModelAndView editEvent(@PathVariable int eventId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addEvent");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			EventWithOrgName editEvent = rest.postForObject(Constants.url + "/getAllEventsByEventId",map,
					EventWithOrgName.class); 
			model.addObject("editEvent", editEvent);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/addCommitteeMember", method = RequestMethod.GET)
	public ModelAndView addCommitteeMember(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addCommitteeMember");
		try
		{ 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/committeeMemberList", method = RequestMethod.GET)
	public ModelAndView committeeMemberList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/committeeMemberList");
		try
		{ 
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			ComMemWithOrgName[] committeeMember = rest.postForObject(Constants.url + "/getAllCommitteeMembersByOrgIdAndIsUsed",map, 
					ComMemWithOrgName[].class); 
			List<ComMemWithOrgName> committeeMemberList = new ArrayList<ComMemWithOrgName>(Arrays.asList(committeeMember));
			
			model.addObject("committeeMemberList", committeeMemberList); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String memId = request.getParameter("memId");
			String memName = request.getParameter("memName");
			String designation = request.getParameter("designation");
			String mob = request.getParameter("mob");
			String email = request.getParameter("emailId");
			String compName = request.getParameter("compName");
			String remark = request.getParameter("remark"); 
			
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			System.out.println("email " + email);
			CommitteeMembers committeeMembers = new CommitteeMembers();
			
			if(memId=="" || memId == null)
				committeeMembers.setMemId(0);
			else
				committeeMembers.setMemId(Integer.parseInt(memId)); 
			committeeMembers.setOrgId(login.getOrganiser().getOrgId());
			committeeMembers.setMemberName(memName);
			committeeMembers.setDesignation(designation);
			committeeMembers.setContactNo(mob);
			committeeMembers.setEmailId(email);
			committeeMembers.setCompanyName(compName);
			committeeMembers.setRemark(remark);
			committeeMembers.setIsUsed(1);
			System.out.println("committeeMembers " + committeeMembers);
			
			CommitteeMembers res = rest.postForObject(Constants.url + "/saveCommitteeMember",committeeMembers,
					CommitteeMembers.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/committeeMemberList";
	}
	
	@RequestMapping(value = "/editMember/{memId}", method = RequestMethod.GET)
	public ModelAndView editMember(@PathVariable int memId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addCommitteeMember");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("memId", memId);
			ComMemWithOrgName editComMember = rest.postForObject(Constants.url + "/getAllCommitteeMembersByMemId",map,
					ComMemWithOrgName.class); 
			model.addObject("editComMember", editComMember);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteMember/{memId}", method = RequestMethod.GET)
	public String deleteMember(@PathVariable int memId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("memId", memId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteCommitteeMembers",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/committeeMemberList";
	}
	
	@RequestMapping(value = "/addExhibitor", method = RequestMethod.GET)
	public ModelAndView addExhibitor(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addExhibitor");
		try
		{ 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/insertExhibitor", method = RequestMethod.POST)
	public String insertExhibitor(HttpServletRequest request, HttpServletResponse response) {

		 
		try
		{ 
			String exhId = request.getParameter("exhId");
			String exhibitorName = request.getParameter("exhibitorName");
			String compnyName = request.getParameter("compnyName");
			String aboutCompany = request.getParameter("aboutCompany");
			String pers1 = request.getParameter("pers1");
			String pers2 = request.getParameter("pers2");
			String mob1 = request.getParameter("mob1"); 
			String mob2 = request.getParameter("mob2"); 
			String email1 = request.getParameter("email1"); 
			String email2 = request.getParameter("email2"); 
			String latitude = request.getParameter("latitude"); 
			String longitude = request.getParameter("longitude");
			String address = request.getParameter("address");
			int companyType = Integer.parseInt(request.getParameter("companyType"));
			String usesrMob = request.getParameter("usesrMob");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			
			Exhibitor exhibitor = new Exhibitor();
			
			if(exhId=="" || exhId == null)
				exhibitor.setExhId(0);
			else
				exhibitor.setExhId(Integer.parseInt(exhId));  
			exhibitor.setExhName(exhibitorName);
			exhibitor.setExhCompany(compnyName);
			exhibitor.setAboutCompany(aboutCompany);
			exhibitor.setContactPersonName1(pers1);
			exhibitor.setContactPersonName2(pers2);
			exhibitor.setPersonEmail1(email1);
			exhibitor.setPersonEmail2(email2);
			exhibitor.setPersonMob1(mob1);
			exhibitor.setPersonMob2(mob2);
			exhibitor.setCompLat(latitude);
			exhibitor.setCompLong(longitude);
			exhibitor.setAddress(address);
			exhibitor.setCompanyType(companyType);
			exhibitor.setUserMob(usesrMob);
			exhibitor.setPassword(password);
			exhibitor.setOrgId(login.getOrganiser().getOrgId());
			exhibitor.setIsUsed(1);
			exhibitor.setIsUsed(1);
			
			System.out.println("exhibitor " + exhibitor);
			
			Exhibitor res = rest.postForObject(Constants.url + "/saveExhibitor",exhibitor,
					Exhibitor.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/exhibitorList";
	}
	
	@RequestMapping(value = "/exhibitorList", method = RequestMethod.GET)
	public ModelAndView exhibitorList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/exhibitorList");
		try
		{ 
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			ExhibitorWithOrgName[] ExhibitorWithOrgName = rest.postForObject(Constants.url + "/getAllExhibotorsByorgIdAndIsUsed",map, 
					ExhibitorWithOrgName[].class); 
			List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(ExhibitorWithOrgName));
			
			model.addObject("exhibitorList", exhibitorList); 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/editExhibitor/{exhId}", method = RequestMethod.GET)
	public ModelAndView editExhibitor(@PathVariable int exhId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/addExhibitor");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("exhId", exhId);
			ExhibitorWithOrgName editExhibitor = rest.postForObject(Constants.url + "/getExhibitorByExhId",map,
					ExhibitorWithOrgName.class); 
			model.addObject("editExhibitor", editExhibitor);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteExhibitor/{exhId}", method = RequestMethod.GET)
	public String deleteExhibitor(@PathVariable int exhId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("exhId", exhId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteExhibitor",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/exhibitorList";
	}
	
	@RequestMapping(value = "/eventMapToExhibitor", method = RequestMethod.GET)
	public ModelAndView eventMapToExhibitor(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/eventMapToExhibitor");
		try
		{ 
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	List<EventExhMapping> eventExhMappingList = new ArrayList<EventExhMapping>();
	List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>();
	
	@RequestMapping(value = "/eventMapList/{eventId}", method = RequestMethod.GET)
	public ModelAndView eventMapList(@PathVariable int eventId,HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/eventMapToExhibitor");
		try
		{ 
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			 
			ExhibitorWithOrgName[] ExhibitorWithOrgName = rest.postForObject(Constants.url + "/getAllExhibotorsByorgIdAndIsUsed",map, 
					ExhibitorWithOrgName[].class); 
			List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(ExhibitorWithOrgName));
			System.out.println(exhibitorList);
			 
			map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			EventExhMapping[] eventExhMapping = rest.postForObject(Constants.url + "/eventMappingListByEventId",map, 
					EventExhMapping[].class); 
			 eventExhMappingList = new ArrayList<EventExhMapping>(Arrays.asList(eventExhMapping));
			
			for(int j = 0 ; j<exhibitorList.size();j++)
			{
				int flag=1;
				for(int i = 0; i<eventExhMappingList.size();i++)
				{ 
					if(eventExhMappingList.get(i).getExhId()==exhibitorList.get(j).getExhId())
					{
						flag=0;
						break;
					}
				}
				if(flag==1)
				{
					EventExhMapping eventExh = new EventExhMapping();
					eventExh.setExhId(exhibitorList.get(j).getExhId());
					eventExhMappingList.add(eventExh);
				}
			}
			
			model.addObject("eventList", eventList);
			model.addObject("exhibitorList", exhibitorList); 
			model.addObject("eventId", eventId);
			model.addObject("eventExhMappingList", eventExhMappingList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/sumbitMapping", method = RequestMethod.POST)
	public String sumbitMapping(HttpServletRequest request, HttpServletResponse response) {

		int eventId = 0;
		try
		{ 
			String[] checkbox=request.getParameterValues("select_to_approve");
			 eventId = Integer.parseInt(request.getParameter("eventId"));
			 String eventName = null;
			 List<EventExhMapping> insert = new ArrayList<EventExhMapping>();
			 
			 for(int i = 0 ;i<eventList.size();i++)
			 {
				 if(eventList.get(i).getEventId()==eventId)
					 eventName = eventList.get(i).getEventName();
			 }
			 for(int i = 0 ; i<eventExhMappingList.size();i++)
				{
					for(int j = 0; j<checkbox.length;j++)
					{
						if(Integer.parseInt(checkbox[j])==eventExhMappingList.get(i).getExhId())
						{
							EventExhMapping eventExh = new EventExhMapping();
							eventExh.setEventId(eventId);
							eventExh.setEventName(eventName);
							eventExh.setExhId(eventExhMappingList.get(i).getExhId());
							eventExh.setIsUsed(1); 
							insert.add(eventExh);
						}
					}
				}
			 List<EventExhMapping> res = rest.postForObject(Constants.url + "/saveEventExhMapping",insert,
						List.class); 
			 System.out.println(res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/eventMapList/"+eventId;
	}
	
	@RequestMapping(value = "/deleteExhibitorFromMapping/{mapId}/{eventId}", method = RequestMethod.GET)
	public String deleteExhibitorFromMapping(@PathVariable int mapId, @PathVariable int eventId,HttpServletRequest request, HttpServletResponse response) {
 
		try
		{ 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mapId", mapId);
			ErrorMessage res = rest.postForObject(Constants.url + "/deleteExhMapping",map,
					ErrorMessage.class); 
			 System.out.println(res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/eventMapList/"+eventId;
	}
	@RequestMapping(value = "/addSponsor", method = RequestMethod.GET)
	public ModelAndView addSponsor(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/sponsor");
		try
		{ 
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			
			GetSponsor[] sponsorList = rest.postForObject(Constants.url + "/findAllSponsors", 
					map,GetSponsor[].class); 
			List<GetSponsor> sponsorListRes = new ArrayList<GetSponsor>(Arrays.asList(sponsorList));
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed",
					CompanyType[].class);
			List<CompanyType> companyList = new ArrayList<CompanyType>(Arrays.asList(companyType));

			model.addObject("companyList", companyList);
			model.addObject("eventList", eventList);
			model.addObject("sponsorList", sponsorListRes);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/deleteSponsor/{sponsorId}", method = RequestMethod.GET)
	public String deleteSponsor(@PathVariable int sponsorId, HttpServletRequest request, HttpServletResponse response) {

		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("sponsorId", sponsorId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteSponsor",map,
					ErrorMessage.class); 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/addSponsor";
	}
	@RequestMapping(value = "/deleteSchedule/{scheduleId}", method = RequestMethod.GET)
	public String deleteSchedule(@PathVariable int scheduleId, HttpServletRequest request, HttpServletResponse response) {

		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("scheduleId", scheduleId);
			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deleteSchedule",map,
					ErrorMessage.class); 
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/scheduleList";
	}
	@RequestMapping(value = "/editSponsor/{sponsorId}", method = RequestMethod.GET)
	public ModelAndView editSponsor(@PathVariable int sponsorId, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("organizer/sponsor");

		try
		{
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			
			GetSponsor[] sponsorList = rest.postForObject(Constants.url + "/findAllSponsors", 
					map,GetSponsor[].class); 
			List<GetSponsor> sponsorListRes = new ArrayList<GetSponsor>(Arrays.asList(sponsorList));
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed",
					CompanyType[].class);
			List<CompanyType> companyList = new ArrayList<CompanyType>(Arrays.asList(companyType));

			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("sponsorId", sponsorId);
			Sponsor sponsorRes = rest.postForObject(Constants.url + "/getSponsorById",map,
					Sponsor.class); 

            model.addObject("sponsor", sponsorRes);
			model.addObject("companyList", companyList);
			model.addObject("eventList", eventList);
			model.addObject("sponsorList", sponsorListRes);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/insertSponsor", method = RequestMethod.POST)
	public String insertSponsor(HttpServletRequest request, HttpServletResponse response,@RequestParam("photo") List<MultipartFile> photo) {

		 
		try
		{ 
			int sponsorId=0;
			try {
			 sponsorId = Integer.parseInt(request.getParameter("sponsorId"));
			}
			catch (Exception e) {
			  
			   sponsorId=0;
			}
			int eventId = Integer.parseInt(request.getParameter("eventId"));
			String sponsorName = request.getParameter("sponsorName");
			int companyId = Integer.parseInt(request.getParameter("companyId"));
			String designation = request.getParameter("designation");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("emailId");
			String website = request.getParameter("website");
			String remark = request.getParameter("remark"); 
		
			VpsImageUpload upload = new VpsImageUpload();

			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			
			String curTimeStamp = sdf.format(cal.getTime());
			if(!photo.isEmpty())
			{
			try {
				
				upload.saveUploadedFiles(photo, Constants.SPONSOR_IMAGE_TYPE, curTimeStamp + "-" + photo.get(0).getOriginalFilename());
				System.out.println("upload method called " + photo.toString());
				
				
			} catch (IOException e) {
				
				System.out.println("Exce in File Upload In Product Insert " + e.getMessage());
				e.printStackTrace();
			}
			}
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			
			Sponsor sponsor = new Sponsor();
			
			sponsor.setSponsorId(sponsorId); 
			sponsor.setName(sponsorName);
			sponsor.setCompanyId(companyId);
			sponsor.setDesignation(designation);
			sponsor.setEmail(email);
			sponsor.setEventId(eventId);
			sponsor.setMobile(mobile);
			sponsor.setOrgId(login.getOrganiser().getOrgId());
			if(photo.isEmpty())
			sponsor.setPhoto("");
			else
		    sponsor.setPhoto(photo.get(0).getOriginalFilename());		
			sponsor.setRemark(remark);
			sponsor.setWebsite(website);
			sponsor.setIsUsed(1);
			
			
			Sponsor res = rest.postForObject(Constants.url + "/saveSponsor",sponsor,
					Sponsor.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/addSponsor";
	}
	List<ScheduleDetail> scheduleDetailList=null;

	@RequestMapping(value = "/editSchedule/{scheduleId}", method = RequestMethod.GET)
	public ModelAndView editSchedule(@PathVariable int scheduleId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/schedule");
		try
		{
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("scheduleId", scheduleId);
			GetSchedule getScheduleRes = rest.postForObject(Constants.url + "/getScheduleHeaderById",map,
					GetSchedule.class); 
		
			model.addObject("scheduleRes", getScheduleRes);
			if(!getScheduleRes.getScheduleDetailList().isEmpty())
			{
			scheduleDetailList=getScheduleRes.getScheduleDetailList();
			}
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());

			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);

		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/showFloarMap", method = RequestMethod.GET)
	public ModelAndView showFloarMap(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/floarMap");
		try
		{ 	
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);
			
			List<GetFloarMap> floarMapList=rest.postForObject(Constants.url+"getAllFloarMapByOrgId", map, List.class);
		
		   model.addObject("floarMapList", floarMapList);
		   model.addObject("URL",Constants.IMAGE_PATH);
			model.addObject("isEdit",0);

		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return model;
	}

	@RequestMapping(value = "/editFloarMap/{floarMapId}", method = RequestMethod.GET)
	public ModelAndView editFloarMap(@PathVariable int floarMapId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/floarMap");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("floarMapId", floarMapId);
			GetFloarMap floarMapRes = rest.postForObject(Constants.url + "/getFloarMapById",map,
					GetFloarMap.class); 
			model.addObject("floarMap", floarMapRes);
			
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			
			List<GetFloarMap> floarMapList=rest.postForObject(Constants.url+"getAllFloarMapByOrgId", map, List.class);
		
		   model.addObject("floarMapList", floarMapList);
		   model.addObject("URL",Constants.IMAGE_PATH);
		   
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);
			model.addObject("isEdit", 1);

		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/deleteFloarMap/{floarMapId}", method = RequestMethod.GET)
	public String deleteFloarMap(@PathVariable int floarMapId, HttpServletRequest request, HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("organizer/addOrganizer");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("floarMapId", floarMapId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteFloarMap",map,
					ErrorMessage.class); 
			System.out.println(delete);
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/showFloarMap";
	}
	@RequestMapping(value = "/insertFloarMap", method = RequestMethod.POST)
	public String insertFloarMap(HttpServletRequest request, HttpServletResponse response,@RequestParam("floarMap1") List<MultipartFile> floarMap1,@RequestParam("floarMap2") List<MultipartFile> floarMap2,@RequestParam("floarMap3") List<MultipartFile> floarMap3,@RequestParam("floarMap4") List<MultipartFile> floarMap4) {

		 
		try
		{ 
			int floarMapId=0;int isEdit=0;
			String fMap1="";String fMap2="";String fMap3="";String fMap4="";
			try {
			 floarMapId = Integer.parseInt(request.getParameter("floarMapId"));
			 isEdit= Integer.parseInt(request.getParameter("isEdit"));
			
				
			}
			catch (Exception e) {
				floarMapId=0;isEdit=0;
			}
			int eventId = Integer.parseInt(request.getParameter("eventId"));
			
		
			VpsImageUpload upload = new VpsImageUpload();

			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			
			String curTimeStamp = sdf.format(cal.getTime());
			if(!floarMap1.isEmpty())
			{
			try {
				
				upload.saveUploadedFiles(floarMap1, Constants.FLOAR_MAP_TYPE, curTimeStamp + "-" + floarMap1.get(0).getOriginalFilename());
				System.out.println("upload method called " + floarMap1.toString());
				fMap1=floarMap1.get(0).getOriginalFilename();
				
			} catch (IOException e) {
				
				System.out.println("Exce in File Upload In Product Insert " + e.getMessage());
				e.printStackTrace();
			}
			}
			if(!floarMap2.isEmpty())
			{
			try {
				
				upload.saveUploadedFiles(floarMap2, Constants.FLOAR_MAP_TYPE, curTimeStamp + "-" + floarMap2.get(0).getOriginalFilename());
				System.out.println("upload method called " + floarMap2.toString());
				fMap2=floarMap2.get(0).getOriginalFilename();
				
			} catch (IOException e) {
				
				System.out.println("Exce in File Upload In Product Insert " + e.getMessage());
				e.printStackTrace();
			}
			}
			if(!floarMap3.isEmpty())
			{
			try {
				
				upload.saveUploadedFiles(floarMap3, Constants.FLOAR_MAP_TYPE, curTimeStamp + "-" + floarMap3.get(0).getOriginalFilename());
				System.out.println("upload method called " + floarMap3.toString());
				fMap3=floarMap3.get(0).getOriginalFilename();
				
			} catch (IOException e) {
				
				System.out.println("Exce in File Upload In Product Insert " + e.getMessage());
				e.printStackTrace();
			}
			}
			if(!floarMap4.isEmpty())
			{
			try {
				
				upload.saveUploadedFiles(floarMap4, Constants.FLOAR_MAP_TYPE, curTimeStamp + "-" + floarMap4.get(0).getOriginalFilename());
				System.out.println("upload method called " + floarMap4.toString());
				fMap4=floarMap4.get(0).getOriginalFilename();

				
			} catch (IOException e) {
				
				System.out.println("Exce in File Upload In Product Insert " + e.getMessage());
				e.printStackTrace();
			}
			}
		

			
			FloarMap floarMap=new FloarMap();
			
			floarMap.setFloarMapId(floarMapId);
			floarMap.setEventId(eventId);
			if(fMap1=="")
			{
				 fMap1=request.getParameter("editFloarMap1");

			}
			floarMap.setFloarMap1(fMap1);
			if(fMap2=="")
			{
				 fMap2=request.getParameter("editFloarMap2");

			}
			floarMap.setFloarMap2(fMap2);
			if(fMap3=="")
			{
				 fMap3=request.getParameter("editFloarMap3");

			}
			floarMap.setFloarMap3(fMap3);
			if(fMap4=="")
			{
				 fMap4=request.getParameter("editFloarMap4");

			}
			floarMap.setFloarMap4(fMap4);
			floarMap.setIsUsed(1);
			
			FloarMap floarMapRes=rest.postForObject(Constants.url+"saveFloarMap", floarMap, FloarMap.class);
			System.err.println(floarMapRes.toString());
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/showFloarMap";
	}
	@RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
	public ModelAndView scheduleList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/shedules");
		try
		{ 	
			scheduleDetailList=new ArrayList<>();

			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());

			List<GetSchedule> scheduleList = rest.postForObject(Constants.url + "/getSchedules",map, 
					List.class); 
			
			model.addObject("scheduleList", scheduleList);
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/searchEventSchedule", method = RequestMethod.POST)
	public ModelAndView searchEventSchedule(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/shedules");
		try
		{ 	
			scheduleDetailList=new ArrayList<>();

			int eventId=Integer.parseInt(request.getParameter("eventId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			List<GetSchedule> scheduleList = rest.postForObject(Constants.url + "/getScheduleByEventId",map, 
					List.class); 
			model.addObject("scheduleList", scheduleList);
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);
			model.addObject("eventId", eventId);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return model;
	}

	@RequestMapping(value = "/addSchedule", method = RequestMethod.GET)
	public ModelAndView addSchedule(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("organizer/schedule");
		try
		{ 	
			
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgId", login.getOrganiser().getOrgId());
			
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/getAllEventsByorgIdAndIsUsed",map, 
					EventWithOrgName[].class); 
			List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			
			model.addObject("eventList", eventList);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/insertScheduleDetail", method = RequestMethod.GET)
	public @ResponseBody List<ScheduleDetail> insertScheduleDetail(HttpServletRequest request, HttpServletResponse response) {
		try {
		
		String topic=request.getParameter("topic");
		
		String speaker=request.getParameter("speaker");
		
		String fromTime=request.getParameter("fromTime");
		
		String toTime=request.getParameter("toTime");
		
		String venue=request.getParameter("venue");
		
		int seatsAvailable=Integer.parseInt(request.getParameter("availSeat"));
		
		String remark=request.getParameter("remark");
		
		ScheduleDetail scheduleDetail=new ScheduleDetail();
		scheduleDetail.setScheduleDetailId(0);
		scheduleDetail.setScheduleId(0);
		scheduleDetail.setSeatsAvailable(seatsAvailable);
		scheduleDetail.setSpeaker(speaker);
		scheduleDetail.setFromTime(fromTime);
		scheduleDetail.setToTime(toTime);
		scheduleDetail.setTopic(topic);
		scheduleDetail.setRemark(remark);
		scheduleDetail.setVenue(venue);

		scheduleDetail.setIsUsed(1);
		System.out.println("ItemDetail"+scheduleDetail);
		
		scheduleDetailList.add(scheduleDetail);
		
		System.out.println("ItemDetail List:"+scheduleDetailList.toString());
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return scheduleDetailList;
	
	}
	@RequestMapping(value = "/addScheduleDetail", method = RequestMethod.POST)
	public  String addScheduleDetail(HttpServletRequest request, HttpServletResponse response) {
		
		RestTemplate restTemplate=new RestTemplate();
	    SimpleDateFormat dmyFormat = new SimpleDateFormat("yyyy-MM-dd");

		System.out.println("Schedule  Detail Before Submit "+scheduleDetailList.toString());
		ErrorMessage  eMessage = null;
		try
		{
			int scheduleHeaderId=0;
					try {
			 scheduleHeaderId=Integer.parseInt(request.getParameter("scheduleHeaderId"));
					}
			catch (Exception e) {
				scheduleHeaderId=0;
			}
			int eventId=Integer.parseInt(request.getParameter("eventId"));
			System.out.println("eventId"+eventId);
			
			String date=request.getParameter("date");
			System.out.println("date"+date);
			Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(date);  

			String eventName=request.getParameter("eventName");

			String day=request.getParameter("day");
			
			ScheduleHeader scheduleHeader=new ScheduleHeader();
			scheduleHeader.setScheduleId(scheduleHeaderId);
			scheduleHeader.setDate(dmyFormat.format(date1));
			scheduleHeader.setEventName(eventName);
			scheduleHeader.setDayName(day);
			scheduleHeader.setEventId(eventId);
			scheduleHeader.setIsUsed(1);
			scheduleHeader.setScheduleDetailList(scheduleDetailList);
			if(!scheduleDetailList.isEmpty()) {
			eMessage=restTemplate.postForObject(Constants.url+"/saveSchedule",scheduleHeader,ErrorMessage.class);
			}
			scheduleDetailList=new ArrayList<ScheduleDetail>();
	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("EXC:"+e.getStackTrace());

		}
		System.out.println("scheduleDetailList:"+scheduleDetailList.toString());

		return "redirect:/scheduleList";
		
	}
	@RequestMapping(value = "/editSchedule", method = RequestMethod.GET)
	public @ResponseBody List<ScheduleDetail> editItem(HttpServletRequest request, HttpServletResponse response) {
		
		try {
		
		String topic=request.getParameter("topic");
		
		String speaker=request.getParameter("speaker");
		
		String fromTime=request.getParameter("fromTime");
		
		String toTime=request.getParameter("toTime");
		
		String venue=request.getParameter("venue");
		
		int seatsAvailable=Integer.parseInt(request.getParameter("availSeat"));
		
		String remark=request.getParameter("remark");
		
		int index=Integer.parseInt(request.getParameter("key"));
		System.out.println("Key:"+index);
		
		System.out.println("scheduleDetailList::"+scheduleDetailList.toString());
		for(int i=0;i<scheduleDetailList.size();i++)
		{
			if(i==index)
			{
				scheduleDetailList.get(index).setFromTime(fromTime);
				scheduleDetailList.get(index).setToTime(toTime);
				scheduleDetailList.get(index).setRemark(remark);
				scheduleDetailList.get(index).setSeatsAvailable(seatsAvailable);
				scheduleDetailList.get(index).setSpeaker(speaker);
				scheduleDetailList.get(index).setVenue(venue);
				scheduleDetailList.get(index).setTopic(topic);
				scheduleDetailList.get(index).setIsUsed(1);

		  System.out.println("Schedule Detail"+ scheduleDetailList.get(index));
		
		 }
			
		}
		System.out.println("Edit scheduleDetailList Ajax: "+ scheduleDetailList.get(index).toString());
			System.out.println("Schedule List:"+scheduleDetailList.toString());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return scheduleDetailList;
		
	}
	
	@RequestMapping(value = "/deleteScheduleDetail", method = RequestMethod.GET)
	public @ResponseBody List<ScheduleDetail> deleteItemDetail(HttpServletRequest request, HttpServletResponse response) {
		
		int index=Integer.parseInt(request.getParameter("key"));

		if(scheduleDetailList.get(index).getScheduleDetailId()==0)
		{
			scheduleDetailList.remove(index);
		}
		else
		{
			scheduleDetailList.get(index).setIsUsed(0);
		}
			System.out.println("scheduleDetailList List D:"+scheduleDetailList.toString());

		return scheduleDetailList;
	}
	

	@RequestMapping(value = "/editScheduleDetail", method = RequestMethod.GET)
	public @ResponseBody ScheduleDetail editScheduleDetail(HttpServletRequest request, HttpServletResponse response) {
		
		int index=Integer.parseInt(request.getParameter("key"));
		System.out.println("Key:"+index);
		ScheduleDetail  getScheduleDetail=new ScheduleDetail(); 
		
		for(int i=0;i<scheduleDetailList.size();i++)
		{
			if(i==index)
			{
				getScheduleDetail=scheduleDetailList.get(index);
			}
		
		}
		System.out.println("Edit ScheduleDetail Ajax: "+getScheduleDetail.toString());
		return getScheduleDetail;
	}
		
		
}


