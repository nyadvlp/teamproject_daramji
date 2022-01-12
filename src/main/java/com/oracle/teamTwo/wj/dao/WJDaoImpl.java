package com.oracle.teamTwo.wj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Repository
public class WJDaoImpl implements WJDao {
    @Autowired
	private SqlSession session;

	@Override
	public User_info selectUser(String user_id_email) {
		
		
		
		return session.selectOne("wjSelectUser", user_id_email);
	}

	@Override
	public List<Challenge> chatbotList(String user_id_email) {
          List<Challenge> chatbotList = null;
		
		try {
			 chatbotList = session.selectList("ChatbotList", user_id_email); 
		}catch(Exception e) {
			System.out.println("WJDaoImpl chatbotList Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return chatbotList;
	}

	@Override
	public List<Challenge> searchTitleList(String mainSearchName) {
		 List<Challenge> searchTitleList = null;
		try {
			 searchTitleList = session.selectList("SearchTitleList", mainSearchName); 
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchTitleList Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return searchTitleList;
	}

	@Override
	public List<Main_category> selCategoryLc_num(int lc_num) {
		List<Main_category> selCategoryLc_num = null;
		try {
			 selCategoryLc_num = session.selectList("selCategory_Lc_num", lc_num);
		}catch(Exception e) {
			System.out.println("WJDaoImpl selCategoryLc_num Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return selCategoryLc_num;
	}

	@Override
	public List<Main_category> selCategoryMc_num(Main_category category) {
		List<Main_category> selCategoryMc_num = null;
		try {
			 selCategoryMc_num = session.selectList("selCategory_Mc_num", category);
		}catch(Exception e) {
			System.out.println("WJDaoImpl selCategoryLc_num Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return selCategoryMc_num;
	}

	@Override
	public Challenge getChgTimeChk(int chg_num) {
		
		Challenge getChgTimeChk = null;
		
		try {
			 getChgTimeChk = session.selectOne("Chg_numTimeChk", chg_num);
		}catch(Exception e) {
			System.out.println("WJDaoImpl getChgTimeChk Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return getChgTimeChk;
	}

	@Override
	public List<Challenge> category_ajax(Map<String, Object> paramMap) {
		
		List<Challenge> category_ajax = null;		
		try {
			 category_ajax = session.selectList("category_ajax_List", paramMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl category_ajax Method Error => " + e.getMessage());
			e.printStackTrace();
		}		
		
		return category_ajax;
	}

	@Override
	public Challenge category_ajax_listCount(Main_category main_category) {
		
		Challenge challenge = null;
		try {
			 challenge = session.selectOne("category_ajax_listCount", main_category);
		}catch(Exception e) {
			System.out.println("WJDaoImpl category_ajax_listCount Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return challenge;
	}

	
}
