package com.kh.workman.job.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.hashtag.model.dao.HashtagDao;
import com.kh.workman.hashtag.model.vo.Hashtag;
import com.kh.workman.hashtag.model.vo.JobHashtag;
import com.kh.workman.job.model.dao.JobDao;
import com.kh.workman.job.model.vo.JobApply;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.job.model.vo.JobBoardFile;

@Service
public class JobServiceImpl implements JobService {

  @Autowired
  JobDao dao;
  
  @Autowired
  HashtagDao hDao;

  @Autowired
  SqlSessionTemplate session;

  @Override
  public JobBoard selectJobBoardOne(JobBoard j) {
    return dao.selectJobBoardOne(session, j);
  }

  @Override
  public JobBoard selectJobBoardWriter(JobBoard j) {
    return dao.selectJobBoardWriter(session, j);
  }
  
  @Override
  public List<Map<String, Object>> selectPageJobBoardList(int cPage, int numPerPage) {
    return dao.selectPageJobBoardList(session, cPage, numPerPage);
  }

  @Override
  public int selectJobBoardCount() {
    return dao.selectJobBoardCount(session);
  }

  @Override
  public int insertJobBoardWithHashtag(JobBoard job, List<JobBoardFile> jobBoardFileList,
      List<Hashtag> hashtags) throws Exception{
    int result = 0;
    result = dao.insertJobBoard(session, job);
    if(result ==0) throw new RuntimeException(); //TransactionManager rollback automatically

    int boardNo =  dao.selectJobBoardSeq(session);
    
    //hashtags
    if(hashtags != null && hashtags.size()>0) {
      for(Hashtag h : hashtags) {
        hDao.insertHashtag(session, h);

        JobHashtag j = new JobHashtag();
        j.setBoardNo(boardNo);
        j.setHashtagNo(hDao.selectHashtag(session, h).getNo());

        hDao.insertJobHashtag(session, j);
      }
    }
    
    if(jobBoardFileList != null && jobBoardFileList.size() > 0) {
      for(JobBoardFile f : jobBoardFileList) {
        f.setBoardNo(boardNo);
        result = dao.insertJobBoardFile(session, f);
        if(result ==0) throw new Exception();
      }
    }
    return result;
  }

  @Override
  public int insertJobBoard(JobBoard job, List<JobBoardFile> jobBoardFileList) throws Exception{
    int result = 0;
    result = dao.insertJobBoard(session, job);
    if(result ==0) throw new RuntimeException(); //TransactionManager rollback automatically

    int boardNo =  dao.selectJobBoardSeq(session);
    
    if(jobBoardFileList != null && jobBoardFileList.size() > 0) {
      for(JobBoardFile f : jobBoardFileList) {
        f.setBoardNo(boardNo);
        result = dao.insertJobBoardFile(session, f);
        if(result ==0) throw new Exception();
      }
    }
    return result;
  }

  @Override
  public int insertJobApply(JobApply apply) {
    return dao.insertJobApply(session, apply);
  }

  
}
