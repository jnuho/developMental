package com.kh.workman.admin.model.vo;

import java.sql.Date;


import lombok.Data;

@Data
public class AdminAttachment {

	private int attachmentNo;
	private int noticeNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downloadCount;
	private String status;
	
}