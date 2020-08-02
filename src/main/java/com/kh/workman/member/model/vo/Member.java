package com.kh.workman.member.model.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private int no;				// 회원번호
	private String id;			// 회원 아이디
	private String pw;			// 회원 비밀번호
	private String name;		// 회원 이름
	private String nickname;	// 회원 닉네임
	private String email;		// 회원 이메일
	private String addr;		// 회원 주소
	private String tel;			// 회원 핸드폰
	private Date regdate;		// 회원 생성일
	private Date moddate;		// 수정 날짜
	private int status;			// 1 일때 생성 , 0일때 삭제
	private String sns;			// G or F
	private String profile;		// profile
	private int reportcount;	// 신고당한 횟수
	private int rmessage;		// 1 or 0	
}
