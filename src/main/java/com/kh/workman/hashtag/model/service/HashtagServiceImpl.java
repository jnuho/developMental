package com.kh.workman.hashtag.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.hashtag.model.dao.HashtagDao;
import com.kh.workman.hashtag.model.vo.Hashtag;
import com.kh.workman.hashtag.model.vo.JobHashtag;

@Service
public class HashtagServiceImpl implements HashtagService{
  
  @Autowired
  HashtagDao dao;
  
  @Autowired
  SqlSessionTemplate session;


  @Override
  public Hashtag selectHashtag(Hashtag h) {
    return dao.selectHashtag(session, h);
  }

  @Override
  public int insertHashtag(Hashtag h) {
    return dao.insertHashtag(session, h);
  }

  @Override
  public int insertJobHashtag(JobHashtag j) {
    return dao.insertJobHashtag(session, j);
  }

  
}
