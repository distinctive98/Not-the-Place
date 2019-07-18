package com.spring.project;

import java.text.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import dao.*;
import service.*;
import vo.*;

@Controller
public class ReportController {
	@Autowired
	ReportDAO reportDAO;
	@Autowired
	StatDAO statDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
	ImageService imageService;	
	@Autowired
	AddressService addressService;
	@Autowired
	TimeService timeService;
	
	@RequestMapping(value="/parking/report", method=RequestMethod.GET)
	protected ModelAndView getReport(ReportsVO vo) {
		ModelAndView mav = new ModelAndView();
		List<ReportsVO> list = reportDAO.selectReports();
		
		if(list == null) {
			System.out.println("값이 전달되지 않았습니다.");
		}
		
		mav.addObject("list", list);
		mav.setViewName("report");
		return mav;
	}
	
	@RequestMapping(value="/parking/report/select", method=RequestMethod.GET)
	protected ModelAndView getReportSelect(int id) {
		ModelAndView mav = new ModelAndView();
		//vo 정보 받기
		ReportsVO vo = reportDAO.selectReport(id);
		
		if(vo == null) {
			System.out.println("값이 전달되지 않았습니다.");
		}
		String email = userDAO.selectEmail(vo.getNickname());
		
		mav.addObject("email", email);
		mav.addObject("vo", vo);
		mav.setViewName("report_select");
			
		return mav;
	}
	
	@RequestMapping(value="/parking/report/write", method=RequestMethod.GET)
	protected String getReportWrite() {
		return "report_write";
	}
	
	@RequestMapping(value="/parking/report/write", method=RequestMethod.POST)
	protected String postReportWrite(ReportsVO vo, MultipartRequest mreq) throws ParseException {
		//ModelAndView mav = new ModelAndView();
		
		//image 저장
		MultipartFile mfile = mreq.getFile("imageInfo");
		long currentTime = System.currentTimeMillis();
		String fileName = "2000" + currentTime + ".jpg";
		boolean isSave = imageService.saveImage(mfile, fileName);
		if(isSave) {
			vo.setImage(fileName);
		}
		
		//임시닉네임 설정
		vo.setNickname("도라지");
		
		//시간 포맷 적용
		String formattedTime = vo.getReport_time().replace("T", " ");
		vo.setReport_time(formattedTime);
		
		//report 삽입
		int report_no = reportDAO.insertReport(vo);
		System.out.println(report_no);
		if(report_no != 0) {
			System.out.println("Report 삽입을 성공하였습니다.");
		} else {
			System.out.println("Report 삽입을 실패하였습니다.");
		}
		
		//stat 사전작업
		AddressVO addressVO = new AddressVO();
		TimeVO timeVO = new TimeVO();
		addressVO = addressService.SliceAddress(vo.getReport_address());
		timeVO = timeService.sliceTime(formattedTime);
		
		//stat 삽입
		if(addressVO != null && timeVO != null) {
			StatsVO statVO = new StatsVO();
			statVO.setAddressVO(addressVO);
			statVO.setTimeVO(timeVO);
			statVO.setReport_no(report_no);
			if(statDAO.insertStat(statVO)) {
				System.out.println("Stat 삽입을 성공하였습니다.");
			} else {
				System.out.println("Stat 삽입을 실패하였습니다.");
			}
		} else {
			System.out.println("Stat 삽입을 하지 않았습니다.");
		}
		
		//mav.setViewName("report");
		return "redirect:/parking/report";
	}
	
	@RequestMapping(value="/parking/report/delete", method=RequestMethod.GET)
	protected String getReportDelete(int id) {
		if(reportDAO.deleteReport(id)) {
			System.out.println("삭제되었습니다.");
		} else {
			System.out.println("삭제를 실패하였습니다.");
		}
		return "redirect:/parking/report";
	}
}
