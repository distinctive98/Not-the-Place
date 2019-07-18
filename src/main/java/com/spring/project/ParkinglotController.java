package com.spring.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ParkinglotDAO;

@Controller
public class ParkinglotController {
	@Autowired
	ParkinglotDAO dao;
	
	@RequestMapping(value = "/parking/parkinglot", method = RequestMethod.GET)
	public ModelAndView get() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listAll());
		mav.setViewName("parkinglot");
		return mav;
	}

}
