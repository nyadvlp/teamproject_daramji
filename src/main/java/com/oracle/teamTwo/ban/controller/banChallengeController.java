package com.oracle.teamTwo.ban.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chat_category;
import com.oracle.teamTwo.teamtwo.model.Chg_chat_category;
import com.oracle.teamTwo.teamtwo.model.Hashtag;
import com.oracle.teamTwo.teamtwo.model.Hashtag2;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.ban.service.banChallengeService;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.pys.service.MyPageService;

@Controller
public class banChallengeController {

	@Autowired
	private banChallengeService bcs;
	
	   // teamtwo user model 끝
	   @Autowired
	   dhUserServiceImpl dus;
	   
	   @ModelAttribute("user_model")
	   public void user_model(Model model, User_info user_model, HttpServletRequest request) {
		   
		   HttpSession session = request.getSession();
		   
		   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
		   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
		   session.setAttribute("user_image", session.getAttribute("user_image"));
		   
	   } // teamtwo user model 시작
	   
	@RequestMapping(value = "makechallenge")
	public String makeChallenge(Model model, HttpServletRequest request) {
		System.out.println("Banya : banChallengeController > makeChallenge() Start");

		String user_id_email = request.getParameter("user_id_email");
		
		// user 정보 확인
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);

		// 카테고리 분류 읽어오기
		List<Main_category> category1 = bcs.readCategory1();
		model.addAttribute("category1", category1);
		return "ban/makechallenge";
	
		
	}
	
	@RequestMapping(value = "readCategory2")
	@ResponseBody
	public List<Main_category> readCategory2(String lc_num) {
		int lc_num2 = Integer.parseInt(lc_num);
		System.out.println("Banya : banChallengeController > readCategory2 lc_num2 : " + lc_num2);
		List<Main_category> category2 = bcs.readCategory2(lc_num2); 
		System.out.println("Banya : banChallengeController > readCategory2 : " + category2.size());
		return category2;
		
	}
	
	@RequestMapping(value = "readCategory3")
	@ResponseBody
	public List<Main_category> readCategory3(String lc_num, String mc_num) {
		Main_category main_category = new Main_category();
		main_category.setLc_num(Integer.parseInt(lc_num));
		main_category.setMc_num(Integer.parseInt(mc_num));
		System.out.println("Banya : banChallengeController > readCategory3 mc_num2 : " + main_category.getMc_num());
		List<Main_category> category3 = bcs.readCategory3(main_category); 
		System.out.println("Banya : banChallengeController > readCategory3 : " + category3.size());
		return category3;
		
	}

	@PostMapping(value = "confirmChal")
	public String confirmChallenge(Model model, Challenge challenge, String user_id_email, String q_cnum_1,
			String q_cnum_2, String hash1, String hash2, String hash3) {
		System.out.println("Banya : banChallengeController > confirmChallenge() Start");

		// user 정보 확인 후 담기
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);

		// model에 챌린지 객체 담기
		model.addAttribute("userchallenge", challenge);

		// 챗봇 로직 처리
		model.addAttribute("q_cnum_1", q_cnum_1);
		model.addAttribute("q_cnum_2", q_cnum_2);
		
		// 해시태그 처리 
		model.addAttribute("hash1", hash1);
		model.addAttribute("hash2", hash2);
		model.addAttribute("hash3", hash3);

		return "ban/confirmchallenge";
	}

	@PostMapping(value = "registerChal")
	public String registerChallenge(Model model, Challenge challenge, String user_id_email, String q_cnum_1,
			String q_cnum_2, String hash1, String hash2, String hash3) {
		System.out.println("Banya : banChallengeController > registerChallenge() Start");

		// user 정보 확인 후 담기
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);

		// 챌린지 테이블 update
		int result = bcs.registerChal(challenge);

		// update 성공 or 실패
		if (result > 0) {
			System.out.println("Banya : " + userinfo.getUser_nickname() + "의 챌린지 등록 성공");
			model.addAttribute("message", "챌린지가 등록되었습니다람쥐!");

		} else {
			System.out.println("Banya : " + userinfo.getUser_nickname() + "의 챌린지 등록 실패");
			model.addAttribute("message", "챌린지 등록에 실패하였습니다.");
		}

		model.addAttribute("result", result);

		// 챗봇추천 테이블 update

		Chg_chat_category answer1 = new Chg_chat_category();
		answer1.setChg_num(challenge.getChg_num());
		answer1.setQ_cnum(1);
		answer1.setA_cnum(Integer.parseInt(q_cnum_1));

		Chg_chat_category answer2 = new Chg_chat_category();
		answer2.setChg_num(challenge.getChg_num());
		answer2.setQ_cnum(2);
		answer2.setA_cnum(Integer.parseInt(q_cnum_2));

		int result_first = bcs.registerChatCate(answer1);
		int result_second = bcs.registerChatCate(answer2);

		if (result_first > 0 & result_second > 0) {
			System.out.println("Banya : " + challenge.getChg_num() + "번 챌린지의 챗봇 답변 등록 성공");

		} else {
			System.out.println("Banya : " + challenge.getChg_num() + "번 챌린지의 챗봇 답변 등록 실패");
			model.addAttribute("message", "챌린지 등록에 실패하였습니다.");
		}
		
		
		// 해시태그 업데이트 
			String hashtags[] = {hash1, hash2, hash3};
			List<Hashtag2> hashtag2 = new ArrayList<>();
			Hashtag2 hashtag2obj = new Hashtag2();
			int tagnum = -1;
			
			
			for (int i=0; i<hashtags.length; i++) {
				int tagresult = bcs.findTag(hashtags[i]);

				if (tagresult > 0) {
					// 해당 해시태그가 있음 : 몇 번인지 찾아오자 
					System.out.println("--> 해시태그 이미 존재! (" + hashtags[i] + ")");
					tagnum = bcs.findTagNum(hashtags[i]);
					
				} else if (tagresult == 0) {
					// 해당 해시태그가 없음 : 새로 만들자 
					int addtagresult = bcs.addTag(hashtags[i]);
					if (addtagresult > 0) {
						System.out.println("--> 해시태그 신규 삽입 시작! (" + hashtags[i] + ")");
					}
					tagnum = bcs.findTagNum(hashtags[i]);
					
				} else {
					// 에러 발생 
					System.out.println("Banya : 해시태그 처리 중 오류 발생");
				}
				
				hashtag2obj.setHashtag_num(tagnum);
				hashtag2obj.setHashtag_text(hashtags[i]);
				hashtag2.add(hashtag2obj);
				
			}
		

		return "ban/regiChalEnd";
	}

}
