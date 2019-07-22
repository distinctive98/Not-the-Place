package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.QnaVO;

@Repository
public class QnaDAO {
	@Autowired
	SqlSession session = null;
	
	public List<QnaVO> listAll(){
		List<QnaVO> list = null;
		String statement = "resource.QnaMapper.listAll";
		list = session.selectList(statement);
		return list;
	}
	
	public QnaVO listOne(int id) {
		QnaVO vo = null;
		String statement = "resource.QnaMapper.listOne";
		vo = session.selectOne(statement, id);
		return vo;
	}
		
	public boolean insertQna(QnaVO vo) {
		String statement = "resource.QnaMapper.insertQna";
		if (session.insert(statement, vo) != 1) return false;
		return true;
	}
	
	public boolean updateQna(QnaVO vo) {
		String statement = "resource.QnaMapper.updateQna";
		if (session.delete(statement, vo) != 1) 
			return false;
		return true;
	}
	
	public boolean deleteQna(int id) {
		String statement = "resource.QnaMapper.deleteQna";
		if (session.delete(statement, id) != 1) 
			return false;
		return true;
	}
}
