package com.kh.workman.job.controller;

import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.DataBuffer;
import java.awt.image.DataBufferInt;
import java.awt.image.DirectColorModel;
import java.awt.image.PixelGrabber;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.workman.common.PageBarFactory;
import com.kh.workman.common.api.JobGithubApi;
import com.kh.workman.common.api.JobSaraminApi;
import com.kh.workman.common.crawling.JobITWorldCrawler;
import com.kh.workman.hashtag.model.vo.Hashtag;
import com.kh.workman.job.model.service.JobService;
import com.kh.workman.job.model.vo.JobApply;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.job.model.vo.JobBoardFile;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@PropertySource("classpath:/properties/config.properties")
@Controller
public class JobController {

  private Logger logger = LoggerFactory.getLogger(JobController.class);

  @Autowired
  private JobService jobService;

  @Autowired
  private MemberService memberService;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Value("${outlook}")
	private String boss;

	@Value("${saramin}")
	private String apikey;
  
  @RequestMapping("/job/jobBoardList")
  public ModelAndView jobBoardList(
      @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
      @RequestParam(value="page", required=false, defaultValue="1") String page,
      @RequestBody(required=false) Map<String,String> udf,
      @RequestParam(value="hashtags", required=false, defaultValue="") String hashtags)
          throws UnsupportedEncodingException, IOException{

    //1. Job Listings From Database (At least 1 Member Applied for the position)
    ModelAndView mv = new ModelAndView();
    int numPerPage = 5;

    List<Map<String, Object>> list = jobService.selectPageJobBoardList(cPage, numPerPage);
    int totalCount = jobService.selectJobBoardCount();

    //2. Additional Job Listings From Github or Saramin Job API (Not inserted into DB yet!)
    //   this data lists are inserted AFTER at least one Member applies for the position!
    //TODO: test data(to be replaced with User Input!)

    List<Map<String, Object>> newList = null;
    if(udf !=null && udf.size() > 0) {
      String apiType = udf.get("apiType");
      
      if(apiType.equals("github")) {
        newList = JobGithubApi.jobsGithubApi(udf, Integer.valueOf(page));
      } else if(apiType.contentEquals("saramin")) {
        newList = JobSaraminApi.jobSaraminApi(apikey, udf, Integer.valueOf(page));
      }
    }

    mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/job/jobBoardList"));
    mv.addObject("count", totalCount);
    mv.addObject("list", list);
    mv.addObject("newList", newList);
    
    mv.setViewName("job/jobBoardList");

    return mv;
  }

  @RequestMapping("/job/jobContentView.do")
  public ModelAndView jobContentView(JobBoard j, 
        @RequestParam(value="imageURL", required=false) String imageURL,
        @RequestParam(value="regDateRaw", required=false) String regDateRaw,
        @RequestParam(value="hashtags", required=false) String hashtags) {
    logger.debug(hashtags);

    JobBoard board = null;

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    //convert String to LocalDate
    LocalDate localDate = LocalDate.parse(regDateRaw, formatter);

    if(j.getNo() != 0)
      board = jobService.selectJobBoardOne(j);
    else
      board = j;

    java.sql.Date regDate = java.sql.Date.valueOf(localDate);

    board.setRegDate(regDate);

    ModelAndView mv = new ModelAndView();
    mv.addObject("jobBoard", board);
    mv.addObject("imageURL", imageURL);
    mv.addObject("hashtags", hashtags);

    mv.setViewName("job/jobContentView");
    
    return mv;
  }

  @RequestMapping("/job/jobApply")
  public ModelAndView applyJob(JobBoard j, HttpSession session,
        @RequestParam(value="imageURL", required=false) String imageUrl) {

    ModelAndView mv = new ModelAndView();
    mv.addObject("jobBoard", j);
    mv.addObject("imageURL", imageUrl);
    mv.setViewName("job/jobApplyForm");
    
    return mv;
  }

