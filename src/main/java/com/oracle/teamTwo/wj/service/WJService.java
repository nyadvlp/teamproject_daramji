package com.oracle.teamTwo.wj.service;

import java.util.List;
import java.util.Map;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info; 

public interface WJService {

	User_info selectUser(String user_id_email);

	List<Challenge> chatbotList(String user_id_email);

	List<Challenge> searchTitleList(String mainSearchName);

	List<Main_category> selCategoryLc_num(int lc_num);

	List<Main_category> selCategoryMc_num(Main_category category);

	Challenge getChgTimeChk(int chg_num);

	List<Challenge> category_ajax(Map<String, Object> paramMap);

	Challenge category_ajax_listCount(Main_category main_category);

	
}
