package com.spring.project;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import dao.*;
import vo.*;

@Controller
@SessionAttributes("user")
public class MypageController {
	@Autowired
	LoginDAO loginDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
	ReportDAO reportDAO;
	
	@RequestMapping(value = "/parking/mypage", method = RequestMethod.GET)
	public String getMypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "/parking/mypage", method = RequestMethod.POST)
	public ModelAndView postMypage(UsersVO vo) {
		ModelAndView mav = new ModelAndView();
		
		UsersVO info = loginDAO.login(vo);
		if(info != null) {
			mav.addObject("msg", "success");
		} else {
			mav.addObject("msg", "fail");
		}
		
		mav.setViewName("mypage");
		return mav;
	}

	@RequestMapping(value = "/parking/mypage/update", method = RequestMethod.GET)
	public String getMypageUpdate(String nickname) {
		
		return "mypage_update";
	}
	
	@RequestMapping(value = "/parking/mypage/update", method = RequestMethod.POST)
	public ModelAndView postMypageUpdate(UsersVO vo, String repassword) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage_update");
		
		if(!vo.getPassword().equals(repassword)) {
			mav.addObject("msg", "password");
			return mav;
		}
		
		if(userDAO.updatePassword(vo)) {
			mav.addObject("msg", "success");
		} else {
			mav.addObject("msg", "fail");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/parking/mypage/manage", method = RequestMethod.GET)
	public ModelAndView getMypageManage(@SessionAttribute("user")UsersVO vo) {
		ModelAndView mav = new ModelAndView();
		List<ReportsVO> list = reportDAO.selectNicknameReports(vo.getNickname());
		mav.addObject("list", list);
		mav.setViewName("mypage_manage");
		return mav;
	}
}
