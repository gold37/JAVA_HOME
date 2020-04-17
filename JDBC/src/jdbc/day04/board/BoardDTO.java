package jdbc.day04.board;

public class BoardDTO {

	private int boardno;		 // 글번호
	private String fk_userid;	 // 작성자 아이디
	private String subject;		 // 글제목
	private String contents; 	 // 글내용
	private String writeday;	 // 작성일자
	private int viewcount; 		 // 조회수
	private String boardpwd; 	 // 글암호
	
	private MemberDTO member; 	 // 글쓴이에 대한 모든 정보
	
	private int commentcnt;

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public int getCommentcnt() {
		return commentcnt;
	}

	public void setCommentcnt(int commentcnt) {
		this.commentcnt = commentcnt;
	}

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
	
	public int getviewcount() {
		return viewcount;
	}
	
	public void setviewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	
	public String getBoardpwd() {
		return boardpwd;
	}
	
	public void setBoardpwd(String boardpwd) {
		this.boardpwd = boardpwd;
	}
	
	public MemberDTO getMember() {
		return member;
	}

	public void setMember(MemberDTO member) {
		this.member = member;
	}
	
	public String listInfo() { // 글번호 글제목 글쓴이 작성일자 조회수
		
	    if(subject != null && subject.length() >= 10) {
	          subject = subject.substring(0,10)+"..."; // 글 제목 10글자 이상이면 .. 으로 글 줄임 
	       }
	    
		if(commentcnt > 0) {
			subject += "["+commentcnt+"]";
		}
		
		String listInfo = boardno+"\t"+subject+"\t"+member.getName()+"\t"+writeday+"\t"+viewcount;
		
		return listInfo; 
	}
	
	
	
}









