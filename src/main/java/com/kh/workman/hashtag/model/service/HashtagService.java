package com.kh.workman.hashtag.model.service;

import com.kh.workman.hashtag.model.vo.Hashtag;
import com.kh.workman.hashtag.model.vo.JobHashtag;

public interface HashtagService {

  Hashtag selectHashtag(Hashtag h);

  int insertHashtag(Hashtag h);
  int insertJobHashtag(JobHashtag j);
}
