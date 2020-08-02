package com.kh.workman.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.admin.model.service.AdminMemberService;
import com.kh.workman.admin.model.vo.AdminMember;
import com.kh.workman.common.PageBarFactory;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberService service;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService mService;
	@Value("${gamil}")
	private String gmail;

	@RequestMapping("/admin/adminMain")
	public String admin() {
		return "admin/adminMain";
	}

	@RequestMapping("/admin/emailToMember")
	public String sendEmail(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "admin/sendEmail";
	}

	@RequestMapping("/admin/mailSend.do")
	public ModelAndView mailSendEnd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String email = request.getParameter("email");
		String title = "Workman 알림";
		String content = request.getParameter("content");

		System.out.println("sending Email check : " + email);
		System.out.println("sending Email check : " + content);

		Member m = mService.selectFindEmail(email);
		System.out.println("이메일보내기 : " + m);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(gmail); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다.
			messageHelper.setText(content, true);// 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		String msg = "메일을 보냈습니다.";
		String loc = "/admin/adminMain";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/admin/memberSearch.do")
	public ModelAndView list(@RequestParam(required = false, defaultValue = "") String searchType,
			@RequestParam(required = false, defaultValue = "") String keyword) {
		System.out.println(searchType);
		System.out.println(keyword);

		List<AdminMember> list = service.listAll(searchType, keyword);
		ModelAndView mv = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		mv.addObject("list", list);
		mv.addObject("map", map);

		mv.setViewName("admin/adminMemberList");

		return mv;
	}

	@RequestMapping("/admin/selectMemberList.do")
	public ModelAndView selectMemberList(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			Model model) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<AdminMember> list = service.selectMemberList(cPage, numPerPage);

		int totalCount = service.selectMemberCount();

		mv.addObject("pageBar",
				PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/19AM_workman_final/admin/selectMemberList.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("admin/adminMemberList");

		return mv;
	}

	@RequestMapping("/admin/statusUpdate")
	public String statusUpdate(@RequestParam int status, @RequestParam int no, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("status", status);
		map.put("no", no);

		int num = service.statusUpdate(map);
		String msg = "";
		String loc = "";
		if (num == 1) {
			msg += "성공하였습니다.";
			loc += "selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		} else {
			msg += "실패하였습니다. 관리자 문의요망";
			loc += "selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}

		return "common/msg";
	}

	@RequestMapping("/admin/memberDelete")
	public String memberDelete(@RequestParam String id, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);

		int num = service.deleteMember(map);

		String msg = "";
		String loc = "";
		if (num == 1) {
			msg += "회원 삭제 완료";
			loc += "selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		} else {
			msg += "회원 삭제 실패";
			loc += "selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}

		return "common/msg";
	}

	@RequestMapping("/admin/memberView")
	public ModelAndView memberView(String id) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> member = service.memberView(id);

		mv.addObject("member", member);
		mv.setViewName("admin/adminMemberView");

		return mv;
	}

	@RequestMapping("/admin/memberReportUp")
	public String memberReport(int no, int reportCount, Model model) {
		ModelAndView mv = new ModelAndView();
		System.out.println("no : " + no);
		System.out.println("reportCount : " + reportCount);

		String msg = "";
		String loc = "";

		if (reportCount >= 2) {
			int result = service.memberReportEnd(no);

			if (result == 1) {
				msg += "신고카운트 누적완료, 회원이 비활성화됩니다.";
				loc += "/admin/selectMemberList.do";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
			} else {
				msg += "오류발생! 다시 시도해주세요";
				loc += "/admin/selectMemberList.do";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
			}

		} else {
			int result = service.memberReport(no);

			if (result == 1) {
				msg += "신고카운트 누적완료";
				loc += "/admin/selectMemberList.do";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
			} else {
				msg += "오류발생! 다시 시도해주세요";
				loc += "/admin/selectMemberList.do";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
			}
		}
		return "common/msg";
	}

}
