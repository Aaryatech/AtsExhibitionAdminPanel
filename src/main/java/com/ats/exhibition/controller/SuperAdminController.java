package com.ats.exhibition.controller;

import java.awt.Dimension;
import java.awt.Insets;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope; 
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
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
import com.ats.model.CompanyType;
import com.ats.model.ErrorMessage;
import com.ats.model.EventExhMapping;
import com.ats.model.EventWithOrgName;
import com.ats.model.Events;
import com.ats.model.Exhibitor;
import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.ExportToExcel;
import com.ats.model.GetEventSheduleHeader; 
import com.ats.model.Location;
import com.ats.model.LoginResponse;
import com.ats.model.Organiser;
import com.ats.model.Package1;
import com.ats.model.SortedExhibitor;
import com.ats.model.SortedVisitor; 
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

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
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgList", 0);
			System.out.println(map);
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/eventListByMultipleOrgId",map, 
					EventWithOrgName[].class); 
			 eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
				model.addObject("eventList", eventList);
			model.addObject("organiserList", organiserList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	  
	@RequestMapping(value = "/eventListByOrgId", method = RequestMethod.GET)
	@ResponseBody
	public List<EventWithOrgName> eventListByOrgId(HttpServletRequest request, HttpServletResponse response) {

		List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>();
		try
		{ 
			 String[] orgIds = request.getParameterValues("orgId[]");
			 String orgList = new String();
			 if(orgIds[0].equals("0"))
			 {
				 orgList="0";
			 }
			 else
			 {
				 for(int i=0 ; i<orgIds.length ; i++)
				 {
					 orgList = orgList + "," + orgIds[i];
				 }
				 orgList = orgList.substring(1,orgList.length());
				 
				 
			 }
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgList", orgList);
			System.out.println(map);
			EventWithOrgName[] eventWithOrgName = rest.postForObject(Constants.url + "/eventListByMultipleOrgId",map, 
					EventWithOrgName[].class); 
			 eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName));
			 
			 
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return eventList;
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
			 
			
			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Sr. No");
			rowData.add("Exhibitor Name");
			rowData.add("Event Name");
			rowData.add("Location Name");
			rowData.add("Company Name"); 

			
			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel); 
			for (int i = 0; i < sortedExhibitorList.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();
				    
				rowData.add("" + (i+1));
				rowData.add(sortedExhibitorList.get(i).getExhName());
				rowData.add(sortedExhibitorList.get(i).getEventName()); 
				rowData.add(sortedExhibitorList.get(i).getLocationName());
				rowData.add(sortedExhibitorList.get(i).getCompanyTypeName());
			 
				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);

			}

			HttpSession session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "ExhibitorList");
			 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return sortedExhibitorList;
	}
	
	 
	
	 @RequestMapping(value = "sortedExhibitorListPdf/{eventId}/{locationId}/{compType}", method = RequestMethod.GET)
	public void sortedExhibitorListPdf(@PathVariable String eventId[],@PathVariable String locationId[],@PathVariable String compType[],HttpServletRequest request, HttpServletResponse response)  throws FileNotFoundException 
	 {
		 
		 List<SortedExhibitor> sortedExhibitorList = new ArrayList<SortedExhibitor>();
		BufferedOutputStream outStream = null;
		System.out.println("Inside Pdf showBillwisePurchasePdf");

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

		// moneyOutList = prodPlanDetailList;
		Document document = new Document(PageSize.A4);
		// ByteArrayOutputStream out = new ByteArrayOutputStream();

		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Calendar cal = Calendar.getInstance();

		System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
		String FILE_PATH = Constants.REPORT_SAVE;
		File file = new File(FILE_PATH);

		PdfWriter writer = null;

		FileOutputStream out = new FileOutputStream(FILE_PATH);
		try {
			writer = PdfWriter.getInstance(document, out);
		} catch (DocumentException e) {

			e.printStackTrace();
		}

		PdfPTable table = new PdfPTable(5);
		try {
			System.out.println("Inside PDF Table try");
			table.setWidthPercentage(100);
			table.setWidths(new float[] { 1.4f, 3.7f, 2.8f, 2.8f, 3.2f});
			Font headFont = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
			Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
			headFont1.setColor(BaseColor.WHITE);
			Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

			PdfPCell hcell = new PdfPCell();
			hcell.setBackgroundColor(BaseColor.PINK);

			hcell.setPadding(3);
			hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);

			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Exhibitor Name", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);

			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Event Name", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);

			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Location", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);

			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Company Type", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);

			table.addCell(hcell);

			 

			int index = 0;
			for (SortedExhibitor exhi : sortedExhibitorList) {
				index++;
				PdfPCell cell;

				cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(exhi.getExhName(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);
				
				cell = new PdfPCell(new Phrase(exhi.getEventName(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(exhi.getLocationName(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(exhi.getCompanyTypeName(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);
 

			}
			document.open();
			Paragraph name = new Paragraph("Exhibitor List\n", f);
			name.setAlignment(Element.ALIGN_CENTER);
			document.add(name);
			document.add(new Paragraph(" "));
			/*Paragraph company = new Paragraph("Bill wise Purchase Report\n", f);
			company.setAlignment(Element.ALIGN_CENTER);
			document.add(company);
			document.add(new Paragraph(" "));*/

			/*DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
			String reportDate = DF.format(new Date());
			Paragraph p1 = new Paragraph("From Date:" + fromDate + "  To Date:" + toDate, headFont);
			p1.setAlignment(Element.ALIGN_CENTER);
			document.add(p1);*/
			document.add(new Paragraph("\n"));
			document.add(table);

			int totalPages = writer.getPageNumber();

			System.out.println("Page no " + totalPages);

			document.close();
			// Atul Sir code to open a Pdf File
			if (file != null) {

				String mimeType = URLConnection.guessContentTypeFromName(file.getName());

				if (mimeType == null) {

					mimeType = "application/pdf";

				}

				response.setContentType(mimeType);

				response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

				response.setContentLength((int) file.length());

				InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

				try {
					FileCopyUtils.copy(inputStream, response.getOutputStream());
				} catch (IOException e) {
					System.out.println("Excep in Opening a Pdf File");
					e.printStackTrace();
				}
			}

		} catch (DocumentException ex) {

			System.out.println("Pdf Generation Error: BOm Prod  View Prod" + ex.getMessage());

			ex.printStackTrace();

		}
		 
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
	
	
	@RequestMapping(value = "/addExhibitorSub", method = RequestMethod.GET)
	public ModelAndView showOrgSubscription(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/addExhibitorSub");
		try {

			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsedAndIsActive",
					Organiser[].class);
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("pkgType", 2);
			Package1[] package1 = rest.postForObject(Constants.url + "/getAllPackagesByPkgType", map, Package1[].class);
			List<Package1> packageList = new ArrayList<Package1>(Arrays.asList(package1));
			model.addObject("packageList", packageList);

			model.addObject("organiserList", organiserList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	 
	
	@RequestMapping(value = "/addExhibitorBySuperAdmin", method = RequestMethod.GET)
	public ModelAndView addExhibitorBySuperAdmin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/addExhibitorBySuperAdmin");
		try
		{ 
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
					Location[].class); 
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
			
			System.out.println("locationList " + locationList);
			
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed", 
					CompanyType[].class); 
			List<CompanyType> companyTypeList = new ArrayList<CompanyType>(Arrays.asList(companyType));
			
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList); 
			model.addObject("companyTypeList", companyTypeList);
			model.addObject("locationList", locationList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/insertExhibitorBySuperAdmin", method = RequestMethod.POST)
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
			int companyType = Integer.parseInt(request.getParameter("companyTypeId"));
			int location = Integer.parseInt(request.getParameter("location"));
			String usesrMob = request.getParameter("usesrMob");
			String password = request.getParameter("password");
			int orgId = Integer.parseInt(request.getParameter("orgId"));
			System.out.println(companyType);
			
			 
			
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
			//exhibitor.setCompanyType(companyType);
			exhibitor.setCompanyTypeId(companyType);
			exhibitor.setUserMob(usesrMob);
			exhibitor.setPassword(password);
			exhibitor.setOrgId(orgId);
			exhibitor.setIsUsed(1); 
			exhibitor.setLocationId(location);
			
			System.out.println("exhibitor " + exhibitor);
			
			Exhibitor res = rest.postForObject(Constants.url + "/saveExhibitor",exhibitor,
					Exhibitor.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/exhibitorListByLocationAndCompType";
	}
	
	List<EventWithOrgName> eventList = new ArrayList<EventWithOrgName>();
	
	@RequestMapping(value = "/showVisitorSortedList", method = RequestMethod.GET)
	public ModelAndView showVisitorSortedList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/showVisitorSortedList");
		try
		{ 
		 
			String orgList = "0";
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orgList", orgList);
			System.out.println(map);
			EventWithOrgName[] eventWithOrgName = rest.getForObject(Constants.url + "/getAllEventsByIsUsed",
					EventWithOrgName[].class); 
			
			 eventList = new ArrayList<EventWithOrgName>(Arrays.asList(eventWithOrgName)); 
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
					Location[].class); 
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
			 
			
			CompanyType[] companyType = rest.getForObject(Constants.url + "/getAllCompaniesByIsUsed", 
					CompanyType[].class); 
			List<CompanyType> companyTypeList = new ArrayList<CompanyType>(Arrays.asList(companyType));
			
			model.addObject("companyTypeList", companyTypeList);
			model.addObject("locationList", locationList);
			model.addObject("eventList", eventList);
			model.addObject("starting", 0);
			model.addObject("ending", 0);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	List<SortedVisitor> sortedVisitorList = new ArrayList<SortedVisitor>();
	
	@RequestMapping(value = "/sortedVisitorListByLocationAndCompType", method = RequestMethod.GET)
	@ResponseBody
	public List<SortedVisitor> sortedVisitorListByLocationAndCompType(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("inside eventlist ajax");
		 sortedVisitorList = new ArrayList<SortedVisitor>();
		try
		{ 
			  int starting = Integer.parseInt(request.getParameter("starting"));
			 String[] eventId = request.getParameterValues("eventId[]");
			 String[] compType = request.getParameterValues("compType[]");
			 String[] locationId = request.getParameterValues("locationId[]");
			 
			 String eventIdList = new String();
			 String compTypeList = new String();
			 String LocationList = new String();
			 
			 if(eventId[0].equals("0"))
			 {
				 for(int i=0; i< eventList.size() ; i++)
				 {
					 eventIdList = eventIdList + "," + eventList.get(i).getEventId();
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
		 
			map.add("eventId", eventIdList);
			map.add("locationId", LocationList);
			map.add("companyType", compTypeList);
			map.add("next", starting);
			
			System.out.println(map);
			
			SortedVisitor[] sortedVisitor = rest.postForObject(Constants.url + "/visitorListFilterByLocationAndCompType",map, 
					SortedVisitor[].class); 
			sortedVisitorList = new ArrayList<SortedVisitor>(Arrays.asList(sortedVisitor));
			 
			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Sr. No");
			rowData.add("Visitor Name");
			rowData.add("Event Name");
			rowData.add("Mobile No");
			rowData.add("Email");
			rowData.add("Location Name");
			rowData.add("Company Name"); 

			
			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel); 
			for (int i = 0; i < sortedVisitorList.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();
				    
				rowData.add("" + (i+1));
				rowData.add(sortedVisitorList.get(i).getVisitorName());
				rowData.add(sortedVisitorList.get(i).getEventName()); 
				rowData.add(sortedVisitorList.get(i).getVisitorMobile());
				rowData.add(sortedVisitorList.get(i).getVisitoremail());
				rowData.add(sortedVisitorList.get(i).getLocationName());
				rowData.add(sortedVisitorList.get(i).getCompanyTypeName());
			 
				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);

			}

			HttpSession session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "VisitorList");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return sortedVisitorList;
	}
	
	 @RequestMapping(value = "/sortedVisitorListPdf", method = RequestMethod.GET)
		public void sortedVisitorListPdf(HttpServletRequest request, HttpServletResponse response)  throws FileNotFoundException 
		 {
			 
			  

			// moneyOutList = prodPlanDetailList;
			Document document = new Document(PageSize.A4);
			// ByteArrayOutputStream out = new ByteArrayOutputStream();

			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
			String FILE_PATH = Constants.REPORT_SAVE;
			File file = new File(FILE_PATH);

			PdfWriter writer = null;

			FileOutputStream out = new FileOutputStream(FILE_PATH);
			try {
				writer = PdfWriter.getInstance(document, out);
			} catch (DocumentException e) {

				e.printStackTrace();
			}

			PdfPTable table = new PdfPTable(7);
			try {
				System.out.println("Inside PDF Table try");
				table.setWidthPercentage(100);
				table.setWidths(new float[] { 1.4f, 4.7f, 2.8f, 3.2f, 5.2f, 2.8f, 2.8f});
				Font headFont = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
				Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
				headFont1.setColor(BaseColor.WHITE);
				Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

				PdfPCell hcell = new PdfPCell();
				hcell.setBackgroundColor(BaseColor.PINK);

				hcell.setPadding(3);
				hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);

				hcell = new PdfPCell(new Phrase("Visitor Name", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);

				hcell = new PdfPCell(new Phrase("Event Name", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);
				
				hcell = new PdfPCell(new Phrase("Mobile", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);
				
				hcell = new PdfPCell(new Phrase("Email", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);

				hcell = new PdfPCell(new Phrase("Location", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);

				hcell = new PdfPCell(new Phrase("Company Type", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);

				table.addCell(hcell);

				 

				int index = 0;
				for (SortedVisitor visi : sortedVisitorList) {
					index++;
					PdfPCell cell;

					cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					cell.setPadding(3);
					table.addCell(cell);

					cell = new PdfPCell(new Phrase(visi.getVisitorName(), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setPaddingRight(2);
					cell.setPadding(3);
					table.addCell(cell);
					
					cell = new PdfPCell(new Phrase(visi.getEventName(), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setPaddingRight(2);
					cell.setPadding(3);
					table.addCell(cell);
					
					cell = new PdfPCell(new Phrase(visi.getVisitorMobile(), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setPaddingRight(2);
					cell.setPadding(3);
					table.addCell(cell);
					
					cell = new PdfPCell(new Phrase(visi.getVisitoremail(), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setPaddingRight(2);
					cell.setPadding(3);
					table.addCell(cell);

					cell = new PdfPCell(new Phrase(visi.getLocationName(), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setPaddingRight(2);
					cell.setPadding(3);
					table.addCell(cell);

					cell = new PdfPCell(new Phrase(visi.getCompanyTypeName(), headFont));
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setPaddingRight(2);
					cell.setPadding(3);
					table.addCell(cell);
	 

				}
				document.open();
				Paragraph name = new Paragraph("Visitor List\n", f);
				name.setAlignment(Element.ALIGN_CENTER);
				document.add(name);
				document.add(new Paragraph(" "));
				/*Paragraph company = new Paragraph("Bill wise Purchase Report\n", f);
				company.setAlignment(Element.ALIGN_CENTER);
				document.add(company);
				document.add(new Paragraph(" "));*/

				/*DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
				String reportDate = DF.format(new Date());
				Paragraph p1 = new Paragraph("From Date:" + fromDate + "  To Date:" + toDate, headFont);
				p1.setAlignment(Element.ALIGN_CENTER);
				document.add(p1);*/
				document.add(new Paragraph("\n"));
				document.add(table);

				int totalPages = writer.getPageNumber();

				System.out.println("Page no " + totalPages);

				document.close();
				// Atul Sir code to open a Pdf File
				if (file != null) {

					String mimeType = URLConnection.guessContentTypeFromName(file.getName());

					if (mimeType == null) {

						mimeType = "application/pdf";

					}

					response.setContentType(mimeType);

					response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

					response.setContentLength((int) file.length());

					InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

					try {
						FileCopyUtils.copy(inputStream, response.getOutputStream());
					} catch (IOException e) {
						System.out.println("Excep in Opening a Pdf File");
						e.printStackTrace();
					}
				}

			} catch (DocumentException ex) {

				System.out.println("Pdf Generation Error: BOm Prod  View Prod" + ex.getMessage());

				ex.printStackTrace();

			}
			 
		}
	
	
	@RequestMapping(value = "/editEventBySuperAdmin/{eventId}", method = RequestMethod.GET)
	public ModelAndView editEvent(@PathVariable int eventId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/editEventByAdmin");
		try
		{
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			EventWithOrgName editEvent = rest.postForObject(Constants.url + "/getAllEventsByEventId",map,
					EventWithOrgName.class); 
			model.addObject("editEvent", editEvent);
			
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList); 
			model.addObject("isEdit", 1);
			
			model.addObject("imageUrl",Constants.imageUrl);
			 
			 Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
						Location[].class); 
				List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
				
				System.out.println("locationList " + locationList);
				
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
	
	@RequestMapping(value = "/insertEventByAdmin", method = RequestMethod.POST)
	public String insertEvent(@RequestParam("documentFile") List<MultipartFile> documentFile,HttpServletRequest request, HttpServletResponse response) {

		 
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
			int orgId = Integer.parseInt(request.getParameter("orgId"));
			int companyTypeId = Integer.parseInt(request.getParameter("companyTypeId"));
			int location = Integer.parseInt(request.getParameter("location"));
			 
			String document = request.getParameter("docPath");
			
			VpsImageUpload upload = new VpsImageUpload();
			String docFile = null;
			try {
				docFile = documentFile.get(0).getOriginalFilename();
				 

				upload.saveUploadedFiles(documentFile, Constants.FLOAR_MAP_TYPE,
						documentFile.get(0).getOriginalFilename());
			 
				System.out.println("upload method called for image Upload " + documentFile.toString());

			} catch (IOException e) {

				System.out.println("Exce in File Upload In GATE ENTRY  Insert " + e.getMessage());
				e.printStackTrace();
			}
			
			 
			Events event = new Events();
			
			if (eventId.equalsIgnoreCase("")|| eventId.equalsIgnoreCase(null))
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
			event.setOrgId(orgId);
			event.setLocationId(location);
			event.setCompanyTypeId(companyTypeId);
			if(docFile!=null && docFile.length()>0) 
				event.setEventLogo(docFile); 
			else
				event.setEventLogo(document);
			
			Events res = rest.postForObject(Constants.url + "/saveEvents",event,
					Events.class); 
			
			System.out.println("res " + res);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/showEventList";
	}
	
	@RequestMapping(value = "/eventDetailAndAssignExhList/{eventId}", method = RequestMethod.GET)
	public ModelAndView eventMapList(@PathVariable int eventId,HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/eventDetailAndAssignExhi");
		try
		{ 
			 
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			EventExhMapping[] eventExhMapping = rest.postForObject(Constants.url + "/eventMappingListByEventId",map, 
					EventExhMapping[].class); 
			 List<EventExhMapping> eventExhMappingList = new ArrayList<EventExhMapping>(Arrays.asList(eventExhMapping));
			 
			 EventWithOrgName eventDetail = rest.postForObject(Constants.url + "/getAllEventsByEventId",map, 
					 EventWithOrgName.class); 
			 
			 map = new LinkedMultiValueMap<String, Object>();
				map.add("orgId", eventDetail.getOrgId());
			 ExhibitorWithOrgName[] ExhibitorWithOrgName = rest.postForObject(Constants.url + "/getAllExhibotorsByorgIdAndIsUsed",map, 
						ExhibitorWithOrgName[].class); 
				List<ExhibitorWithOrgName> exhibitorList = new ArrayList<ExhibitorWithOrgName>(Arrays.asList(ExhibitorWithOrgName));
				System.out.println(exhibitorList);
				model.addObject("exhibitorList", exhibitorList);
			model.addObject("eventExhMappingList", eventExhMappingList);
			model.addObject("eventDetail", eventDetail);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/eventSchedule/{eventId}", method = RequestMethod.GET)
	public ModelAndView eventSchedule(@PathVariable int eventId,HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/eventSchedule");
		try
		{ 
			 
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("eventId", eventId);
			GetEventSheduleHeader[] getSchedule = rest.postForObject(Constants.url + "/getEventSheduleByEventId",map, 
					GetEventSheduleHeader[].class); 
			 List<GetEventSheduleHeader> getScheduleList = new ArrayList<GetEventSheduleHeader>(Arrays.asList(getSchedule));
			 
			 
			model.addObject("getScheduleList", getScheduleList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/addEventByAdmin", method = RequestMethod.GET)
	public ModelAndView addEventByAdmin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("SuperAdmin/editEventByAdmin");
		try
		{ 
			 
			 
			Organiser[] organiser = rest.getForObject(Constants.url + "/getAllOrganisersByIsUsed", 
					Organiser[].class); 
			List<Organiser> organiserList = new ArrayList<Organiser>(Arrays.asList(organiser));
			
			model.addObject("organiserList", organiserList); 
			
			Location[] location = rest.getForObject(Constants.url + "/getAllLocationByIsUsed", 
					Location[].class); 
			List<Location> locationList = new ArrayList<Location>(Arrays.asList(location));
			
			System.out.println("locationList " + locationList);
			
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
	
	 

}
