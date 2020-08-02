package com.kh.workman.admin.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.admin.model.service.NoticeService;
import com.kh.workman.admin.model.vo.AdminAttachment;
import com.kh.workman.admin.model.vo.AdminNotice;
import com.kh.workman.common.PageBarFactory;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;


@Controller
public class AdminNoticeController {
	
	private Logger logger=LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	NoticeService service;
	@Autowired
	MemberService mService;
	
	@RequestMapping("/admin/noticeList")	
	public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession(false);
			
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(loginMember);
		
		int numPerPage=10;
		//공지사항 리스트 전부 불러오기
		List<AdminNotice> list = service.selectNoticeList(cPage,numPerPage);
		//사진파일 리스트 전부 불러오기
		List<AdminAttachment> attList = service.selectAttachList();
		
		int totalCount = service.selectNoticeCount();
		mv.addObject("pageBar", PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/19AM_workman_final/admin/noticeList"));
		mv.addObject("count",totalCount);
		mv.addObject("list", list);
		mv.addObject("attList", attList);
		
		mv.setViewName("admin/notice/adminNoticeList");
		return mv;
		
	}
	
	@RequestMapping("/admin/noticeForm")
	public String noticeForm(HttpSession session) {
		System.out.println(session.getAttribute("loginMember"));
		return "admin/notice/adminNoticeForm";
	}
	
	@RequestMapping("/admin/memberNoticeList")
	public ModelAndView memberNoticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession(false);
			
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(loginMember);
		
		
		int numPerPage=10;
		//공지사항 리스트 전부 불러오기
		List<AdminNotice> list = service.selectNoticeList(cPage,numPerPage);
		//사진파일 리스트 전부 불러오기
		List<AdminAttachment> attList = service.selectAttachList();
		
		int totalCount = service.selectNoticeCount();
		mv.addObject("pageBar", PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/admin/memberNoticeList"));
		mv.addObject("count",totalCount);
		mv.addObject("list", list);
		mv.addObject("attList", attList);
		
		mv.setViewName("admin/notice/memberNoticeList");
		return mv;
		
	}
	
	@RequestMapping("/admin/noticeUpdate")
	public ModelAndView noticeUpdate(@RequestParam int noticeNo) {
		ModelAndView mv = new ModelAndView();
				
		AdminNotice notice = service.selectNoticeOne(noticeNo);
		List<AdminAttachment> aa = service.selectAttachment(noticeNo); 
		
		mv.addObject("notice", notice);
		mv.addObject("aa", aa);
		mv.setViewName("admin/notice/adminNoticeUpdate");
		
		return mv;
	}
	
	@RequestMapping("/admin/noticeUpdateEnd.do")
	public ModelAndView noticeUpdateEnd(@RequestParam Map<String,Object> param, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile ,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("업데이트 실행 : "+param);
		System.out.println(param.get("noticeNo"));
		
//		int noticeNo=Integer.parseInt(param.get("noticeNo"));
//		param.put("noticeNo", noticeNo);
		
		//1. 저장경로 지정하기
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");
		List<AdminAttachment> attachList=new ArrayList();//여러파일 보관용
		
		File dir=new File(saveDir);
		if(!dir.exists()) logger.debug("생성결과 : "+dir.mkdirs());
		
		if(!upFile[0].getOriginalFilename().equals("")){
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
					}catch (Exception e) {//IlligalStateException|IOException
						e.printStackTrace();
					}
					//DB에 저장할 데이터 보관
					AdminAttachment att=new AdminAttachment();
					att.setOriginalFileName(oriFileName);
					att.setRenamedFileName(reName);
					attachList.add(att);
				}

			}
		}
		
		int result=service.updateNotice(param,attachList);
		
		String msg="";
		String loc="/admin/noticeList";
		if(result>0) {
			msg="수정완료";
		}else {
			msg="수정실패";
		}
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
//		mv.setViewName("/admin/notice/adminNoticeList");
		return mv;
	}
	
	@RequestMapping("/admin/noticeFormEnd.do")
	public ModelAndView insertNotice(@RequestParam Map<String,String> param, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile ,HttpServletRequest request) {
		
		//1. 저장경로 지정하기
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");
		System.out.println(saveDir);
		List<AdminAttachment> attachList=new ArrayList();//여러파일 보관용
		
		HttpSession session = request.getSession(false); 
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println("공지사항 넣기 전 : "+loginMember);
		
		
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
					System.out.println("FILE저장함");
				}catch (Exception e) {//IlligalStateException|IOException
					e.printStackTrace();
				}
				//DB에 저장할 데이터 보관
				AdminAttachment att=new AdminAttachment();
				att.setOriginalFileName(oriFileName);
				att.setRenamedFileName(reName);
				attachList.add(att);
			}

		}
		int result=service.insertNotice(param,attachList);
		
		String msg="";
		String loc="/admin/noticeList";
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
	
	@RequestMapping("/admin/noticeDelete")
	public String noticeDelete(@RequestParam String noticeNo, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeNo", noticeNo);
		
		int num = service.deleteNotice(map);
		
		String msg="";
		String loc="";
		
		if(num==1) {
			msg+="공지사항 삭제 완료";
			loc+="/admin/noticeList";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}else {
			msg+="공지사항 삭제 실패";
			loc+="/admin/noticeList";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/admin/adminNoticeView.do")
	public ModelAndView noticeView(String noticeNo) {
		System.out.println("찍히나? : "+noticeNo);
		ModelAndView mv = new ModelAndView();
//		Map<String, String> notice = service.noticeView(noticeNo);
//		mv.addObject("notice", notice);
		mv.setViewName("admin/notice/adminNoticeView");
		
		return mv;
	}
	
	@RequestMapping("/notice/filedownLoad.do")
	public void fileDownLoad(String oName, String rName, HttpServletRequest req, HttpServletResponse res) {

		System.out.println("파일다운 oName : "+oName);
		System.out.println("파일다운 rName : "+rName);
		
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String dir = req.getSession().getServletContext().getRealPath("/resources/upload/notice");
		File saveFile = new File(dir+"/"+rName);//이미 저장된것을 다운로드하기 때문에 rName
		
		try {
			FileInputStream fis = new FileInputStream(saveFile);
			bis = new BufferedInputStream(fis);
			sos = res.getOutputStream();
			String resFileName="";
			boolean isMSIE=req.getHeader("user-agent").indexOf("MISE")!=-1||
							req.getHeader("user-agent").indexOf("Trident")!=-1;
			
			if(isMSIE) {
				resFileName=URLEncoder.encode(oName,"UTF-8");
				resFileName=resFileName.replace("\\", "%20");
			}else {
				resFileName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/octet-stream;charset=utf-8");
			res.addHeader("Content-Disposition", "attachmnet;filename=\""+resFileName+"\"");
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
