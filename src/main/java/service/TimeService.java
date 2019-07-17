package service;

import java.text.*;
import java.util.*;

import org.springframework.stereotype.*;

import vo.*;

@Service
public class TimeService {
	public TimeVO sliceTime(String time) throws ParseException {
		TimeVO vo = new TimeVO();
		
		String[] temp = time.split(" ");
		vo.setTime_level3(getDay(temp[0]));
		vo.setTime_level2(temp[0]);
		
		String level1 = temp[0].substring(0, 7);
		vo.setTime_level1(level1);
		
		return vo;
	}
	
	public String getDay(String date) throws ParseException {
		
		String day = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(format.parse(date));
		
		switch(calendar.get(Calendar.DAY_OF_WEEK)) {
		case 1: day="일"; break;
		case 2: day="월"; break;
		case 3: day="화"; break;
		case 4: day="수"; break;
		case 5: day="목"; break;
		case 6: day="금"; break;
		case 7: day="토"; break;
		}
		
		return day;
	}
}
