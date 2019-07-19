package dao;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import vo.*;

@Repository
public class UserDAO {
	@Autowired
	SqlSession session = null;
	
	public String selectEmail(String nickname) {
		UsersVO temp = null;
		String statement = "resource.UserMapper.selectEmail";
		temp = session.selectOne(statement, nickname);
		return temp.getEmail();
	}
	
	public String selectNickname(String email) {
		UsersVO temp = null;
		String statement = "resource.UserMapper.selectNickname";
		temp = session.selectOne(statement, email);
		return temp.getNickname();
	}
	
	public String selectAdmin(String email) {
		if(email != null) {
			UsersVO temp = null;
			String statement = "resource.UserMapper.selectAdmin";
			temp = session.selectOne(statement, email);
			return temp.getAdmin();
		} else {
			return null;
		}
		
	}
}
