package com.spring.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDAO;
import vo.UsersVO;

@Controller
@SessionAttributes("user")
public class LoginController {

	@Autowired
	LoginDAO dao;

	@ModelAttribute("user")
	public UsersVO createUsersModel() {
		return new UsersVO();
	}

	@RequestMapping(value = "/parking/login", method = RequestMethod.POST)
	protected ModelAndView postLogin(@ModelAttribute("user") UsersVO vo) {
		ModelAndView mav = new ModelAndView();

		UsersVO info = dao.login(vo);
		if (info != null) {
			System.out.println("로그인 성공");
			mav.setViewName("main");
		} else {
			System.out.println("로그인 실패");
			mav.setViewName("login");
		}
		return mav;
	}

	@RequestMapping(value = "/parking/login", method = RequestMethod.GET)
	protected ModelAndView getLogin(UsersVO vo, String action) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("login");
		return mav;
	}

	@RequestMapping(value = "/parking/logout", method = RequestMethod.GET)
	protected ModelAndView getlogout(UsersVO vo, SessionStatus s) {
		ModelAndView mav = new ModelAndView();
		s.setComplete();
		mav.setViewName("login");
		return mav;
	}

}
