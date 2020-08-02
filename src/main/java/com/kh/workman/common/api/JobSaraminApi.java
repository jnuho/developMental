package com.kh.workman.common.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.kh.workman.common.crawling.JobSaraminCrawler;

  /**
   * @apiNote saramin api
   * @author junholee(jnuho@outlook.com)
   * @since 2019.11.03
   */
public class JobSaraminApi {

  public static List<Map<String,Object>> jobSaraminApi(String apikey, Map<String, String> udf, int page)
      throws IOException, UnsupportedEncodingException {
//  public static void main(String[] args)  throws IOException, UnsupportedEncodingException {
    
    //parameters
    String keywords = URLEncoder.encode(udf.get("keywords"), "UTF-8").replace(" ", "%20");
    String type = udf.get("job_type");
    String locCd = udf.get("loc_cd");
    String indCd = udf.get("ind_cd");
    String jobCategory = udf.get("job_category");
    String sort = udf.get("sort");

    //요청 url
    String reqUrl ="https://oapi.saramin.co.kr/job-search";
    reqUrl+= "?access-key=" + apikey;
    reqUrl += "&keywords=" + keywords; //separated by %20 and , // PHP%20MySQL, PHP+MySQL, PHP,MySQL
    reqUrl += "&job_type=" + type; //"" all 1 full time / 2 contract worker
    reqUrl += "&loc_cd=" + locCd; //location 101000  서울
    reqUrl += "&ind_cd=" + indCd; //industry category 308 정보보안·백신
    reqUrl += "&job_category=" + jobCategory; //job category 402 서버·네트워크·보안 
    reqUrl += "&count=" + 10; //10 ~ max 110 jobs
    reqUrl += "&sort=" + sort; //sort order

    URL url = new URL(reqUrl);

    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("Accept", "application/json");

    String result = "";
    String line = "";

    try(InputStreamReader is = new InputStreamReader(conn.getInputStream());
        BufferedReader br = new BufferedReader(is);) {

      while((line = br.readLine()) != null)
        result += (line + "\n");
      
    } catch(IOException e) {
      e.printStackTrace();
    }

    ObjectMapper objectMapper = new ObjectMapper();
    objectMapper.configure(SerializationFeature.INDENT_OUTPUT, true);

    JsonNode tree = objectMapper .readTree(result);
    String formattedJson = objectMapper.writeValueAsString(tree);

    JSONObject obj = new JSONObject(formattedJson);
    JSONArray arr = obj.getJSONObject("jobs").getJSONArray("job");

    List<Map<String,Object>> newList = new ArrayList<Map<String, Object>>();

    Map<String, Object> newMap = new HashMap<String, Object>();
    for(int i =0; i<arr.length(); i++) {
      JSONObject pos = arr.getJSONObject(i).getJSONObject("position");

      String writer = arr.getJSONObject(i).getJSONObject("company")
          .getJSONObject("detail").getString("name"); // company name

      String title = "[" + pos.getJSONObject("experience-level").getString("name") + "]"
          + pos.getString("title");

      String content = "";
      String jobType = "Ⅰ. 근무형태 : " + pos.getJSONObject("job-type").getString("name");
      String loc = "Ⅱ. 위치 : " + pos.getJSONObject("location").getString("name");
      String desc = "Ⅲ. 세부내용 : \n"
          + "업종 : " + pos.getJSONObject("job-category").getString("name") + "\n"
          + "최소 교육수준 : " + pos.getJSONObject("required-education-level").getString("name");
      String howToApply = "Ⅳ. 지원방법 : " + arr.getJSONObject(i).getString("url");
      
      String jobDescUrl = arr.getJSONObject(i).getJSONObject("company")
          .getJSONObject("detail").getString("href");

      String timestampStr = arr.getJSONObject(i).getString("posting-timestamp");
      Timestamp timestamp = new Timestamp(Long.valueOf(timestampStr) * 1000);
      Date regDate = Date.valueOf(timestamp.toLocalDateTime().toLocalDate());
      String hashtags = arr.getJSONObject(i).getString("keyword");

      content = jobType+"\n"+loc + "\n" + desc +"\n" + howToApply + "\n";
      
      newMap = new HashMap<String, Object>();

      newMap.put("NO", 0);
      newMap.put("WRITER", writer);
      newMap.put("TITLE", title);
      newMap.put("CONTENT", content);
      newMap.put("REGDATE", regDate);
      newMap.put("COUNT", 0);
      newMap.put("STATUS", 1);
      newMap.put("APPLICANTS", 0);
      newMap.put("imageURL", JobSaraminCrawler.crawlCompanyLogo(jobDescUrl));
      newMap.put("hashtags", hashtags);
      
      newList.add(newMap);
    }

    return newList;
  }
}
