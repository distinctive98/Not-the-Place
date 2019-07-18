package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UsersVO;

@Repository
public class RegisterDAO {
	@Autowired
	SqlSession session = null;

	public boolean insert(UsersVO vo) {
		String statement = "resource.RegisterMapper.insert";
		if (session.insert(statement, vo) != 1)
			return false;
		return true;
	}

	public boolean searchNickname(String nickname) {
		boolean check = false;
		List<UsersVO> list = null;
		String statement = "resource.RegisterMapper.searchNickname";
		list = session.selectList(statement, nickname);
		if(list.size() > 0) {
			check = true;
		}
		
		
		return check;
	}
	
	public boolean searchEmail(String email) {
		boolean check = false;
		List<UsersVO> list = null;
		String statement = "resource.RegisterMapper.searchEmail";
		list = session.selectList(statement, email);
		if(list.size() > 0) {
			check = true;
		}
		
		return check;
	}
}
