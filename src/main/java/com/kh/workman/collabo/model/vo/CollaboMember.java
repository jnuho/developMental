package com.kh.workman.collabo.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CollaboMember {
	private int no;
	private int member;
	private Date regdate;
}
