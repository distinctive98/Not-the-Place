package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ParkinglotsVO;

@Repository
public class ParkinglotDAO {
	@Autowired
	SqlSession session = null;
	
	public List<ParkinglotsVO> listAll(){
		List<ParkinglotsVO> list = null;
		String statement = "resource.ParkinglotMapper.selectParkinglots";
		list = session.selectList(statement);
		return list;
	}
}
	