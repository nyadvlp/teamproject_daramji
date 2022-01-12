package com.oracle.teamTwo.jy.service;

import java.util.List; 

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

public interface JyChallengeService {
	
	//챌린지 리스트
	List<Challenge> listChallenge(Challenge challenge);
	int total();
	
	//챌린지 상태 및 챌린지 값
	int chg_state(int chg_num);
	List<Challenge> chall(int chg_num);
	
	//해시태그 값
	List<Hashtag2> ht2(int chg_num);
	
	//챌린지 마스터 프사,닉네임 값
	User_info user(int chg_num);
	
	//현재 참여인원
	int totpart(int chg_num);
	
	//현재 참여인원 프사,닉네임 값
	List<User_info> userpart(int chg_num);
	
	//회원이 이 챌린지에 참여했는지 안했는지...알기위해..^^
	int checkMyState(CheckMyState cms);
	
	//등록시간,시작시간,종료시간, 인원수 체크하기(번호에 해당하는 챌린지테이블 전부 가져오기)
	Challenge timeChk(int chg_num);
	
	//포인트 리스트 가져오기
	int point(String id);
	
	//경민 소통하기
	List<ChgChatBox> showChat(int chg_num);
	int insertChat(Chg_chat chgChat);
	
	//배팅 포인트 넣기
	int insertPoint(Point point);
	
	//참가 테이블 넣기
	int insertPart(Part_challenge part_challenge);
	
	//경민 후기 리스트
	List<ChgReviewBox> showReview(int chg_num);
	
	//경민 후기 업데이트
	void updateReview(Chg_review chg_review);
	
	//인증사진 및 데이터 디비 저장
	int cpkResult(Chg_photochk cpk);
	
	// 경민 도토리바, 랜덤문구
	Part_challenge myChgBar(CheckMyState cms);
	String todayPhrase();
	

}
