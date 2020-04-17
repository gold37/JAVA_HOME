package jdbc.day04.board;


//DTO(Data Transfer Object) 쉽게말하면 행(row)이다.

public class MemberDTO {

	private int    userseq;      // 회원번호
	private String userid;       // 회원아이디
	private String pwd;      	 // 회원암호
	private String name;         // 회원명
	private String mobile;       // 연락처
	private int point;           // 포인트
	private String registerday;  // 가입일자
	private int status;          // status 컬럼의 값이 1 이면 정상, 0 이면 탈퇴
	
	public int getUserseq() {
		return userseq;
	}
	
	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getpwd() {
		return pwd;
	}
	
	public void setpwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public int getPoint() {
		return point;
	}
	
	public void setPoint(int point) {
		this.point = point;
	}
	
	public String getRegisterday() {
		return registerday;
	}
	
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}

	public String listInfo() { // 전체 회원 보여주기
		
		String pwd = "";
	      if (getpwd() != null && getpwd().length() > 4) {
	          pwd = getpwd().substring(0,4); // 남은 암호만큼 *로 보이게 바꿔주기
	          
	          for(int i = 4; i < getpwd().length(); i++) {
	             pwd += "*";
	          }
	       } else {
	    	   pwd = getpwd();
	       }
	       
	       String str = "";
	       
	       // 탈퇴유무 (status) 1이면 가입 0 이면 탈퇴.
	       if (getStatus() == 1) {
	          str = "가입";
	       } else {
	          str = "탈퇴";
	       }
		
		String listInfo = userid+"\t"+pwd+"\t"+name+"\t"+mobile+"\t"+point+"\t"+registerday+"\t"+str;
		
		return listInfo;
	}
	
	
}
