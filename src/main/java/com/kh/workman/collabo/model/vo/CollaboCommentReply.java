package com.kh.workman.collabo.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CollaboCommentReply {
	private int no;
	private int targetNo;
	private int writer;
	private String content;
	private Date regdate;
	private int status;
}
