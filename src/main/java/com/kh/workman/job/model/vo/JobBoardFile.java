package com.kh.workman.job.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class JobBoardFile {
  private int boardNo;
  private String orgName;
  private String newName;
}
