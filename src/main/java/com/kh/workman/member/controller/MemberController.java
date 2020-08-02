package com.kh.workman.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.workman.common.PageBarFactory;
import com.kh.workman.common.api.JobGithubApi;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;
import com.kh.workman.member.model.vo.MyStudyBoard;
import com.kh.workman.member.model.vo.ApplyMeetUp;

import net.sf.json.JSONArray;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@RequestMapping("/member/login.do")
	public ModelAndView login(Member m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		String msg = "";
		String loc = "/";

		Member loginMember = service.selectLogin(m);

		if(loginMember == null)
		{
			msg = "아이디/비밀번호가 없습니다. 회원 등록 하세요";
		}else
		{
			System.out.println("로그인" + pwEncoder.matches(m.getPw(), loginMember.getPw()));

			if(m.getId().equals(loginMember.getId()) && pwEncoder.matches(m.getPw(), loginMember.getPw()))
			{
				if(session.getAttribute("loginMember") != null)
					session.removeAttribute("loginMember");
				
				msg = "로그인 성공";
				session.setAttribute("loginMember", loginMember);		
				
			}
			else
			{
				msg = "아이디 비밀버호가 틀립니다. 로그인 실패";
			}	
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;

	}

	@RequestMapping("/member/logout.do")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.invalidate();

		String msg = "로그아웃 완료";
		String loc = "/";

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/member/signUp.do")
	public String signUp() {
		return "member/signUpView";
	}

	@RequestMapping("/member/mainPage.do")
	public String mainPage() {
		return "redirect:/";
	}

	@RequestMapping("/member/register.do")
	public ModelAndView register(Member m, Model model) {
		m.setPw(pwEncoder.encode(m.getPw()));

		int result = service.insertMember(m);

		String msg = "";
		String loc = "/";

		ModelAndView mv = new ModelAndView();

		if (result > 0) {
			msg = "가입완료";
		} else {
			msg = "가입실패";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/member/setting.do")
	public ModelAndView setting(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String msg = "";
		String loc = "/";

		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("loginMember") == null) {
			msg = "로그인 후 이용 가능";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");

		} else {
			mv.setViewName("member/myPage");
		}

		return mv;
	}

	@RequestMapping("/member/updateInfoMember.do")
	public ModelAndView updateInfoMember(Member member, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "orgNames", required = false) MultipartFile[] orgNames) {
		String msg = "";
		String loc = "";
		System.out.println("dsfdsfsdf");
		System.out.println("pw" + member.getPw());

//		 //logger.debug("Original job board file name : " + orgNames[0].getOriginalFilename());
//		
//	 	/* 파일업로드 처리하기 */
//	    //1.저장경로 지정하기
		String saveDir = session.getServletContext().getRealPath("/resources/upload/member");
		File dir = new File(saveDir);

		if (!dir.exists())
			logger.debug("" + dir.mkdirs());

		for (MultipartFile f : orgNames) {
			if (!f.isEmpty()) {
				// rename file name
				String orgName = f.getOriginalFilename();
				System.out.println(orgName);
				member.setProfile(orgName);

				try {
					f.transferTo(new File(saveDir + "/" + orgName));
				} catch (Exception e) {
					e.printStackTrace(); // IllegalStateException, IOException
				}
			}
		}

		if (member.getPw().equals("")) {
			member.setPw(null);
			System.out.println("지금 널이다");
			System.out.println(member.getPw());
		} else {
			System.out.println("지금 널이 아니다");
			member.setPw(pwEncoder.encode(member.getPw()));
			System.out.println(member.getPw());
		}

		int result = service.updateInfoMember(member);
		System.out.println(result);
		if (result > 0) {
			Member loginMember = service.selectLogin(member);

			if (loginMember != null) {
				session.setAttribute("loginMember", loginMember);
				msg = "정보 변경 완료";
				loc = "/";
			} else {
				msg = "정보 변경 실패";
			}
		} else {
			msg = "정보 변경 실패";
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("/common/msg");

		return mv;
	}

	@RequestMapping("/member/privacy_policy")
	public String connectPrivacyPolicy() {
		return "common/workman_Privacy_Policy";
	}

	@RequestMapping("/member/jobMyBoardList")
	public ModelAndView jobMyBoardList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "skill", required = false) String skill,
			@RequestParam(value = "loc", required = false) String loc,
			@RequestParam(value = "page", required = false, defaultValue = "1") String page, HttpServletRequest request,
			Model model) {

		// 1. Job Listings From Database (At least 1 Member Applied for the position)
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		List<Map<String, Object>> list = service.selectPageJobMyBoardList(cPage, numPerPage, loginMember.getNickname());
		int totalCount = service.selectJobMyBoardCount(loginMember.getNickname());

		List<Map<String, Object>> studylist = service.selectStudyMyBoardList(loginMember.getNickname());
		int studyCount = service.selectMyStudyBoardCount(loginMember.getNickname());
		// 2. Additional Job Listings From Github Job API (Not inserted into DB yet!)
		// this data lists are inserted AFTER at least one Member applies for the
		// position!
		// TODO: test data(to be replaced with User Input!)
//	    skill="java";
//	    loc = "Los Angeles";
//	    page = "1";

//	    List<Map<String, Object>> newList = null;
//	    if(skill != null && loc!=null ) {
//	      newList = JobGithubApi.jobsGithubApi(skill, loc, Integer.valueOf(page));
//	    }


		mv.addObject("pageBar",
				PageBarFactory.getJobMyPageBar(totalCount, cPage, numPerPage, "/member/jobMyBoardList"));
		mv.addObject("count", totalCount);

		Gson gson = new Gson();

		for (int i = 0; i < list.size(); i++) {
			((JobBoard) list.get(i)).setBoardName("JOB");
			String str = ((JobBoard) list.get(i)).getContent().replaceAll("(\r\n|\r|\n|\n\r)", " ");
			((JobBoard) list.get(i)).setContent(str);
		}

		for (int j = 0; j < studylist.size(); j++) {
			((MyStudyBoard) studylist.get(j)).setBoardName("STUDY");
			String str = ((MyStudyBoard) studylist.get(j)).getContent().replaceAll("(\r\n|\r|\n|\n\r)", " ");
			((MyStudyBoard) studylist.get(j)).setContent(str);
		}
		


		String jsonlist = gson.toJson(list);
		String jsonStudylist = gson.toJson(studylist);
		// System.out.println(jsonlist);
		
		
		List<Map<String, Object>> list2 = service.selectApplyList(loginMember.getNickname());
		System.out.println("loginno: "+loginMember.getNickname());
		System.out.println("list2 :" +list2);
		System.out.println("studylist :" +studylist);

		mv.addObject("list2", list2);
		
		String jsonStudylist2 = gson.toJson(list2);
		

		mv.addObject("list", list);
		mv.addObject("studylist", studylist);
		model.addAttribute("jsonlist", jsonlist);
		model.addAttribute("jsonStudylist2", jsonStudylist2);
		model.addAttribute("jsonStudylist", jsonStudylist);
//	    mv.addObject("newList", newList);
		mv.setViewName("/member/jobMyBoardList");

		return mv;
	}

	 
	 @RequestMapping("/member/deleteMyBoard.do")
	 public ModelAndView deleteMyBoard(HttpServletRequest request)
	 {
		 String msg = "";
		 String loc = "/member/jobMyBoardList";
		 
		 int no = Integer.parseInt(request.getParameter("no"));
		 String boardName = request.getParameter("boardName");
		 String content = request.getParameter("content");
		 String title = request.getParameter("title");
		 int result = 0;
		 
		 if(boardName.equals("JOB"))
		 {
			 result = service.updateMyJobBoardStatus(no);
			 msg = "Job 게시판 삭제완료";
		 }else if(boardName.equals("STUDY"))
		 {
			 result = service.updateMyStudyBoardStatus(no);
			 msg = "study 게시판 삭제완료";
		 }
		 
		ModelAndView mv = new ModelAndView();
	 	mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("/common/msg");
		
		return mv;	
	 }
	 
	 @RequestMapping("/member/myBoardForm.do")
	 public ModelAndView myBoardForm(HttpServletRequest request)
	 {
		 int no = Integer.parseInt(request.getParameter("no"));
		 String boardName = request.getParameter("boardName");
		 String content = request.getParameter("content");
		 String title = request.getParameter("title");
		 String writer = request.getParameter("writer");
//		 HttpSession session = request.getSession();
//		 Member loginMember = (Member)session.getAttribute("loginMember");
		 
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("no", no);
		 mv.addObject("boardName", boardName);
		 mv.addObject("content", content);
		 mv.addObject("title", title);
		 mv.addObject("writer", writer);
		 
		 mv.setViewName("/member/myBoardForm");
		 return mv; 
	 }
	 
	 @RequestMapping("/member/myBoardFormEnd.do")
	 public ModelAndView myBoardFormEnd(HttpServletRequest request, MyStudyBoard b)
	 {
		 String msg = "";
		 String loc = "/member/jobMyBoardList";
		 //int no = Integer.parseInt(request.getParameter("no"));
		 String boardName = request.getParameter("boardName");
		 String content = request.getParameter("content");
		 String title = request.getParameter("title");
		 String writer = request.getParameter("writer");
		 
		 System.out.println("content : "  + b.getContent());
		 System.out.println("title" + title);
		 int result = 0;
		 
		 if(boardName.equals("JOB"))
		 {
			 result = service.updateMyJobBoardContent(b);
			 msg = "Job 게시판 title/content 수정 완료";
		 }else if(boardName.equals("STUDY"))
		 {
			 result = service.updateMyStudyBoardContent(b);
			 msg = "study 게시판 title/content 수정 완료";
		 }
		 
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("msg", msg);
		 mv.addObject("loc", loc);
		 mv.setViewName("/common/msg");
		 
		 return mv;
	 }
	 
	 @RequestMapping("/member/deleteMeber.do")
	 public ModelAndView deleteMember(HttpServletRequest request)
	 {
		 String msg = "";
		 String loc= "/";
		 
		 HttpSession session = request.getSession();
		 Member m = (Member)session.getAttribute("loginMember");
		 
		 int result = service.updatedeleteMember(m);
		 
		 if(result>0)
		 {
			 msg = "회원 탈퇴 완료";
		 }else
		 {
			 msg = "회원 탈퇴 실패";
		 }
		 
		 session.invalidate();
		 
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("msg", msg);
		 mv.addObject("loc", loc);
		 mv.setViewName("/common/msg");
		 
		 return mv;
		 
	 }
	 
	 @RequestMapping("/member/requestInvite.do")
	 public ModelAndView requestInvite(HttpServletRequest request)
	 {
		 String msg ="";
		 String loc ="/";
		 String id = request.getParameter("userId");
		 System.out.println(id);
		 
		 		 
		 
		 ModelAndView mv = new ModelAndView();
		 msg = "게시글 생성시 콜라보 생성을 할지, 콜라보 생성하지 않고 게시글만 작성했다면? (기능 미구현)";
		 mv.addObject("msg", msg);
		 mv.addObject("loc", loc);
		 mv.setViewName("/common/msg");
		 
		 return mv;
	 }


}
