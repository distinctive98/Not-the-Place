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

	@RequestMapping(value = "/parking/report", method = RequestMethod.GET)
	protected ModelAndView getReport(@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		//페이징 작업
		int listCnt = reportDAO.selectReportsCnt();
		Pagination pagination = new Pagination(listCnt, curPage);
		int startIndex = pagination.getStartIndex();
		System.out.println(startIndex);
		
		List<ReportsVO> list = reportDAO.selectPaginationReports(startIndex);
		
		//List<ReportsVO> list = reportDAO.selectReports();
		mav.addObject("list", list);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination", pagination);
		
		mav.setViewName("report");
		return mav;
	}

	@RequestMapping(value = "/parking/report/select", method = RequestMethod.GET)
	protected ModelAndView getReportSelect(int id) {
		ModelAndView mav = new ModelAndView();
		// vo 정보 받기
		ReportsVO vo = reportDAO.selectReport(id);

		if (vo == null) {
			System.out.println("값이 전달되지 않았습니다.");
		}
		String email = userDAO.selectEmail(vo.getNickname());

		mav.addObject("email", email);
		mav.addObject("vo", vo);
		mav.setViewName("report_select");

		return mav;
	}

	@RequestMapping(value = "/parking/report/write", method = RequestMethod.GET)
	protected String getReportWrite() {
		return "report_write";
	}

	@RequestMapping(value = "/parking/report/write", method = RequestMethod.POST)
	protected String postReportWrite(ReportsVO vo, MultipartRequest mreq, String email) throws ParseException {
		// ModelAndView mav = new ModelAndView();

		// image 저장
		MultipartFile mfile = mreq.getFile("imageInfo");
		long currentTime = System.currentTimeMillis();
		String fileName = "2000" + currentTime + ".jpg";
		boolean isSave = imageService.saveImage(mfile, fileName);
		if (isSave) {
			vo.setImage(fileName);
		}

		// 닉네임 설정
		vo.setNickname(userDAO.selectNickname(email));

		// 시간 포맷 적용
		String formattedTime = vo.getReport_time().replace("T", " ");
		vo.setReport_time(formattedTime);

		// report 삽입
		int report_no = reportDAO.insertReport(vo);
		System.out.println(report_no);
		if (report_no != 0) {
			System.out.println("Report 삽입을 성공하였습니다.");
		} else {
			System.out.println("Report 삽입을 실패하였습니다.");
		}

		// stat 사전작업
		AddressVO addressVO = new AddressVO();
		TimeVO timeVO = new TimeVO();
		addressVO = addressService.SliceAddress(vo.getReport_address());
		timeVO = timeService.sliceTime(formattedTime);

		// stat 삽입
		if (addressVO != null && timeVO != null) {
			StatsVO statVO = new StatsVO();
			statVO.setAddressVO(addressVO);
			statVO.setTimeVO(timeVO);
			statVO.setReport_no(report_no);
			if (statDAO.insertStat(statVO)) {
				System.out.println("Stat 삽입을 성공하였습니다.");
			} else {
				System.out.println("Stat 삽입을 실패하였습니다.");
			}
		} else {
			System.out.println("Stat 삽입을 하지 않았습니다.");
		}

		// mav.setViewName("report");
		return "redirect:/parking/report";
	}

	@RequestMapping(value = "/parking/report/delete", method = RequestMethod.GET)
	protected String getReportDelete(int id) {
		if (reportDAO.deleteReport(id)) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		return "redirect:/parking/report";
	}

	@RequestMapping(value = "/parking/report/update", method = RequestMethod.GET)
	protected ModelAndView getReportUpdate(int id) {
		ModelAndView mav = new ModelAndView();
		ReportsVO vo = reportDAO.selectReport(id);
		mav.addObject("vo", vo);
		mav.setViewName("report_update");
		return mav;
	}

	@RequestMapping(value = "/parking/report/update", method = RequestMethod.POST)
	protected String postReportUpdate(ReportsVO vo, MultipartRequest mreq) throws ParseException {

		// 이미지 새로 저장
		MultipartFile mfile = mreq.getFile("imageInfo");
		long currentTime = System.currentTimeMillis();
		String fileName = "2000" + currentTime + ".jpg";
		boolean isSave = imageService.saveImage(mfile, fileName);
		if (isSave) {
			vo.setImage(fileName);
		}

		// 시간 포맷 적용
		String formattedTime = vo.getReport_time().replace("T", " ");
		vo.setReport_time(formattedTime);

		System.out.println(vo.getReport_no());

		if (reportDAO.updateReport(vo)) {
			System.out.println("Report 수정 성공");
		} else {
			System.out.println("Report 수정 실패");
		}

		// stat 사전작업
		AddressVO addressVO = new AddressVO();
		TimeVO timeVO = new TimeVO();
		addressVO = addressService.SliceAddress(vo.getReport_address());
		timeVO = timeService.sliceTime(formattedTime);

		if (addressVO != null && timeVO != null) {
			StatsVO statVO = new StatsVO();
			statVO.setAddressVO(addressVO);
			statVO.setTimeVO(timeVO);
			statVO.setReport_no(vo.getReport_no());
			if(statDAO.updateStat(statVO)) {
				System.out.println("Stat 수정 성공");
			} else {
				System.out.println("Stat 수정 실패");
			}
		}
		
		return "redirect:/parking/report";
	}
}