  @RequestMapping("/job/jobApplyEnd.do")
  public ModelAndView applyJobEnd(HttpSession session, JobBoard board, Member member,
        @RequestParam(value="resume", required=false) MultipartFile[] resume,
        @RequestParam(value="coverLetter", required=false) MultipartFile[] coverLetter,
        @RequestParam(value="imageURL", required=false) String imageUrl) {
//        @RequestParam(value="memberNo", required=false) Integer memberNo) {

    ModelAndView mv = new ModelAndView();
    String msg = "";
    String loc = "/";
      
    //1. 'Member' check company is a member
    Member newMember = new Member();
    String writer = "";

    if(board!=null && board.getWriter() !=null)
      writer = board.getWriter().replace(" ", "");

    board.setWriter(writer);

    newMember.setNickname(board.getWriter());
    newMember = memberService.selectMemberNickname(newMember);

    if(newMember == null) { // save API data to DB

      newMember = new Member(// put github / saramin posted company into our DB
          0/*no*/, writer, pwEncoder.encode(writer), writer, writer, boss/*email*/,
          "서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층"/*addr*/, "1544-9970"/*tel*/, null/*regdate*/,
          null /*moddate*/, 0/*status*/, null/*sns*/, null/*profile*/, 0/*reportcount*/, 0/*rmessage*/);
      int result = memberService.insertMember(newMember);
      
      if(result <= 0) {
        msg = board.getWriter() + " 회사 : 'Member' 데이터 등록에 실패하였습니다.";
        mv.addObject("msg", msg);
        mv.addObject("loc", loc);
        mv.setViewName("common/msg");
        return mv;
      }
    }

    //2. 'JobBoard', 'JobBoardFile'
    JobBoard newJobBoard = new JobBoard();
    JobBoardFile newJobBoardFile = new JobBoardFile();
    List<JobBoardFile> newJobBoardFileList = new ArrayList<JobBoardFile>();
    
    newJobBoard = jobService.selectJobBoardWriter(board);

    //check company registered a job post
    if(newJobBoard == null || newJobBoard.getNo() ==0) {
      String logoSaveDir = session.getServletContext().getRealPath("/resources/upload/job");

      newJobBoard = board;
      
      Image image = null;
      try {
        URL url = new URL(imageUrl);
        image = Toolkit.getDefaultToolkit().createImage(url);
        PixelGrabber pg = new PixelGrabber(image, 0, 0, -1, -1, true);
        pg.grabPixels();
        int width = pg.getWidth(), height = pg.getHeight();

        int[] RGB_MASKS = {0xFF0000, 0xFF00, 0xFF};
        ColorModel RGB_OPAQUE =
            new DirectColorModel(32, RGB_MASKS[0], RGB_MASKS[1], RGB_MASKS[2]);
        DataBuffer buffer = new DataBufferInt((int[]) pg.getPixels(), pg.getWidth() * pg.getHeight());
        WritableRaster raster = Raster.createPackedRaster(buffer, width, height, width, RGB_MASKS, null);
        BufferedImage bi = new BufferedImage(RGB_OPAQUE, raster, false, null);
        
        String orgName = newJobBoard.getWriter() + ".jpg";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
        int rdv=(int)(Math.random()*1000);

        String ext = orgName.substring(orgName.lastIndexOf("."));
        String newName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;

        File file = new File(logoSaveDir + File.separator + newName);

        ImageIO.write(bi, "jpg", file);
        

        //'JobBoardFile'
        newJobBoardFile = new JobBoardFile();
//        newJobBoardFile.setBoardNo(newMember.getNo());
        newJobBoardFile.setOrgName(orgName);
        newJobBoardFile.setNewName(newName);
        
        newJobBoardFileList = new ArrayList<JobBoardFile>();
        newJobBoardFileList.add(newJobBoardFile);
        
        //JobBoard, JobBoardFile
        int result = jobService.insertJobBoard(newJobBoard, newJobBoardFileList);

        if(result <=0) {
          msg = newJobBoard.getWriter() + " 회사 : 'JobBoard' 데이터 등록에 실패하였습니다.";

          mv.addObject("msg", msg);
          mv.addObject("loc", loc);
          mv.setViewName("common/msg");

          return mv;
        }
      } catch(Exception e) {
        e.printStackTrace();
      }
    }
    else { //memberNo !=0 && board.getNo() !=0
      //just save JobApply DB
    }
    //3. JobHashtag Hashtag

    //4. 'JobApply'
    JobApply newJobApply = new JobApply();

    newJobBoard = jobService.selectJobBoardWriter(newJobBoard);
    newMember = memberService.selectMemberNickname(newMember);

    newJobApply = new JobApply();
    newJobApply.setBoardNo(newJobBoard.getNo());
    newJobApply.setMemberNo(newMember.getNo());

    String saveDirResume = session.getServletContext().getRealPath("/resources/upload/job/resume");
    String saveDirCoverLetter = session.getServletContext().getRealPath("/resources/upload/job/coverLetter");
    
    File dirResume = new File(saveDirResume);
    File dirCoverLetter = new File(saveDirCoverLetter);

    if(!dirResume.exists()) {
      logger.debug("Original resume " + resume[0].getOriginalFilename());
      logger.debug("" + dirResume.mkdirs());
    }
    if(!dirCoverLetter.exists()) {
      logger.debug("Original coverLetter " + coverLetter[0].getOriginalFilename());
      logger.debug("" + dirCoverLetter.mkdirs());
    }
    
    for(MultipartFile f : resume) {
      if(!f.isEmpty()){
        String orgName = f.getOriginalFilename();
        String ext = orgName.substring(orgName.lastIndexOf("."));

        //set file extensions
        SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
        int rdv = (int)(Math.random() * 1000);
        String newName = sdf.format(System.currentTimeMillis()) + "_"+rdv+ext;
        
        try {
          f.transferTo(new File(saveDirResume + "/" + newName));
        } catch(Exception e) {
          e.printStackTrace();
        }
        newJobApply.setResume(newName);
      }
    }

    for(MultipartFile f : coverLetter) {
      if(!f.isEmpty()){
        String orgName = f.getOriginalFilename();
        String ext = orgName.substring(orgName.lastIndexOf("."));

        //set file extensions
        SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
        int rdv = (int)(Math.random() * 1000);
        String newName = sdf.format(System.currentTimeMillis()) + "_"+rdv+ext;
        
        try {
          f.transferTo(new File(saveDirCoverLetter + "/" + newName));
        } catch(Exception e) {
          e.printStackTrace();
        }
        newJobApply.setIntro(newName);
      }
    }
    int result = 0;
    result = jobService.insertJobApply(newJobApply);

    if(result >0) {
      msg = board.getWriter() + "회사 지원에 성공했습니다";
      loc = "/";
    }
    else {
      msg = board.getWriter() + "회사 지원에 실패했습니다";
      loc = "/";
    }
    mv = new ModelAndView();
    mv.addObject("msg",msg);
    mv.addObject("loc",loc);
    mv.setViewName("common/msg");
    
    return mv;
  }
  
