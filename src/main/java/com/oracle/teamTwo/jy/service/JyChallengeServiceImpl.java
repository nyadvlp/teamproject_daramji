package com.oracle.teamTwo.jy.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.jy.dao.JyChallengeDao;
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
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class JyChallengeServiceImpl implements JyChallengeService {
	
	@Autowired
	private JyChallengeDao jcd;
	
	@Override
	public List<Challenge> listChallenge(Challenge challenge) {
		System.out.println("JyChallengeServiceImpl listChallenge Start...");
		List<Challenge> listChallenge = null;
		listChallenge = jcd.listChallenge(challenge);
		return listChallenge;
	}
	
	@Override
	public int total() {
		int totCnt = jcd.total();
		System.out.println("JyChallengeServiceImpl totCnt-->"+totCnt);
		return totCnt;
	}

	@Override
	public int chg_state(int chg_num) {
		System.out.println("JyChallengeServiceImpl chg_state Start...-->"+chg_num);
		int chg_state = jcd.chg_state(chg_num);
		System.out.println("JyChallengeServiceImpl chg_state-->"+chg_state);
		return chg_state;
	}

	@Override
	public List<Challenge> chall(int chg_num) {
		System.out.println("JyChallengeServiceImpl chall Start...");
		List<Challenge> chall = jcd.chall(chg_num);
		return chall;
	}

	@Override
	public List<Hashtag2> ht2(int chg_num) {
		System.out.println("JyChallengeServiceImpl ht2 Start...");
		List<Hashtag2> ht2 = jcd.ht2(chg_num);
		return ht2;
	}

	@Override
	public User_info user(int chg_num) {
		System.out.println("JyChallengeServiceImpl user Start...");
		User_info user = jcd.user(chg_num);
		return user;
	}

	@Override
	public int totpart(int chg_num) {
		System.out.println("JyChallengeServiceImpl totpart Start...");
		int totpart = jcd.totpart(chg_num);
		return totpart;
	}

	@Override
	public List<User_info> userpart(int chg_num) {
		System.out.println("JyChallengeServiceImpl userpart Start...");
		List<User_info> userpart = jcd.userpart(chg_num);
		return userpart;
	}

	@Override
	public int checkMyState(CheckMyState cms) {
		int myChgState = jcd.checkMyState(cms);
		return myChgState;
	}

	@Override
	public Challenge timeChk(int chg_num) {
		Challenge chg = jcd.timeChk(chg_num);
		System.out.println("JyChallengeServiceImpl timeChk Start...");
		return chg;
	}

	@Override
	public int point(String id) {
		int point = jcd.point(id);
		System.out.println("JyChallengeServiceImpl point Start...");
		return point;
	}

	@Override
	public List<ChgChatBox> showChat(int chg_num) {
		List<ChgChatBox> chgChatBox = jcd.showChat(chg_num); 
		return chgChatBox;
	}

	@Override
	public int insertChat(Chg_chat chgChat) {
		
		return jcd.insertChat(chgChat);
	}

	@Override
	public int insertPoint(Point point) {
		int result = jcd.insertPoint(point);
		return result;
	}

	@Override
	public int insertPart(Part_challenge part_challenge) {
		int resultPart = jcd.insertPart(part_challenge);
		return resultPart;
	}

	@Override
	public List<ChgReviewBox> showReview(int chg_num) {
		
		return jcd.showReview(chg_num);
	}

	@Override
	public void updateReview(Chg_review chg_review) {
		jcd.updateReview(chg_review);
		
	}

	@Override
	public int cpkResult(Chg_photochk cpk) {
		int cpkResult = jcd.cpkResult(cpk);
		return cpkResult;
	}

	@Override
	public Part_challenge myChgBar(CheckMyState cms) {

		return jcd.myChgBar(cms);
	}

	@Override
	public String todayPhrase() {
		// TODO Auto-generated method stub
		return jcd.todayPhrase();
	}



}
