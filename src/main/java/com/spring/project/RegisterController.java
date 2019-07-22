package com.spring.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.RegisterDAO;
import vo.UsersVO;

@Controller
public class RegisterController {
	@Autowired
	RegisterDAO dao;

	@RequestMapping(value = "/parking/register", method = RequestMethod.GET)
	public String get(UsersVO vo) {
		return "register";
	}

	@RequestMapping(value = "/parking/register", method = RequestMethod.POST)
	public ModelAndView post(UsersVO vo) {
		ModelAndView mav = new ModelAndView();

		if (vo != null) {
			// email, nickname 중복확인
			boolean checkEmail = dao.searchEmail(vo.getEmail());
			boolean checkNickname = dao.searchNickname(vo.getNickname());
			
			if (checkNickname || checkEmail) {
				System.out.println(checkEmail);
				System.out.println(checkNickname);
				if (checkEmail) {
					System.out.println("이메일이 중복입니다.");
					mav.addObject("msg", "이메일이 중복입니다");
				} else if (checkNickname) {
					System.out.println("닉네임이 중복입니다.");
					mav.addObject("msg", "닉네임이 중복입니다");
				}
				// 회원가입 완료
			} else {
				if (dao.insert(vo)) {
					//mav.addObject("result", "success");
					mav.addObject("msg", "회원가입을 축하드립니다");
					mav.setViewName("login");
					return mav;
				}
				else {
					//mav.addObject("result", "fail");
					mav.addObject("msg", "회원가입을 실패하였습니다");
				}
					
			}
		}
		mav.setViewName("register");
		return mav;
	}
}
