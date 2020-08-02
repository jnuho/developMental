package com.kh.workman.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class AdminMember {
	
	private int no;
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String email;
	private String addr;
	private String tel;
	private Date regDate;
	private Date modDate;
	private int status;
	private String sns;	
	private String profile;
	private int reportCount;
	private int rmessage;
	
	

}
