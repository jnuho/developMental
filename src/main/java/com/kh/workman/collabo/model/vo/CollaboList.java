package com.kh.workman.collabo.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CollaboList {
	private int listNo;
	private int collaboNo;
	private String title;
	private int writer;
	private Date regdate;
	private int placeNo;
}
