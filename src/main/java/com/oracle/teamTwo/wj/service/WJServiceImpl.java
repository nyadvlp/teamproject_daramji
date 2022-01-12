package com.oracle.teamTwo.wj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.wj.dao.WJDao;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class WJServiceImpl implements WJService {
    @Autowired
	private WJDao wjDao;

	@Override
	public User_info selectUser(String user_id_email) {
		
		System.out.println("WJServiceImpl selectUser Method Start");
		return wjDao.selectUser(user_id_email);
	}

	@Override
	public List<Challenge> chatbotList(String user_id_email) {
		System.out.println("WJServiceImpl chatbotList Method Start");
		return wjDao.chatbotList(user_id_email);
	}

	@Override
	public List<Challenge> searchTitleList(String mainSearchName) {
		System.out.println("WJServiceImpl searchTitleList Method Start");
		return wjDao.searchTitleList(mainSearchName);
	}

	@Override
	public List<Main_category> selCategoryLc_num(int lc_num) {
		System.out.println("WJServiceImpl selCategoryLc_num Method Start");
		return wjDao.selCategoryLc_num(lc_num);
	}

	@Override
	public List<Main_category> selCategoryMc_num(Main_category category) {
		System.out.println("WJServiceImpl selCategoryMc_num Method Start");
		return wjDao.selCategoryMc_num(category);
	}

	@Override
	public Challenge getChgTimeChk(int chg_num) {
		System.out.println("WJServiceImpl getChgTimeChk Method Start");
		return wjDao.getChgTimeChk(chg_num);
	}

	

	@Override
	public Challenge category_ajax_listCount(Main_category main_category) {
		System.out.println("WJServiceImpl category_ajax_listCount Method Start");
		return wjDao.category_ajax_listCount(main_category);
	}

	@Override
	public List<Challenge> category_ajax(Map<String, Object> paramMap) {
		System.out.println("WJServiceImpl category_ajax Method Start");
		return wjDao.category_ajax(paramMap);
	}

	
}
