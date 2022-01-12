package com.oracle.teamTwo.hj.dao;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;

@Repository
public class HjDaoImpl implements HjDao {
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		//전체 게시물 개수 가져오기
		System.out.println("===>HjDaoImpl total() start!!!");
		int total = session.selectOne("hjtotal");
		System.out.println("===>HjDaoImpl total() End!!!");
		return total;
	}

	@Override
	public List<Community> listAll(Community comm) {
		//게시물 다 가져오기
		System.out.println("===>HjDaoImpl listAll() start!!!");
		List<Community> comList = null;
		try {
			
			comList=session.selectList("hjlistAll",comm);
			System.out.println("===>comList.size() : "+comList.size());
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl listAll() Error!!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl listAll() End!!!");
		return comList;
	}
	
	@Override
	public int totalnav(int b_c_num) {
		//카테고리 별 게시물 개수 가져오기
		System.out.println("===>HjDaoImpl totalnav() start!!!");
		int total = session.selectOne("hjtotalnav",b_c_num);
		System.out.println("===>HjDaoImpl totalnav() End!!!");
		return total;
	
	}

	@Override
	public List<Community> listnav(Community comm) {
		//카테고리 별  게시물 다 가져오기
		System.out.println("===>HjDaoImpl listnav() start!!!");
		List<Community> comList = null;
		try {
			
			comList=session.selectList("hjlistnav",comm);
			System.out.println("===>comList.size() : "+comList.size());
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl listAll() Error!!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl listnav() End!!!");
		return comList;
	
	}


	@Override
	public int insertComm(Community comm) {
		//작성한 게시물 정보 DB에 넣기
		System.out.println("===>HjDaoImpl insertComm() start!!!");
		int result_insert_write = 0;
		try {
			
			System.out.println("===>comm.getB_contents() : "+comm.getB_contents());
			System.out.println("===>comm.getB_id_email() : "+comm.getB_id_email());
			System.out.println("===>comm.getB_c_num() : "+comm.getB_c_num());
			System.out.println("===>comm.getB_title() : "+comm.getB_title());
			System.out.println("===>comm.getB_image() : "+comm.getB_image());
			
			
			result_insert_write=session.insert("hjInsert",comm);
			System.out.println("===>result_insert_write : "+result_insert_write);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl insertComm() Error!!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl insertComm() End!!!");
		return result_insert_write;
	}

	@Override
	public Community findByB_num(int b_num) {
		//게시물 정보 찾기
		System.out.println("===>HjDaoImpl findByB_num() Start!!!");
		Community Com = null;
		try {
			Com = session.selectOne("hjCom", b_num);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl findByB_num() error !!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl findByB_num() End!!!");
		return Com;
	}

	@Override
	public int totalReply(int b_num) {
		//댓글 개수 구하기
		System.out.println("===>HjDaoImpl totalReply() Start!!!");
		int result = 0;
		try {
			result = session.selectOne("hjtotalReply", b_num);
			System.out.println("===> result : "+result);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl totalReply() error !!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl totalReply() End!!!");
		return result;
	}

	@Override
	public List<Cmu_reply> findReplyAll(int b_num) {
		//댓글 정보 가져오기
		System.out.println("===>HjDaoImpl findReplyAll() Start!!!");
		List<Cmu_reply> listRe = null;
		try {
			listRe = session.selectList("hjfindRe", b_num);
			System.out.println("===>listRe.size() : "+listRe.size());
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl findReplyAll() Error!!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl findReplyAll() End!!!");
		return listRe;
	}

	@Override
	public int update(int b_num) {
		//게시글 클릭시 조회수 +1
		System.out.println("===>HjDaoImpl update() Start");
		int update = 0;
		try {
			update = session.update("hjupdateDetail", b_num);
			System.out.println("===> update : "+update);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl update() Error!!!"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl update() End");
		return 0;
	}

	@Override
	public String reply_insert(Cmu_reply cmu) {
		//아작스로 댓글 등록
		System.out.println("===>HjDaoImpl reply_insert() Start!!!");
		int result = 0;
		String success1 = null;
		try {
			result =session.insert("hjreply_insert", cmu);
			System.out.println("===>result : "+result);
			if(result == 1) {
				success1="good";
			}else {
				success1="bad";
			}
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl reply_insert() Erorr!!!"+e.getMessage());

		}
		System.out.println("===>HjDaoImpl reply_insert() End!!!");
		return success1;
	}
	@Override
	public int deleteCmu(int b_num) {
		//게시글 상태 바꾸기
		System.out.println("===>HjDaoImpl deleteCmu() Start");
		int result = 0;
		
		try {
			int result1 = session.update("hjdeleteCmu", b_num);
			int result2 = session.update("hjdeleteRep", b_num);
			int total = result1+result2;
			if(total == 2) {
				result = 1;
			}else {
				result = 0;
			}
			
		
		}catch (Exception e) {
			
			System.out.println("===>HjDaoImpl deleteCmu() error"+e.getMessage());
		
			System.out.println();
		}
		System.out.println("===>HjDaoImpl deleteCmu() End");
		return result;
	}

	@Override
	public int updateWrite(Community comm) {
		//게시글 수정시 update
		System.out.println("===>HjDaoImpl updateWrite() Start");
		int result = 0;
		try {
			result = session.update("hjupdateWrite", comm);
			System.out.println("===>result : "+ result);
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl updateWrite() error"+ e.getMessage());
		}
		System.out.println("===>HjDaoImpl updateWrite() End");
		
		return result;
	}

	@Override
	public String updateLike(int b_num) {
		System.out.println("===>HjDaoImpl updateLike() Start");
		String result = null;
		try {
			int updateLike = session.update("hjUpdateLike", b_num);
			System.out.println("===>updateLike"+updateLike);
			if(updateLike == 1) {
				//업데이트 성공 ,b_like_count 값 가져와서 객체에 넣기
				result = session.selectOne("hjSelectLike", b_num);
				System.out.println("===>result : "+result);
				
			}else {
				//업데이트 실패시... 뭐하지..??
			}
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl updateLike() Error"+e.getMessage());
		}
		System.out.println("===>HjDaoImpl updateLike() End");
		return result;
	}

	@Override
	public List<Community> search(Community comm) {
		System.out.println("===>HjDaoImpl search() Start");
		List<Community> list = null;
			System.out.println("===>comm.getSearch() : "+comm.getSearch());
			System.out.println("===>comm.getKeyword() : "+comm.getKeyword());

		
		try {
			list = session.selectList("hjSearch", comm);
			System.out.println("===>list.size() : "+list.size());
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl search() Error"+e.getMessage());
		}
	
		System.out.println("===>HjDaoImpl search() End");
		return list;
	}

	@Override
	public int totalSearch(Community comm) {
		//게시판 검색
		System.out.println("===>HjDaoImpl totalSearch() Start");
		int total = 0;
		System.out.println("===>comm.getSearch() : "+comm.getSearch());
		System.out.println("===>comm.getKeyword() : "+comm.getKeyword());

		try {
			total = session.selectOne("hjTotalSearch", comm);
			System.out.println("===>comm.getSearch() : "+comm.getSearch());
			System.out.println("===>comm.getKeyword() : "+comm.getKeyword());

			System.out.println("===>total :"+total);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl totalSearch() Error"+e.getMessage());
		}

		System.out.println("===>HjDaoImpl totalSearch() End");
		return total;
	}

	@Override
	public String deleteReply(int re_no) {
		//댓글 삭제시 댓글 상태 변화
		System.out.println("===>HjDaoImpl delete() Start");
		String result = null;
		try {
			int res = session.update("hjdeleteReply", re_no);
			System.out.println("===> deleteReply res : ");
			if(res == 1) {
				result = "good";
			}else {
				result = "bad";
			}
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl delete() Error : "+e.getMessage());
		}
		System.out.println("===>HjDaoImpl delete() End");
		
		return result;
	}

	@Override
	public String updateReply(Cmu_reply cmu) {
		// 댓글 수정 아작스
		System.out.println("===>HjDaoImpl updateReply() Start");
		String result = null;
		try {
			int res = session.update("hjupdateReply", cmu);
			if(res == 1) {
				result = "good";
			}else {
				result = "bad";
			}
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl updateReply()  Error :"+e.getMessage());
		}
		
		
		System.out.println("===>HjDaoImpl updateReply() End");

		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
