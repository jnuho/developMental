package com.kh.workman.hashtag.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Hashtag {
  private int no;
  private String name;
  private int count;
}
