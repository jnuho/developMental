package com.kh.workman.collabo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboComment;
import com.kh.workman.collabo.model.vo.CollaboCommentReply;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class CollaboController {

	private Logger logger = LoggerFactory.getLogger(CollaboController.class);

	@Autowired
	CollaboService service;

	@RequestMapping("/collabo/main.do")
	public ModelAndView connectCollaboMain(ModelAndView mv) {
		mv.setViewName("collabo/main");
		return mv;
	}
//	  @RequestMapping("/collabo/main.do") public ModelAndView
//	  connectCollaboMain(ModelAndView mv) { mv.setViewName("collabo/main"); return
//	  mv; }

	@Autowired
	MemberService memberService;

	@Autowired
	JavaMailSender mailSender;

	@Value("${gmail}")
	private String gmail;

	@RequestMapping("/collabo/detail.do")
	public ModelAndView connectCollaboDetail(@RequestParam("collaboNo") int collaboNo) {
		CollaboTool collabo = service.selectCollaboTool(collaboNo);
		List<CollaboList> collaboLists = service.selectCollaboLists(collaboNo);
		List<CollaboCard> collaboCards = service.selectCollaboCards(collaboNo);
		List<Member> collaboMembers = service.selectCollaboMembers(collaboNo);
		List<Member> temp = memberService.selectAllMember();

		ModelAndView mav = new ModelAndView();
		mav.addObject("collaboNo", collaboNo);
		mav.addObject("members", toJson(temp));
		mav.addObject("collaboMembers", toJson(collaboMembers));
		mav.addObject("collaboLists", collaboLists);
		mav.addObject("collaboCards", collaboCards);
		mav.addObject("collaboTool", collabo);
		mav.setViewName("collabo/detail");
		return mav;
	}

	@RequestMapping("/collabo/main")
	public ModelAndView connectCollaboMain(@RequestParam("userId") String userId) {

		List<CollaboTool> collaboTools = service.selectCollaboTools(userId);
		List<Map<String, String>> collaboMemberList = service.selectCollaboMemberList(userId);
 
		ModelAndView mav = new ModelAndView();
		mav.addObject("collaboMemberList", collaboMemberList);
		mav.addObject("collaboTools", collaboTools);
		mav.setViewName("collabo/collaboMain");
		return mav;
	}

	@RequestMapping("/collabo/createCollabo")
	public ModelAndView createCollabo(@RequestParam("title") String title, @RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		if (userId != null && title != null) {
			Map<String, Object> temp = new HashMap<String, Object>();
			temp.put("userId", userId);
			temp.put("title", title);
			boolean isSuccess = service.createCollaboTool(temp) == 1 ? true : false;
			boolean isMemberSuccess = service.insertCollaboMember(temp) == 1 ? true : false;
			mav.setViewName("common/msg");
			if (isSuccess && isMemberSuccess) {
				mav.addObject("msg", "생성에 성공했습니다.");
				mav.addObject("loc", "/collabo/main?userId=" + userId);
			} else {
				mav.addObject("msg", "생성에 실패했습니다.");
				mav.addObject("loc", "/collabo/main?userId=" + userId);
			}
		}
		return mav;
	}

	@RequestMapping("/collabo/inviteMember")
	@ResponseBody
	public String inviteMember(HttpServletRequest request, @RequestParam("userId") String userId,
			@RequestParam("collaboNo") int collaboNo) throws MessagingException {

		String isSend = "false";
		Member owner = service.selectCollaboOwner(collaboNo);
		List<Member> members = service.selectCollaboMembers(collaboNo);
		Member target = new Member();
		target.setId(userId);
		target = memberService.selectLogin(target);

		boolean isPossible = true;

		for (int i = 0; i < members.size(); i++) {
			if (members.get(i).getId().equals(userId)) {
				isPossible = false;
				break;
			}
		}

		if (!owner.getId().equals(userId) && isPossible) {
			CollaboTool collabo = service.selectCollaboTool(collaboNo);

			String requestURL = String.valueOf(request.getRequestURL());
			requestURL = requestURL.replaceAll(request.getRequestURI(), "");
			String content = "<html><body><h3>" + owner.getNickname() + "님이 " + collabo.getTitle()
					+ "팀워크로 초대하셨습니다. </h3></br><a href='" + requestURL + "/" + request.getContextPath()
					+ "/collabo/responseInviteMember?userId=" + userId + "&collaboNo=" + collaboNo + "'"
					+ ">입장-링크클릭</a></body></html>";

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper mmh = new MimeMessageHelper(message, true, "UTF-8");

			mmh.setSubject(owner.getNickname() + "님이 " + collabo.getTitle() + "팀워크로 초대하셨습니다.");
			mmh.setFrom(gmail);
			mmh.setText(content, true);
			mmh.setTo(target.getEmail());

			mailSender.send(message);
			isSend = "true";
		}

		return isSend;
	}

	@RequestMapping("/collabo/responseInviteMember")
	public ModelAndView responseInviteMember(@RequestParam("userId") String userId,
			@RequestParam("collaboNo") int collaboNo) {
		Map<String, Object> temp = new HashMap<String, Object>();

		temp.put("userId", userId);
		temp.put("collaboNo", collaboNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/msg");
		boolean isComplete = service.insertCollaboMember(temp) == 1 ? true : false;
		if (isComplete) {
			mav.addObject("msg", "수락하셨습니다.");
			mav.addObject("loc", "/");
		} else {
			mav.addObject("msg", "문제가 발생하였습니다 고객센터에 문의하세요!");
			mav.addObject("loc", "/");
		}
		return mav;
	}

	@RequestMapping("/collabo/expulsionMember")
	@ResponseBody
	public String expulsionMember(@RequestParam HashMap<String, Object> receiveData) {
		String isComplete = service.expulsionMember(receiveData) == 1 ? "true" : "false";
		return isComplete;
	}

	@RequestMapping("/collabo/exitCollabo")
	public String exitCollabo(@RequestParam HashMap<String, Object> receiveData) {
		CollaboTool collabo = service.selectCollaboTool((int) receiveData.get("collaboNo"));
		String isComplete = "false";
		if (collabo.getOwner() == (int) receiveData.get("userId")) {
			List<Member> collaboMembers = service.selectCollaboMembers((int) receiveData.get("collaboNo"));
			for (int i = 0; i < collaboMembers.size(); i++) {
				if (collaboMembers.get(i).getNo() == (int) receiveData.get("userId")) {
					collaboMembers.remove(i);
					break;
				}
			}
			int ranNo = (int) (Math.random() + 1) * collaboMembers.size();
			receiveData.put("target", collaboMembers.get(ranNo).getNo());
			isComplete = service.updateCollaboOwner(receiveData) == 1 ? "true" : "false";
			isComplete = service.exitCollabo(receiveData) == 1 ? "true" : "false";
			if (Boolean.getBoolean(isComplete)) {
				// Alram Mail Send
			}

		} else {
			isComplete = service.exitCollabo(receiveData) == 1 ? "true" : "false";
		}
		return isComplete;
	}

	@RequestMapping("/collabo/requestCommentData")
	@ResponseBody
	public Map<String, List> requestCommentData(@RequestParam("cardNo") int cardNo) {

		List<CollaboComment> comments = service.requestCommentData(cardNo);
		List<CollaboCommentReply> commentReply = service.requestCommentReply(cardNo);
		Map<String, List> data = new HashMap<String, List>();
		logger.debug("comments : " + comments);
		data.put("comments", comments);
		data.put("commentReply", commentReply);

		return data;
	}

	private HashMap<String, Object> parsingJson(String receiveMessage) {
		Gson gson = new GsonBuilder().create();
		HashMap<String, Object> temp = gson.fromJson(receiveMessage, HashMap.class);
		return temp;
	}

	private String toJson(Object obj) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(obj);
	}
}
