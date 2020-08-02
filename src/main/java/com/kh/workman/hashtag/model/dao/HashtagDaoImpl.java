package com.kh.workman.hashtag.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.hashtag.model.vo.Hashtag;
import com.kh.workman.hashtag.model.vo.JobHashtag;

@Repository
public class HashtagDaoImpl implements HashtagDao {

  @Override
  public Hashtag selectHashtag(SqlSessionTemplate session, Hashtag h) {
    return session.selectOne("hashtag.selectHashtag", h);
  }

  @Override
  public int insertHashtag(SqlSessionTemplate session, Hashtag h) {
    return session.insert("hashtag.insertHashtag", h);
  }

  @Override
  public int insertJobHashtag(SqlSessionTemplate session, JobHashtag j) {
    return session.insert("hashtag.insertJobHashtag", j);
  }

  
}
