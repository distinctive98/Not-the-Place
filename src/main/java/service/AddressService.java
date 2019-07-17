package service;

import org.springframework.stereotype.*;

import vo.*;

@Service
public class AddressService {
	public AddressVO SliceAddress(String address) {
		AddressVO vo = null;
		
		String[] temp = address.split(" ");
		
		if(!temp[1].equals("서울특별시")) {
			return vo;
		} else {
			vo = new AddressVO();
		}
		
		vo.setAddress_level1(temp[1]);
		vo.setAddress_level2(temp[2]);
		vo.setAddress_level3(temp[3]);
		
		return vo;
	}
}
