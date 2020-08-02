package com.kh.workman.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class ArrayTypeHandler implements TypeHandler<String[]> {

  //pstmt.setString setInt ... 비슷
  /*
   * @param i 인덱스
   * @param parameter 값(Stringp[] devLange)
   *  */
  @Override
  public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
    //스트링 형식으로 바꿔 줌; 타입 재구현
    //#{devLang}에 알아서 자동으로 join된 String 값이 들어감
    if(parameter != null)
      ps.setString(i, String.join(",", parameter)); //i번째에 이 값을 집어 넣음
    else
      ps.setString(i, ""); //i번쨰에 공값을 넣음

  }

  @Override
  public String[] getResult(ResultSet rs, String columnName) throws SQLException {
    return (rs.getString(columnName)).split(",");
  }

  @Override
  public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
    return (rs.getString(columnIndex)).split(",");
  }

  /**
   * param cs : procedure 실행했을때 
   */
  @Override
  public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
    return (cs.getString(columnIndex)).split(",");
  }

}
