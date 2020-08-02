package com.kh.workman.freeboard.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.workman.common.PageBarFactory;
import com.kh.workman.freeboard.controller.FreeBoardController;
import com.kh.workman.freeboard.model.service.FreeBoardService;
import com.kh.workman.freeboard.model.vo.Attachment;

@Controller
public class FreeBoardController {
	private Logger logger=LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	FreeBoardService service;
	
	@RequestMapping("/freeboard/freeboardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=5;
		List<Map<String,String>> list=service.selectBoardList(cPage,numPerPage);
		int totalCount=service.selectBoardCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/workman/freeboard/freeboardList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("freeboard/freeboardList");
		
		return mv;
	}
	
//	@RequestMapping("/freeboard/freeboardForm")
//	public String boardForm() {
//		return "freeboard/freeboardForm";
//	}

	
	@RequestMapping("/freeboard/editor/editorWrite")
	public String boardForm() {
		return "freeboard/editor/editorWrite";
	}
	
	
	//게시글작성
	@RequestMapping("/freeboard/freeboardFormEnd.do")
	public ModelAndView insertBoard(@RequestParam Map<String,String> param,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile ,HttpServletRequest request){
		logger.debug(upFile[0].getOriginalFilename());
		logger.debug(""+upFile[0].getSize());
		logger.debug(upFile[1].getOriginalFilename());
		logger.debug(""+upFile[1].getSize());
		
		/* 파일업로드 처리 */
		//1. 저장경로 지정하기
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/board");
		List<Attachment> attachList=new ArrayList();//여러파일 보관용
		
		File dir=new File(saveDir);
		if(!dir.exists()) logger.debug("생성결과 : "+dir.mkdirs());
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//파일명 생성(rename)
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				
				//규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				//파일 실제 저장하기
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				//DB에 저장할 데이터 보관
				Attachment att=new Attachment();
				att.setOriginalFileName(oriFileName);
				att.setRenamedFileName(reName);
				attachList.add(att);
			}

		}
		int result=service.insertBoard(param,attachList);
		
		String msg="";
		String loc="/freeboard/freeboardList.do";
		if(result>0) {
			msg="입력성공";
		}else {
			msg="입력실패";
		}		
		ModelAndView mv= new ModelAndView();				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);		
		mv.setViewName("common/msg");
		return mv;
	}
	
	//게시글 상세보기
	@RequestMapping("/freeboard/freeboardView.do")
	public ModelAndView boardView(int boardNo) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> board = service.selectBoard(boardNo);
		List<Attachment> att = service.selectAttachList(boardNo);
		
		mv.addObject("board", board);
		mv.addObject("attach", att);
		mv.setViewName("freeboard/freeboardView");
		return mv;
	}
	
	//파일다운로드
	@RequestMapping("/freeboard/filedownLoad.do")
	public void fileDownLoad(String oName, String rName, HttpServletRequest req, HttpServletResponse res) {
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String dir = req.getSession().getServletContext().getRealPath("/resources/upload/freeboard");
		File saveFile = new File(dir+"/"+rName);//이미 저장된것을 다운로드하기 때문에 rName
		
		try {
			FileInputStream fis=new FileInputStream(saveFile);
			bis=new BufferedInputStream(fis);
			sos=res.getOutputStream();
			String resFileName="";
			boolean isMSIE=req.getHeader("user-agent").indexOf("MISE")!=-1||req.getHeader("user-agent").indexOf("Trident")!=-1;  
			if(isMSIE) {
				resFileName=URLEncoder.encode(oName,"UTF-8");
				resFileName=resFileName.replace("\\", "%20");
			}else {
				resFileName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/octet-stream;charset=utf-8");
			res.addHeader("Content-Disposition", "attachment;filename=\""+resFileName+"\"");
			res.setContentLength((int)saveFile.length());
			
			int read=0;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}