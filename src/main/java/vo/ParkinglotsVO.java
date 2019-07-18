package vo;

public class ParkinglotsVO {
	private int parkinglot_no;
	private String name;
	private String address;
	private String tel;
	private double lat;
	private double log;
	
	public int getParkinglot_no() {
		return parkinglot_no;
	}
	public void setParkinglot_no(int parkinglot_no) {
		this.parkinglot_no = parkinglot_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLog() {
		return log;
	}
	public void setLog(double log) {
		this.log = log;
	}
}
