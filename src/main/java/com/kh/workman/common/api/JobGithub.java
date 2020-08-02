package com.kh.workman.common.api;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.kh.workman.common.CustomJsonDateDeserializer;

/**
 * @since 19.10.26
 * @author jnuho@outlook.com
 * @implNote this vo is used to create instances from github job API call result columns
 *   JobGithub is NOT inserted into Oracle database UNTIL member applies for it!
 */
public class JobGithub {
  private String id; //job listing id
  private String type; // Full Time or not
  private String url; //job listing url
  private Date createdAt; //created date
  private String company; //company name
  private String companyUrl;
  private String location; //City name
  private String title; //job listing title
  private String description; //job description
  private String howToApply; //instruction on how to apply for the position
  private String companyLogo; //company logo url link

  @Override
  public boolean equals(Object obj) {
    JobGithub job = (JobGithub)obj;
    return id.equals(job.getId());
  }

  @Override
  public String toString() {
    return "GithubJob [id=" + id + ", type=" + type + ", url=" + url + ", createdAt=" + createdAt + ", company="
        + company + ", companyUrl=" + companyUrl + ", location=" + location + ", title=" + title + ", description="
        + description + ", howToApply=" + howToApply + ", companyLogo=" + companyLogo + "]";
  }

  public String getId() { return id; }
  public void setId(String id) { this.id = id; }
  public String getType() { return type; }
  public void setType(String type) { this.type = type; }
  public String getUrl() { return url; }
  public void setUrl(String url) { this.url = url; }
  @JsonDeserialize(using = CustomJsonDateDeserializer.class)
  public Date getCreatedAt() { return createdAt; }
  @JsonDeserialize(using = CustomJsonDateDeserializer.class)
  public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
  public String getCompany() { return company; }
  public void setCompany(String company) { this.company = company; }
  public String getCompanyUrl() { return companyUrl; }
  public void setCompanyUrl(String companyUrl) { this.companyUrl = companyUrl; }
  public String getLocation() { return location; }
  public void setLocation(String location) { this.location = location; }
  public String getTitle() { return title; }
  public void setTitle(String title) { this.title = title; }
  public String getDescription() { return description; }
  public void setDescription(String description) { this.description = description; }
  public String getHowToApply() { return howToApply; }
  public void setHowToApply(String howToApply) { this.howToApply = howToApply; }
  public String getCompanyLogo() { return companyLogo; }
  public void setCompanyLogo(String companyLogo) { this.companyLogo = companyLogo; }
  
}
