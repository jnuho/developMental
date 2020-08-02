package com.kh.workman.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.MyEncrypt;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@PropertySource("classpath:/properties/config.properties")
@Controller
public class MailController {
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MemberService service;
	
//	@Autowired
//	MyEncrypt en;
	
	@Value("${gmail}")
	private String gmail;
	
	@RequestMapping("/member/mailSending.do")
	public ModelAndView mailSending(HttpServletRequest request)
	{
		
		String toemail = request.getParameter("email");
		String title = "잊어 버린 비밀 번호";
		Member m = service.selectFindEmail(toemail);
		System.out.println(m);
		String requestURL = String.valueOf(request.getRequestURL()); //URL = http://localhost:9090/member/mailSending.do
		requestURL = requestURL.replaceAll(request.getRequestURI(), ""); // URI = /member/mailSending.do 를 잘라 문자 특정 문자 가져오기
		System.out.println("requestUrL : " + requestURL);  // http://localhost:9090
		// server upload request.getContextPath();
		String content ="<html><body><h3>비밀번호 새로 설정 하기</h3></br><a href='"+requestURL+"/"+request.getContextPath()+"/member/resetPassword.do?toemail="+toemail+"'"+">비밀번호 새로 설정하기-링크클릭</a></body><html>";
		
		//System.out.println("requestURL index : " + requestURL.indexOf('/'));
		//System.out.println(requestURL.replaceAll(request.getRequestURI(), ""));	
		//requestURL = requestURL.substring(0, requestURL.indexOf('/'));
		
		System.out.println("gmail" + gmail);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(gmail); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(toemail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다.
			messageHelper.setText(content,true);// 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
				
		
		ModelAndView mv = new ModelAndView();
		
		String msg ="메일을 보냇습니다. 확인하세요 ";
		String loc ="/";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv; 
	}
	
	// 이메일 보내는 뷰
	@RequestMapping("/member/sendingEmail.do")
	public String sendingEmail()
	{
		return "/member/sendingEmail";
	}
	
	@RequestMapping("/member/resetPassword.do")
	public String resetPassword()
	{
		return "/member/resetPassword";
	}
	
	@RequestMapping("/member/resetPasswordEnd.do")
	public ModelAndView resetPasswordEnd(Member m)
	{
		String msg ="";
		String loc ="/";
		System.out.println(m);

		m.setPw(pwEncoder.encode(m.getPw()));
		
		int result = service.updateMember(m);
				
		if(result > 0)
		{
			msg = "비밀번호 변경 완료";
		}
		else
		{
			msg = "비밀번호 수정 실패";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
}
