package com.kh.workman.study.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StudyBoard {
	private int no;
	  private String writer;
	  private String title;
	  private String content;
	  private Date regDate;
	  private int count;
	  private int status;
	
	
}
