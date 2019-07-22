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
			System.out.println("QNA 등록 성공");
		} else {
			System.out.println("QNA 등록 실패");
		}
		
		return "redirect:/parking/qna";
	}
	
	@RequestMapping(value="/parking/qna/delete", method = RequestMethod.GET)
	public String getQnaDelete(int id) {
		if(qnaDAO.deleteQna(id)) {
			System.out.println("QNA 삭제 성공");
		} else {
			System.out.println("QNA 삭제 실패");
		}
		return "redirect:/parking/qna";
	}
	
	@RequestMapping(value="/parking/qna/update", method = RequestMethod.GET)
	public ModelAndView getQnaUpdate(int id) {
		ModelAndView mav = new ModelAndView();
		QnaVO vo = qnaDAO.listOne(id);
		
		mav.addObject("vo", vo);
		mav.setViewName("qna_update");
		
		return mav;
	}
	
	@RequestMapping(value="/parking/qna/update", method = RequestMethod.POST)
	public String postQnaUpdate(QnaVO vo) {
		if(qnaDAO.updateQna(vo)) {
			System.out.println("QNA 수정 성공");
		} else {
			System.out.println("QNA 수정 실패");
		}
		
		
		
		return "redirect:/parking/qna";
	}
}
