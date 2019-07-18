package dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import vo.*;

@Repository
public class ReportDAO {
	
	@Autowired
	SqlSession session = null;
	
	public List<ReportsVO> selectReports(){
		List<ReportsVO> list = null;
		String statement = "resource.ReportMapper.selectReports";
		list = session.selectList(statement);
		return list;
	}
	
	public ReportsVO selectReport(int id) {
		ReportsVO vo = null;
		String statement = "resource.ReportMapper.selectReport";
		vo = session.selectOne(statement, id);
		vo.getReport_no();
		return vo;
	}
	
	public ReportsVO selectReport_no(String fileName) {
		ReportsVO vo = null;
		String statement = "resource.ReportMapper.selectReport_no";
		vo = session.selectOne(statement);
		return vo;
	}
	
	public List<ReportsVO> listNickname(String nickname){
		List<ReportsVO> list = null;
		
		return list;
	}
	
	public int insertReport(ReportsVO vo) {
		int report_no = 0;
		String statement = "resource.ReportMapper.insertReport";
		if(session.insert(statement, vo) != 1)
			report_no = 0;
		else
			report_no = vo.getReport_no();
		return report_no;
	}
	
	public boolean deleteReport(int id) {
		boolean result = true;
		String statement = "resource.ReportMapper.deleteReport";
		if(session.delete(statement, id) != 1) {
			result = false;
		}
		return result;
	}
	
}
