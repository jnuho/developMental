package com.kh.workman.collabo.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CollaboComment {
	private int no;
	private int cardNo;
	private int writer;
	private String content;
	private Date regdate;
	private int status;
}
