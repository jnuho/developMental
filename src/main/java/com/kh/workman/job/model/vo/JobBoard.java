package com.kh.workman.job.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.kh.workman.common.CustomJsonDateDeserializer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class JobBoard {
  private int no;
  private String writer;
  private String title;
  private String content;
  private Date regDate;
  private int count;
  private int status;
  private int applicants; //new column
  private String fileNewName; //JobBoardFile column
  private String boardName;
  private String hashtags;
  
  @JsonDeserialize(using = CustomJsonDateDeserializer.class)
  public Date getRegDate() { return this.regDate; }

  @JsonDeserialize(using = CustomJsonDateDeserializer.class)
  public void setRegDate(Date regDate) { this.regDate = regDate; }
  
  public int getApplicants() { return applicants; }
  public void setApplicants(int applicants){ this.applicants = applicants; }

  public String getFileNewName(){ return fileNewName; }
  public void setFileNewName(String fileNewName) { this.fileNewName = fileNewName; }
  
  public String getBoardName()
	{
		return boardName;
	}
	public void setBoardName(String boardName)
	{
		this.boardName = boardName;
	}
  
  public String getHashtags(){ return hashtags; }
  public void setHashtags(String hashtags) { this.hashtags= hashtags; }
}
