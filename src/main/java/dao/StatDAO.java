package dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import vo.*;

@Repository
public class StatDAO {
	
	@Autowired
	SqlSession session = null;
	
	public boolean insertStat(StatsVO vo) {
		boolean result = true;
		String statement = "resource.StatMapper.insertStat";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public List<StatSearchVO> searchStat(StatSearchVO vo){
		List<StatSearchVO> list = null;
		String statement = "resource.StatMapper.searchStat";
		list = session.selectList(statement, vo);
		return list;
	}
	
	public boolean updateStat(StatsVO vo) {
		boolean result = true;
		String statement = "resource.StatMapper.updateStat";
		if(session.update(statement, vo) != 1)
			result = false;
		return result;
	}
}
