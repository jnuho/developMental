package com.kh.workman.job.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class JobApply {
  private int boardNo;
  private int memberNo;
  private String resume;
  private String intro;

}
