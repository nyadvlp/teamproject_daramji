package com.oracle.teamTwo.ban.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.ban.dao.banChallengeDao;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chg_chat_category;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class banChallengeServiceImpl implements banChallengeService {
	
	@Autowired
	private banChallengeDao bcd;

	@Override
	public User_info readUserInfo(String user_id_email) {
		System.out.println("Banya : banChallengeServiceImpl > readUserInfo() Start");
		User_info userinfo = bcd.readUserInfo(user_id_email);
		return userinfo;
	}

	@Override
	public int registerChal(Challenge challenge) {
		System.out.println("Banya : banChallengeServiceImpl > registerChal() Start");
		int result = bcd.registerChal(challenge);
		
		return result;
	}

	@Override
	public int registerChatCate(Chg_chat_category chg_chat_category) {
		System.out.println("Banya : banChallengeServiceImpl > registerChatCate() Start");
		int result2 = bcd.registerChatCate(chg_chat_category);
		
		return result2;
	}

	@Override
	public List<Main_category> readCategory1() {
		List<Main_category> category = bcd.readCategory1();
		return category;
	}

	@Override
	public List<Main_category> readCategory2(int lc_num) {
		List<Main_category> category = bcd.readCategory2(lc_num);
		return category;
	}

	@Override
	public List<Main_category> readCategory3(Main_category main_category) {
		List<Main_category> category = bcd.readCategory3(main_category);
		return category;
	}

	@Override
	public int findTag(String tag) {
		int result = bcd.findTag(tag);
		return result;
	}

	@Override
	public int findTagNum(String tag) {
		int tagnum = bcd.findTagNum(tag);
		return tagnum;
	}

	@Override
	public int addTag(String tag) {
		int tagnum = -1;
		int addtagresult = bcd.addTag(tagnum, tag);
		return addtagresult;
	}



}
