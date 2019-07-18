package com.spring.project;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import dao.*;
import service.*;
import vo.*;

@Controller
public class StatController {
	@Autowired
	StatDAO dao;
	@Autowired
	StatTitleService service;
	
	@RequestMapping(value="/parking/stat", method=RequestMethod.GET)
	protected ModelAndView getReport() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("stat");
		return mav;
	}
	
	@RequestMapping(value="/parking/stat", method=RequestMethod.POST)
	protected ModelAndView postReport(StatSearchVO vo) {
		ModelAndView mav = new ModelAndView();		
		List<StatSearchVO> list = dao.searchStat(vo);
		mav.addObject("list", list);
		mav.setViewName("stat");
		
		//getTitle
		mav.addObject("title", service.getTitle(vo));
		return mav;
	}
}
