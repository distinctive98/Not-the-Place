package service;

import org.springframework.stereotype.*;

import vo.*;

@Service
public class StatTitleService {
	public StatTitleVO getTitle(StatSearchVO searchVO) {
		StatTitleVO titleVO = new StatTitleVO();
		
		String addressLevel = searchVO.getAddressLevel();
		String timeLevel = searchVO.getTimeLevel();
		
		if(addressLevel.equals("address_level1")) {
			titleVO.setAddressTitle("시 단위");
		} else if(addressLevel.equals("address_level2")) {
			titleVO.setAddressTitle("구 단위");
		} else if(addressLevel.equals("address_level3")){
			titleVO.setAddressTitle("동 단위");
		} else {
			titleVO.setAddressTitle(null);
		}
		
		if(timeLevel.equals("time_level1")) {
			titleVO.setTimeTitle("월 단위");
		} else if(timeLevel.equals("time_level2")) {
			titleVO.setTimeTitle("일 단위");
		} else if(timeLevel.equals("time_level3")){
			titleVO.setTimeTitle("요일 단위");
		} else {
			titleVO.setTimeTitle(null);
		}
			
		return titleVO;
	}
}
