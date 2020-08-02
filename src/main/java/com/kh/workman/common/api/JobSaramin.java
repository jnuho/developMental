package com.kh.workman.common.api;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.kh.workman.common.CustomJsonDateDeserializer;

/**
 * @since 19.11.11
 * @author jnuho@outlook.com
 * @implNote this vo is used to create instances from saramin API call result columns
 *   JobSaramin is NOT inserted into Oracle database UNTIL member applies for it!
 */

public class JobSaramin {
//  private int no;
//  private String writer;
//  private String title;
//  private String content;
//  private Date regDate;
//  private int count;
//  private int status;
//  private int applicants; //new column
//  private String fileNewName; //JobBoardFile column
//  private String boardName;

  private String url;
  private int active; //공고진행여부 1:진행중 0:마감
  private String company; //기업정보 (detail - href+name)
  private String position; //job description (title+ industry+ location+...)
  private String id; //unique identifier for a job
  private Date postingDate;
  private String keyword; //hashtag
  private int salary;
  
  public JobSaramin() {
    // TODO Auto-generated constructor stub
  }
  
  public JobSaramin(String url, int active, String company, String position, String id, Date postingDate,
      String keyword, int salary) {
    super();
    this.url = url;
    this.active = active;
    this.company = company;
    this.position = position;
    this.id = id;
    this.postingDate = postingDate;
    this.keyword = keyword;
    this.salary = salary;
  }

  @Override
  public String toString() {
    return "JobSaramin [url=" + url + ", active=" + active + ", company=" + company + ", position=" + position + ", id="
        + id + ", postingDate=" + postingDate + ", keyword=" + keyword + ", salary=" + salary + "]";
  }

  public String getUrl() { return url; }
  public void setUrl(String url) { this.url = url; }
  public int getActive() { return active; }
  public void setActive(int active) { this.active = active; }
  public String getCompany() { return company; }
  public void setCompany(String company) { this.company = company; }
  public String getPosition() { return position; }
  public void setPosition(String position) { this.position = position; }
  public String getId() { return id; }
  public void setId(String id) { this.id = id; }
  @JsonDeserialize(using = CustomJsonDateDeserializer.class)
  public Date getPostingDate() { return postingDate; }
  @JsonDeserialize(using = CustomJsonDateDeserializer.class)
  public void setPostingDate(Date postingDate) { this.postingDate = postingDate; }
  public String getKeyword() { return keyword; }
  public void setKeyword(String keyword) { this.keyword = keyword; }
  public int getSalary() { return salary; }
  public void setSalary(int salary) { this.salary = salary; }
}
