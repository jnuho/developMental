package com.kh.workman.collabo.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CollaboCard {
	private int cardNo;
	private int listNo;
	private int writer;
	private String content;
	private Date regdate;
	private int placeNo;
}
