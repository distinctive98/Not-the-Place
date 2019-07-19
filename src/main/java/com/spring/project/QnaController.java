package com.spring.project;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import dao.*;
import vo.*;

@Controller
public class QnaController {
	@Autowired
	QnaDAO qnaDAO;
	@Autowired
	UserDAO userDAO;

	@RequestMapping(value = "/parking/qna", method = RequestMethod.GET)
	public ModelAndView getQna(QnaVO vo) {
		ModelAndView mav = new ModelAndView();
		/*
		if(user != null) {
			mav.addObject("user", userDAO.selectAdmin(user.getEmail()));
		}
		*/
		mav.addObject("list", qnaDAO.listAll());
		mav.setViewName("qna");
		return mav;	
	}
	
	@RequestMapping(value="/parking/qna/write", method = RequestMethod.GET)
	public String getQnaWrite() {
		return "qna_write";
	}
	
	@RequestMapping(value="/parking/qna/write", method = RequestMethod.POST)
	public String postQnaWrite(QnaVO vo, String email) {
		vo.setNickname(userDAO.selectNickname(email));
		if(qnaDAO.insertQna(vo)) {
			System.out.println("QNA 등록에 성공");
		} else {
			System.out.println("QNA 등록에 실패");
		}
		
		return "redirect:/parking/qna";
	}
}