  @RequestMapping("/job/jobEnroll")
  public ModelAndView jobEnrollView() {
    ModelAndView mv = new ModelAndView();

    mv.setViewName("job/jobEnroll");

    return mv;
  }
  
  @RequestMapping("/job/jobEnrollEnd.do")
  public ModelAndView jobEnrollEnd(JobBoard j, HttpSession session,
        @RequestParam(value="orgNames", required=false) MultipartFile[] orgNames,
        @RequestParam(value="jobType") String jobType,
        @RequestParam(value="location") String location,
        @RequestParam(value="description") String description,
        @RequestParam(value="howToApply") String howToApply,
        @RequestParam(value="hashtags", required=false) String hashtags){
    
    logger.debug("Original job board file name : " + orgNames[0].getOriginalFilename());

    /* 파일업로드 처리하기 */
    //1.저장경로 지정하기
    String saveDir = session.getServletContext().getRealPath("/resources/upload/job");
    List<JobBoardFile> jobBoardFileList = new ArrayList<JobBoardFile>(); //여러파일 보관용

    File dir = new File(saveDir);

    if(!dir.exists()) logger.debug("" + dir.mkdirs());

    for(MultipartFile f : orgNames) {
      if(!f.isEmpty()) {
        //rename file name
        String orgName = f.getOriginalFilename();
        String ext = orgName.substring(orgName.lastIndexOf("."));
        
        //set file renaming rules
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHMMssSSS");

        //generate random number for renaming
        int rdv = (int)(Math.random()*1000);
        String newName = sdf.format(System.currentTimeMillis()) + "_" + rdv+ ext;

        try {
          f.transferTo(new File(saveDir + "/" + newName));
        } catch(Exception e) {
          e.printStackTrace(); //IllegalStateException, IOException
        }
        
        //save data to insert to DB 
        JobBoardFile jbf = new JobBoardFile();
//        jbf.setBoardNo(j.getNo());
        jbf.setOrgName(orgName);
        jbf.setNewName(newName);
        jobBoardFileList.add(jbf);
      }
    }

    logger.debug(j.toString());
    logger.debug("--------------------------");
    logger.debug(jobType);
    logger.debug(location);
    logger.debug(description);
    logger.debug(howToApply);

    j.setContent("Ⅰ. 근무형태 : " + jobType
            + "\nⅡ. 위치 : " + location
            + "\nⅢ. 세부내용 : " + description
            + "\nⅣ. 지원방법 : " + howToApply + "\n");

    //hashtags
    List<Hashtag> hashtagList = new ArrayList<Hashtag>();
    for(String name : Arrays.asList(hashtags.replace(" ", "").split("#"))) {
      if(name.length() ==0) continue;
      Hashtag tag = new Hashtag();
      tag.setName(name);
      hashtagList.add(tag);
    }

    int result = 0;
    try {
      result = jobService.insertJobBoardWithHashtag(j, jobBoardFileList, hashtagList);
    } catch(Exception e) {
      e.printStackTrace();
    }

    String msg = "", loc= "";
    if(result > 0) {
      msg = "성공적으로 구인공고를 업로드 했습니다";
      loc = "/";
    }
    else {
      msg="구인공고 등록에 실패했습니다.!";
      loc="/";
    }
    
    ModelAndView mv = new ModelAndView();
    mv.addObject("msg", msg);
    mv.addObject("loc", loc);
    mv.setViewName("common/msg");

    return mv;
  }
  
  @ResponseBody
  @RequestMapping("/job/newsList")
  public String showNewsList() throws JsonProcessingException {

    List<Map<String,String>> crawlNewsList = JobITWorldCrawler.crawlNewsList();
    
    ObjectMapper mapper = new ObjectMapper();
    return mapper.writeValueAsString(crawlNewsList);
  }
  
  @RequestMapping("/job/searchTag")
  public ModelAndView searchHashtags( @RequestParam(value="hashtags", required=false) String hashtags) {
    ModelAndView mv= new ModelAndView();
    mv.addObject("hashtags", hashtags);
    return mv;
  }
}
