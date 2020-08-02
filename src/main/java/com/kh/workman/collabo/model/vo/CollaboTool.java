package com.kh.workman.collabo.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CollaboTool {

	private int no;
	private int owner;
	private String title;
	private Date regdate;
	private int pstatus;

}
