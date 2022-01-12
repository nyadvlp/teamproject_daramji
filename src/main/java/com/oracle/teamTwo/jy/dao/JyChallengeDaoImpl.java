package com.oracle.teamTwo.jy.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chg_chat;
import com.oracle.teamTwo.teamtwo.model.Chg_photochk;
import com.oracle.teamTwo.teamtwo.model.Chg_review;
import com.oracle.teamTwo.jy.model.CheckMyState;
import com.oracle.teamTwo.jy.model.ChgChatBox;
import com.oracle.teamTwo.jy.model.ChgReviewBox;
import com.oracle.teamTwo.teamtwo.model.Hashtag2;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.Random_phrase;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Repository
public class JyChallengeDaoImpl implements JyChallengeDao {
	
	@Autowired //Mybatis를 연결해주는 세션
	private SqlSession session;

	@Override
	public List<Challenge> listChallenge(Challenge challenge) {
		List<Challenge> listChallenge = null;
		
		try {
			listChallenge = session.selectList("jylistAll", challenge);
			
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl listChallenge e.getMessage()-->"+e.getMessage());
		}
		System.out.println("JyChallengeDaoImpl listChallenge listChallenge.size()-->"+listChallenge.size());
		return listChallenge;
	}

	@Override
	public int total() {
		int totCnt = session.selectOne("jytotCnt");
		System.out.println("JyChallengeDaoImpl totCnt-->"+totCnt);
		return totCnt;
	}

	@Override
	public int chg_state(int chg_num) {
		System.out.println("JyChallengeDaoImpl chg_state Start...-->"+chg_num);
		int chg_state = session.selectOne("jychg_state", chg_num);
		System.out.println("JyChallengeDaoImpl chg_state-->"+chg_state);
		return chg_state;
	}

	@Override
	public List<Challenge> chall(int chg_num) {
		List<Challenge> chall = null;
		
		try {
			chall = session.selectList("jychall", chg_num);
			System.out.println("JyChallengeDaoImpl chall...");
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl chall e.getMessage()-->"+e.getMessage());
		}
		return chall;
	}

	@Override
	public List<Hashtag2> ht2(int chg_num) {
		List<Hashtag2> ht2 = null;
		
		try {
			ht2 = session.selectList("jyht2", chg_num);
			System.out.println("JyChallengeDaoImpl jyht2...");
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl jyht2 e.getMessage()-->"+e.getMessage());
		}
		return ht2;
	}

	@Override
	public User_info user(int chg_num) {
		User_info user = null;
		
		try {
			user = session.selectOne("jyuser", chg_num);
			System.out.println("JyChallengeDaoImpl user.getUser_image()-->"+user.getUser_image());
			System.out.println("JyChallengeDaoImpl user.getUser_nickname()-->"+user.getUser_nickname());
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl user e.getMessage()-->"+e.getMessage());
		}
		return user;
	}

	@Override
	public int totpart(int chg_num) {
		int totpart = 0;
		
		try {
			totpart = session.selectOne("jytotpart", chg_num);
			System.out.println("JyChallengeDaoImpl totpart...");
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl totpart e.getMessage()-->"+e.getMessage());
		}
		return totpart;
	}

	@Override
	public List<User_info> userpart(int chg_num) {
		List<User_info> userpart = null;
		
		try {
			userpart = session.selectList("jyuserpart", chg_num);
			System.out.println("JyChallengeDaoImpl userpart...");
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl userpart e.getMessage()-->"+e.getMessage());
		}
		return userpart;
	}

	@Override
	public int checkMyState(CheckMyState cms) {
		int checkMyState = 0;
		
		try {
			checkMyState = session.selectOne("jyCheckState",cms);
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl checkMyState e.getMessage()-->"+e.getMessage());
		}
		return checkMyState;
	}

	@Override
	public Challenge timeChk(int chg_num) {
		Challenge chg = null;
		
		try {
			chg = session.selectOne("jyTimeChk", chg_num);
			System.out.println("chg__"+chg);
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl timeChk e.getMessage()-->"+e.getMessage());
		}
		return chg;
	}

	@Override
	public int point(String id) {
		int point = 0;
		
		try {
			point = session.selectOne("jyPoint", id);
			System.out.println("point-->"+point);
			
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl point e.getMessage()-->"+e.getMessage());
		}
		return point;
	}

