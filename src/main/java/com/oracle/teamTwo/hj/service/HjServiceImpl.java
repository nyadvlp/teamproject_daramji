package com.oracle.teamTwo.hj.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.hj.dao.HjDao;
import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;

@Service
public class HjServiceImpl implements HjService {
	@Autowired
	private HjDao dao;

	@Override
	public int total() {
		System.out.println("==>HjServiceImpl total() Start");
		int total = dao.total();
		System.out.println("==>HjServiceImpl total() End");
		return total;
	}

	@Override
	public List<Community> listAll(Community comm) {
		System.out.println("==>HjServiceImpl listAll() Start");
		List<Community> commList = dao.listAll(comm);
		System.out.println("==>commList.size() : "+commList.size());
		System.out.println("==>HjServiceImpl listAll() End");
		return commList;
	}

	@Override
	public int insertComm(Community comm) {
		System.out.println("==>HjServiceImpl insertComm() Start");
		int result_insert_write = dao.insertComm(comm);
		System.out.println("==>result_insert_write 결과 : "+result_insert_write);
		System.out.println("==>HjServiceImpl insertComm() End");
		return result_insert_write;
	}

	@Override
	public Community findByB_num(int b_num) {
		System.out.println("==>HjServiceImpl findByB_num() Start");
		Community Com = dao.findByB_num(b_num);
		System.out.println("==>Com.getB_title() : "+Com.getB_title());
		System.out.println("==>HjServiceImpl findByB_num() End");
		return Com;
	}

	@Override
	public int totalReply(int b_num) {
		System.out.println("==>HjServiceImpl totalReply() Start");
		int replyTotal = dao.totalReply(b_num);
		System.out.println("==>HjServiceImpl totalReply() End");
		return replyTotal;
	}

	@Override
	public List<Cmu_reply> findReplyAll(int b_num) {
		System.out.println("==>HjServiceImpl findReplyAll() Start");
		List<Cmu_reply> replyList = dao.findReplyAll(b_num);
		System.out.println("==>HjServiceImpl findReplyAll() End");
		return replyList;
	}

	@Override
	public int update(int b_num) {
		System.out.println("==>HjServiceImpl update() Start");
		int update = dao.update(b_num);
		System.out.println("==>HjServiceImpl update() End");
		return update;
	}

	@Override
	public String reply_insert(Cmu_reply cmu) {
		System.out.println("==>HjServiceImpl reply_insert() Start");
		String success = dao.reply_insert(cmu);
		System.out.println("==>HjServiceImpl reply_insert() End");
		return success;
	}

	@Override
	public int deleteCmu(int b_num) {
		System.out.println("==>HjServiceImpl deleteCmu() Start");
		int result = dao.deleteCmu(b_num);
		System.out.println("==>HjServiceImpl deleteCmu() End");
		return result;
	}

	@Override
	public int updateWrite(Community comm) {
		System.out.println("==>HjServiceImpl updateWrite() Start");
		int result = dao.updateWrite(comm);
		System.out.println("==>HjServiceImpl updateWrite() End");
		return result;
	}

	@Override
	public String updateLike(int b_num) {
		System.out.println("==>HjServiceImpl updateLike() Start");
		String result = dao.updateLike(b_num);
		System.out.println("==>HjServiceImpl updateLike() End");
		return result;
	}

	@Override
	public List<Community> search(Community comm) {
		System.out.println("==>HjServiceImpl search() Start");
		List<Community> list = dao.search(comm);
		System.out.println("==>HjServiceImpl search() End");
		return list;
	}

	@Override
	public int totalSearch(Community comm) {
		System.out.println("==>HjServiceImpl totalSearch() Start");
		int total = dao.totalSearch(comm);
		System.out.println("==>HjServiceImpl totalSearch() End");
		return total;
	}

	@Override
	public int totalnav(int b_c_num) {
		System.out.println("==>HjServiceImpl totalnav() Start");
		System.out.println("==>b_c_num :"+b_c_num);
		int total = dao.totalnav(b_c_num);
		System.out.println("==>HjServiceImpl totalnav() End");
		return total;
	}

	@Override
	public List<Community> listnav(Community comm) {
		System.out.println("==>HjServiceImpl listAll() Start");
		List<Community> commList = dao.listnav(comm);
		System.out.println("==>commList.size() : "+commList.size());
		System.out.println("==>HjServiceImpl listAll() End");
		return commList;
		
	}

	@Override
	public String deleteReply(int re_no) {
		System.out.println("==>HjServiceImpl delete() Start");
		String result = dao.deleteReply(re_no);
		System.out.println("==>HjServiceImpl delete() End");
		return result;
	}

	@Override
	public String updateReply(Cmu_reply cmu) {
		System.out.println("==>HjServiceImpl delete() Start");
		String result = dao.updateReply(cmu);
		System.out.println("==>HjServiceImpl delete() End");
		return result;
	}



}
