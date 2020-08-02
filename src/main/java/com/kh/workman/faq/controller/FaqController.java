package com.kh.workman.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.admin.controller.AdminNoticeController;
import com.kh.workman.admin.model.vo.Faq;
import com.kh.workman.common.PageBarFactory;
import com.kh.workman.faq.model.service.FaqService;

@Controller
public class FaqController {
	private Logger logger=LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	FaqService service;
	
	@RequestMapping("/member/faqList")
	public ModelAndView memberFaqList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, 
			Model model) {
		ModelAndView mv = new ModelAndView();
		
		int numPerPage=5;
		List<Faq> list = service.selectFaqList(cPage,numPerPage);
		
		int totalCount=service.selectFaqCount();
		
		mv.addObject("pageBar",PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/member/faqList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("/admin/faq/faqList");
		
		return mv;
	}
	
	@RequestMapping("/admin/faqList")
	public ModelAndView adminFaqList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, 
										Model model) {
		ModelAndView mv = new ModelAndView();
		
		int numPerPage=5;
		List<Faq> list = service.selectFaqList(cPage,numPerPage);
		
		int totalCount=service.selectFaqCount();
				
		mv.addObject("pageBar",PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/admin/faqList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("/admin/faq/adminFAQList");
		
		return mv;
	}
	
	@RequestMapping("/admin/insertFaq")
	public String insertFaq() {
		return "admin/faq/faqForm";
	}
	
	@RequestMapping("/admin/faqFormEnd.do")
	public ModelAndView insertFaqEnd(@RequestParam Map<String,String> param) {
		ModelAndView mv = new ModelAndView();
		
		int result = service.insertFaq(param);
		
		String msg="";
		String loc="/admin/faqList";
		
		if(result>0) {
			msg="등록완료";
		}else {
			msg="등록실패";
		}
		
		System.out.println("등록 test , param : "+param);
		System.out.println("등록 test , result : "+result);
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/admin/faqDelete")
	public String deleteFaq(@RequestParam int faqNo, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("faqNo",faqNo);
		
		int result = service.deleteFaq(map);
		
		String msg="";
		String loc="";
		
		if(result==1) {
			msg+="FAQ삭제 완료";
			loc+="/admin/faqList";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}else {
			msg+="FAQ삭제 실패";
			loc+="/admin/faqList";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		
		
		return "common/msg";
	}
	
}
