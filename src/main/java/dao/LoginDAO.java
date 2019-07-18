package dao;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import vo.*;

@Repository
public class LoginDAO {
	@Autowired
	SqlSession session = null;

	public UsersVO login(UsersVO vo) {
		UsersVO userVO = null;
		String statement = "resource.LoginMapper.login";
		userVO = session.selectOne(statement, vo);
		return userVO;
	}
}
