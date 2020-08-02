package com.kh.workman.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyStudyBoard {
	private int no;
	  private String writer;
	  private String title;
	  private String content;
	  private Date regDate;
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
