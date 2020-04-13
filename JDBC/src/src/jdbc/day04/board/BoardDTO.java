package jdbc.day04.board;

public class BoardDTO {

	private int boardno; // 글번호
	private String fk_userid; // 작성자 아이디
	private String subject; // 글제목
	private String contents; // 글내용
	private String writeday; // 작성일자
	private int number; // 조회수
	private String boardpwd; // 글암호
	
	public int getBoardno() {
		return boardno;
	}
	
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	
	public String getFk_userid() {
		return fk_userid;
	}
	
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getWriteday() {
		return writeday;
	}
	
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	public int getNumber() {
		return number;
	}
	
	public void setNumber(int number) {
		this.number = number;
	}
	
	public String getBoardpwd() {
		return boardpwd;
	}
	
	public void setBoardpwd(String boardpwd) {
		this.boardpwd = boardpwd;
	}
}
