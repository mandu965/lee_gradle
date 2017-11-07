package lee.domain;

import lombok.Data;

@Data
public class CmntVO {
	private long cmnt_sno;	//코멘트일련번호
	private long blt_rsrc_sno;	//게시자료일련번호
	private String cmnt_contents;	//코멘트내용
	private long reg_usr_no;	//등록사용자번호
	private String reg_date;	//등록일시
	private String del_yn;	//삭제여부
	private String usr_id;	//작성자 이름
}
