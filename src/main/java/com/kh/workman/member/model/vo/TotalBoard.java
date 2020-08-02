package com.kh.workman.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TotalBoard {
	private int no;
	private String writer;
	private String title;
	private String content;
	private int count;
	private int status;
	private String boardName;
	
	public String getBoardName()
	{
		return boardName;
	}
	public void setBoardName(String boardName)
	{
		this.boardName = boardName;
	}
	

}
