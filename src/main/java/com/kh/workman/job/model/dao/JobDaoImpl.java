package com.kh.workman.job.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.job.model.vo.JobApply;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.job.model.vo.JobBoardFile;

@Repository
public class JobDaoImpl implements JobDao {

  @Override
  public JobBoard selectJobBoardOne(SqlSessionTemplate session, JobBoard j) {
    return session.selectOne("job.selectJobBoardOne", j);
  }
  
  @Override
  public JobBoard selectJobBoardWriter(SqlSessionTemplate session, JobBoard j) {
    return session.selectOne("job.selectJobBoardWriter", j);
  }

  @Override
  public List<Map<String, Object>> selectPageJobBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
    RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);

    return session.selectList("job.selectPageJobBoardList", null, rows);
  }

  @Override
  public int selectJobBoardCount(SqlSessionTemplate session) {
    return session.selectOne("job.selectJobBoardCount");
  }

  @Override
  public int insertJobBoard(SqlSessionTemplate session, JobBoard job) {
    return session.insert("job.insertJobBoard", job);
  }

  @Override
  public int insertJobBoardFile(SqlSessionTemplate session, JobBoardFile file) {
    return session.insert("job.insertJobBoardFile", file);
  }
  
  @Override
  public int selectJobBoardSeq(SqlSessionTemplate session) {
    return session.selectOne("job.selectJobBoardSeq");
    
  }

  @Override
  public int insertJobApply(SqlSessionTemplate session, JobApply apply) {
    return session.insert("job.insertJobApply", apply);
  }
  
}
