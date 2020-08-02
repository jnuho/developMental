package com.kh.workman.study.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.PageBarFactory;
import com.kh.workman.study.model.service.StudyService;

@Controller
public class StudyBoardController {
	private Logger logger = LoggerFactory.getLogger(StudyBoardController.class);
	
	 @Autowired
	 private StudyService service;

	@RequestMapping("/study/studyList")
	public ModelAndView boardList(@RequestParam(value="cPage", 
	required=false, defaultValue="0") int cPage) {
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=5;
		List<Map<String,String>> list=service.selectStudyBoardList(cPage,numPerPage);
		int totalCount=service.selectStudyBoardCount();
		mv.addObject("pageBar",PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/19AM_workman_final/study/studyList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("study/studyBoardList");
		return mv;
	}
	
	  

	@RequestMapping("/study/studyrecruit")
	public ModelAndView insertBoard(@RequestParam Map<String,String> param, 			
			HttpServletRequest request){
	
		
		int result=service.insertStudyBoard(param);
		
		String msg="";
		String loc="/study/studyList";
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
	
	@RequestMapping("/study/studyApply")
	public ModelAndView ApplyStudy(int no, String logininfo){
		
		Map<String, Object> p = new HashMap();
		p.put("no",no);
		p.put("logininfo", logininfo);
		System.out.println("writer : " +logininfo);
		int result = service.ApplyStudy(p);
		
		
		String msg="";
		String loc="/study/studyList";
		if(result>0) {
			msg="신청 완료";
		}else {
			msg="신청 실패";
		}
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
		
		
		
	}
	
	@RequestMapping("/study/applyconfirm")
	public String applyconfirm() {
		return "study/applyconfirm";
	}

}
