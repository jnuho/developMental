package com.kh.workman.hashtag.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.hashtag.model.vo.Hashtag;
import com.kh.workman.hashtag.model.vo.JobHashtag;

public interface HashtagDao {

  Hashtag selectHashtag(SqlSessionTemplate session, Hashtag h);

  int insertHashtag(SqlSessionTemplate session, Hashtag h);
  int insertJobHashtag(SqlSessionTemplate session, JobHashtag j);
}
