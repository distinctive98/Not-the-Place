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
}
