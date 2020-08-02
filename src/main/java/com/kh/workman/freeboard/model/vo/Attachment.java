package com.kh.workman.freeboard.model.vo;

import java.util.Date;

import com.kh.workman.admin.model.vo.AdminMember;

import lombok.Data;

@Data
public class Attachment {

	private int attachmentNo;
	private int noticeNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private String status;
	private int downloadCount;

}
