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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.exhibition.common.Constants;

import com.ats.model.ExhibitorWithOrgName;
import com.ats.model.Package1;

@Controller
@Scope("session")
public class ExhibitorController {
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showExhibitor", method = RequestMethod.GET)
	public ModelAndView addLocation(HttpServletRequest request, HttpServletResponse response) {

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

}
