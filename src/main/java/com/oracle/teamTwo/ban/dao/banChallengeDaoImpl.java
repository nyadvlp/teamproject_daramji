package com.oracle.teamTwo.ban.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chg_chat_category;
import com.oracle.teamTwo.teamtwo.model.Hashtag2;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Repository
public class banChallengeDaoImpl implements banChallengeDao {

	@Autowired
	private SqlSession session;

	@Override
	public User_info readUserInfo(String user_id_email) {
		User_info userinfo = new User_info();

		try {
			userinfo = session.selectOne("byReadUserInfo", user_id_email);
			System.out.println("Banya : banChallengeDaoImpl > readUserInfo() > read success ( nickname : "
					+ userinfo.getUser_nickname() + ")");
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > readUserInfo() Exception");
			System.out.println(e.getMessage());
		}
		return userinfo;
	}

	@Override
	public int registerChal(Challenge challenge) {
		int result = 0;

		try {

			result = session.insert("byregisterChal", challenge);
			System.out.println("Banya : banChallengeDaoImpl > registerChal() insert success");

		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > registerChal() Exception");
			System.out.println(e.getMessage());
		}

		return result;
	}

	@Override
	public int registerChatCate(Chg_chat_category chg_chat_category) {
		int result2 = 0;

		try {

			result2 = session.insert("byregisterChatCate", chg_chat_category);
			System.out.println("Banya : banChallengeDaoImpl > registerChatCate() insert success");

		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > registerChatCate() Exception");
			System.out.println(e.getMessage());
		}

		return result2;
	}

	@Override
	public List<Main_category> readCategory1() {
		List<Main_category> category1 = null;
		try {
			category1 = session.selectList("bycategory1");
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > readCategory1() Exception");
			System.out.println(e.getMessage());
		}
		return category1;
	}

	@Override
	public List<Main_category> readCategory2(int lc_num) {
		List<Main_category> category2 = null;
		try {
			category2 = session.selectList("bycategory2", lc_num);
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > readCategory2() Exception");
			System.out.println(e.getMessage());
		}
		return category2;
	}

	@Override
	public List<Main_category> readCategory3(Main_category main_category) {
		List<Main_category> category3 = null;
		
		try {
			category3 = session.selectList("bycategory3", main_category);
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > readCategory3() Exception");
			System.out.println(e.getMessage());
		}
		return category3;
	}

	@Override
	public int findTag(String tag) {
		int result = -1;
		
		try {
			
			System.out.println("태그 찾는 중 : " + tag);
			result = session.selectOne("byfindTag", tag);
			
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > findTag Exception");
			System.out.println(e.getMessage());
			result = -4;
		}
		
		return result;
	}

	@Override
	public int findTagNum(String tag) {
		int tagnum = -1;
		
		try {
			
			tagnum = session.selectOne("byfindTagNum", tag);
			System.out.println("--> 존재하는 태그! (태그번호 : " + tagnum + ")");
			
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > findTagNum Exception");
			System.out.println(e.getMessage());
			tagnum = -4;
		}
		
		return tagnum;
	}

	@Override
	public int addTag(int tagnum, String tag) {
		int addatgresult = -1;
		Hashtag2 hashtag2 = new Hashtag2();
		hashtag2.setHashtag_num(tagnum);
		hashtag2.setHashtag_text(tag);
		
		try {
			
			addatgresult = session.insert("byaddTag", hashtag2);
			System.out.println("--> 신규 태그! " + hashtag2.getHashtag_text() + " 태그가 추가됨");
			
		} catch (Exception e) {
			System.out.println("Banya : banChallengeDaoImpl > addTag Exception");
			System.out.println(e.getMessage());
			addatgresult = -4;
		}
		
		return addatgresult;
	}

}
