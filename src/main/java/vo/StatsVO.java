package vo;

public class StatsVO {
	int stat_no;
	int report_no;
	AddressVO addressVO;
	TimeVO timeVO;
	/*
	String address_level1; //시
	String address_level2; //구
	String address_level3; //동
	String time_level1; //월
	String time_level2; //일
	String time_level3; //요일
	*/
	public int getStat_no() {
		return stat_no;
	}
	public void setStat_no(int stat_no) {
		this.stat_no = stat_no;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public AddressVO getAddressVO() {
		return addressVO;
	}
	public void setAddressVO(AddressVO addressVO) {
		this.addressVO = addressVO;
	}
	public TimeVO getTimeVO() {
		return timeVO;
	}
	public void setTimeVO(TimeVO timeVO) {
		this.timeVO = timeVO;
	}
	
	
	/*
	public String getAddress_level1() {
		return address_level1;
	}
	public void setAddress_level1(String address_level1) {
		this.address_level1 = address_level1;
	}
	public String getAddress_level2() {
		return address_level2;
	}
	public void setAddress_level2(String address_level2) {
		this.address_level2 = address_level2;
	}
	public String getAddress_level3() {
		return address_level3;
	}
	public void setAddress_level3(String address_level3) {
		this.address_level3 = address_level3;
	}
	public String getTime_level1() {
		return time_level1;
	}
	public void setTime_level1(String time_level1) {
		this.time_level1 = time_level1;
	}
	public String getTime_level2() {
		return time_level2;
	}
	public void setTime_level2(String time_level2) {
		this.time_level2 = time_level2;
	}
	public String getTime_level3() {
		return time_level3;
	}
	public void setTime_level3(String time_level3) {
		this.time_level3 = time_level3;
	}
	*/
}