	@Override
	public List<ChgChatBox> showChat(int chg_num) {
		List<ChgChatBox> chgChatBox = null;
		System.out.println("chg_num-->"+chg_num);
	      try {
	         //                           mapper ID   ,   Parameter
	         chgChatBox = session.selectList("kmchgChatShow", chg_num);
	         System.out.println("ChgChatDaoImpl showChat");
	         System.out.println("challChatBoxSize-->"+chgChatBox.size());
	      } catch (Exception e) {
	         System.out.println("ChgChatDaoImpl showChat e.getMessage()"+e.getMessage());
	      }
	      
	      return chgChatBox;
	}

	@Override
	public int insertChat(Chg_chat chgChat) {
		int chk = 0;
		try {
			chk = session.insert("kmchgChatInsert",chgChat);
		}catch(Exception e) {
			System.out.println("ChgChatDaoImpl insertChat e.getMessage()"+e.getMessage());
		}
		return chk;
	}

	@Override
	public int insertPoint(Point point) {
		 int resultPoint = 0;
		 
		 try {
			 resultPoint = session.insert("jyinsertPoint", point);
		} catch (Exception e) {
			System.out.println("ChgChatDaoImpl insertPoint e.getMessage()"+e.getMessage());
		}
		return resultPoint;
	}

	@Override
	public int insertPart(Part_challenge part_challenge) {
		int resultPart = 0;
		
		try {
			resultPart = session.insert("jyinsertPart", part_challenge);
			System.out.println("part_challenge.getChg_days()-->"+part_challenge.getChg_days());   
		} catch (Exception e) {
			System.out.println("ChgChatDaoImpl insertPart e.getMessage()"+e.getMessage());
		}
		return resultPart;
	}

	@Override
	public List<ChgReviewBox> showReview(int chg_num) {
		List<ChgReviewBox> chgReviewBox = null;
		try {
			chgReviewBox = session.selectList("kmchgReviewShow", chg_num);
		} catch (Exception e) {
			System.out.println("DAO showReview error" + e.getMessage());
		}

		return chgReviewBox;
	}

	@Override
	   public void updateReview(Chg_review chg_review) {

	    session.insert("kmReviewUpdate", chg_review);
	      
	   }

	@Override
	public int cpkResult(Chg_photochk cpk) {
		int cpkResult = 0;
		
		try {
			System.out.println("jjjjjjDao cpk.getChg_num()--->"+cpk.getChg_num());
			System.out.println("jjjjjjDao cpk.getParti_id_email()--->"+cpk.getParti_id_email());
			System.out.println("jjjjjjDao cpk.getConfirm_image()--->"+cpk.getConfirm_image());
			cpkResult = session.selectOne("jyChg_photochk", cpk);
			System.out.println("JyChallengeDaoImpl cpkResult-->"+cpkResult);
			
		} catch (Exception e) {
			System.out.println("JyChallengeDaoImpl cpkResult e.getMessage()-->"+e.getMessage());
		}
		
		return cpkResult;
	}
	
	 @Override
	   public Part_challenge myChgBar(CheckMyState cms) {
	      Part_challenge pc = null;
	      int chkBar = 0;
	      try {
	         chkBar = session.selectOne("kmChkBar",cms);
	         if(chkBar != 0) {
	            pc = session.selectOne("kmMyChgBar",cms);
	         }
	         
	      } catch (Exception e) {
	         System.out.println("DAO myChgBar error" + e.getMessage());
	      }
	      
	      return pc;
	      }

		@Override
		public String todayPhrase() {
			int num = 0;
			int chkPhrase = 0;
			int maxNum = 0;
			Date today = null;
			Random_phrase rp = new Random_phrase();
			String today_phrase = null;
			/* 현재 날짜 sql.date로 형변환 */
			LocalDate todayTest = LocalDate.now();
			Date realToday = Date.valueOf(todayTest);

			try {
				rp = session.selectOne("kmSelectTodayRecord");
				today = rp.getToday_record();
				/* sql.date 를 String 을 변환해서 비교 */
				SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
				String realToday1 = fmt.format(realToday);
				String today1 = fmt.format(today);

				if (realToday1.equals(today1)) {
					today_phrase = session.selectOne("kmSelectPhrase", num);

				} else {
					maxNum = session.selectOne("kmSelectMaxNum");
					num = session.selectOne("kmRandomNum", maxNum);
					today_phrase = session.selectOne("kmSelectPhrase", num);
					chkPhrase = session.update("kmUpdatePhrase", today_phrase);
				}

			} catch (Exception e) {
				System.out.println("DAO todayPhrase error" + e.getMessage());
			}
			return today_phrase;
		}
}
