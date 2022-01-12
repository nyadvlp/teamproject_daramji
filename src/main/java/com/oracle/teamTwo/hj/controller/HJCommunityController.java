package com.oracle.teamTwo.hj.controller; 


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.hj.service.HjService;
import com.oracle.teamTwo.hj.service.Paging;
import com.oracle.teamTwo.pys.service.MyPageService;

@Controller
public class HJCommunityController {
	@Autowired
	private HjService service;
	
	   // teamtwo user model 끝
   @Autowired
   dhUserServiceImpl dus;
   
   @ModelAttribute("user_model")
   public void user_model(Model model, User_info user_model, HttpServletRequest request) {
	   
	   HttpSession session = request.getSession();
	   
	   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
	   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
	   session.setAttribute("user_image", session.getAttribute("user_image"));
	   
   } // teamtwo user model 시작

   @RequestMapping(value = "community")
	public String community(Community comm, Model model, String currentPage, String b_c_num,  HttpServletRequest request) {
		System.out.println("=>HJCommunityController community Start");
		System.out.println("=>currentPage : "+currentPage);
		System.out.println("=>b_c_num : "+b_c_num);
		//currentPage,b_c_num 를 String 으로 받은 이유 => null값 처리 됨 int는 안됨
		List<Community> commList = null;
		int total = 0;
		Paging page = null;
		if(b_c_num != null) {
			//카테고리가 자유게시판
			comm.setB_c_num(Integer.parseInt(b_c_num));
			//페이징작업을 위한 게시물 전체 개수 가져오기
			total = service.totalnav(Integer.parseInt(b_c_num));
			System.out.println("total 개수=>"+total);
			page = new Paging(total, currentPage);
			comm.setStart(page.getStart());
			comm.setEnd(page.getEnd());
			System.out.println("=>page.getStart()"+page.getStart());
			System.out.println("=>page.getEnd()"+page.getEnd());
			//카테고리별 리스트 가져오기
			commList = service.listnav(comm);
			
		}else {
			//전체 게시판
			total = service.total();
			//페이징작업을 위한 게시물 전체 개수 가져오기
			System.out.println("total 개수=>"+total);
			page = new Paging(total, currentPage);
			comm.setStart(page.getStart());
			comm.setEnd(page.getEnd());
			//전체 리스트 가져오기
			commList = service.listAll(comm);
		}

		
		model.addAttribute("page", page);
		model.addAttribute("total", total);
		model.addAttribute("commList", commList);
		model.addAttribute("b_c_num", b_c_num);
		System.out.println("=>HJCommunityController community End");
		return "hj/community";
	}
	   

	@RequestMapping(value = "writeForm")
	public String writeForm(Model model,HttpServletRequest request) {
		System.out.println("=>HJCommunityController writeForm Start");
		
		System.out.println("=>HJCommunityController writeForm End");
		return "hj/writeFrom";
	}
	
	@PostMapping(value = "write_insert")
	public String write_insert(Community comm,Model model,HttpServletRequest request,MultipartFile file) throws IOException, Exception {
		System.out.println("=>HJCommunityController write_insert Start");
		//임시로 아이디 사용, 아이디를 받아오는 메소드 필요
		//user_id_email
		comm.setB_id_email(request.getParameter("user_id_email"));
		comm.setB_nickname(request.getParameter("user_nickname"));
		
		//입력된 값 가져와서 객체에 넣기
		comm.setB_c_num(Integer.parseInt(request.getParameter("b_c_num")));
		comm.setB_title(request.getParameter("title"));
		comm.setB_contents(request.getParameter("content"));
		//이미지 작업
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/cmuIMG");
		//받아온 file 정보
		String saveName = null;
		if(file.getSize() == 0 ) {
			comm.setB_image("");//받아온 이미지가 없다면
			
		}else {
		
			System.out.println("=>uploadPath : "+uploadPath);
			System.out.println("=>받아온 file 정보");
			System.out.println("=>file.getOriginalFilename() : "+file.getOriginalFilename());
			System.out.println("=>file.getSize() : "+file.getSize());
			System.out.println("=>file.getContentType() : "+file.getContentType());
			//저장할 파일 이름
			saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			System.out.println("=>saveName : "+saveName);
			comm.setB_image(saveName);
		}	
		//글쓰기 이후 insert
		int result_insert_write = service.insertComm(comm);
		model.addAttribute("saveName", saveName);
		model.addAttribute("file", file);
		
		System.out.println("=>HJCommunityController write_insert End");
		return "redirect:community";
	}
	

	private String uploadFile(String originalName, byte[] fileData , String uploadPath) throws Exception {
		System.out.println("=>HJCommunityController uploadFile() Start ");
		//UUID 유일한 식별자 생성
		//UUIDrk 사용된 이유 : 업로드된 파일명의 중복을 방지하게 위해 파일명을 변경할 때 사용
		UUID uid = UUID.randomUUID();
		//randomUUID() 메소드로 유일한 식별자 생성
		System.out.println("=>uploadPath : "+uploadPath);
		//Directory 생성
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			//fileDirectory(서버에 저장할 폴더)가 존재하지 않으면,
			fileDirectory.mkdirs();
			System.out.println("=>업로드용 폴더 생성 : "+uploadPath);
		}
		//uid.toString() 반환되는 객체가 UUID 객체이므로 문자열 표현을 얻기 위해 toString()사용
		String saveName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(fileData, target);
		
		System.out.println("=>HJCommunityController uploadFile() End ");
		return saveName;
	}
	
	@GetMapping(value = "cmu_detail")
	public String cmu_detail(int b_num, Model model, HttpServletRequest request) {
		
		System.out.println("=>HJCommunityController cmu_detail Start");
		//글상세보기로 이동
		Community com = service.findByB_num(b_num);
		//조회수업데이트
		int update = service.update(b_num);
		System.out.println("=>com b_img : "+com.getB_image());
		//댓글  개수 가져오기
		int replyTotal = service.totalReply(b_num);
		//댓글 정보 가져오기
		List<Cmu_reply> replyList = service.findReplyAll(b_num);
		//임시 유저 정보 가져오기
		User_info user_info = new User_info();
		user_info.setUser_id_email("conando@naver.com");
		
		model.addAttribute("user_info", user_info);
		model.addAttribute("com", com);
		model.addAttribute("replyTotal", replyTotal);
		model.addAttribute("replyList", replyList);
		System.out.println("=>HJCommunityController cmu_detail End");
		return "hj/cmu_detail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "reply_insert", produces = "application/text;charset=UTF-8")
	public String reply_insert(Model model,HttpServletRequest request,Cmu_reply cmu) {
		//댓글 등록시 아작스
		System.out.println("=>HJCommunityController reply_insert Start ");
		//객체로 이동
		cmu.setB_num(Integer.parseInt(request.getParameter("b_num")));
		System.out.println("확인1");
		cmu.setRe_contents(request.getParameter("reply"));
		System.out.println("확인2");
		//회원정보
		System.out.println("확인5");
		cmu.setRe_writer(request.getParameter("user_id_email"));
		System.out.println("확인6");
//댓글도 페이징 처리..??		
//		Paging page = new Paging(total, currentPage);
//		comm.setStart(page.getStart());
//		comm.setEnd(page.getEnd());

		System.out.println("=>b_num : "+Integer.parseInt(request.getParameter("b_num")));
		String success1=service.reply_insert(cmu);
		System.out.println("=>success : "+success1);
		System.out.println("=>HJCommunityController reply_insert End ");
		return success1;
	}
	
	@GetMapping(value = "delete")
	public String delete(int b_num, Model model) {
		//삭제버튼 누르면 게시글 상태만 변경하기, 삭제시 커뮤니티 페이지로 이동
		System.out.println("=>HJCommunityController delete Start ");
		int result_delete = service.deleteCmu(b_num);
		
		System.out.println("=>HJCommunityController delete End");
		return "redirect:community";
	}

	@GetMapping(value = "update")
	public String update(int b_num,Model model ) {
		//게시글 수정 수정하러 가기
		System.out.println("=>HJCommunityController update Start ");
		//이전 데이터 가져와서 수정 페이지에 넣어주기
		Community comm = service.findByB_num(b_num);
		model.addAttribute("com", comm);
		System.out.println("=>HJCommunityController update End ");
		return "hj/updateForm";
	}
	
	@PostMapping(value = "write_update")
	public String write_update(	String originalName,int b_num,Community comm,HttpServletRequest request,MultipartFile file, Model model) throws IOException, Exception {
		//게시글 수정시 업데이트
		System.out.println("=>HJCommunityController write_update Start ");
		comm.setB_num(b_num);
		comm.setB_title(request.getParameter("title"));
		comm.setB_contents(request.getParameter("content"));
		System.out.println("=>b_num :"+b_num);
		//이미지 작업
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/cmuIMG");
		//받아온 file 정보
		String saveName = null;
		
		System.out.println("=>file : "+file);
		System.out.println("=>file.getOriginalFilename() : "+file.getOriginalFilename());
		System.out.println("=>file.getSize() : "+file.getSize());
		if(file.getSize() == 0 ) {
			comm.setB_image("");//받아온 이미지가 없다면
			
		}else {
		
			System.out.println("=>uploadPath : "+uploadPath);
			System.out.println("=>받아온 file 정보");
			System.out.println("=>file.getOriginalFilename() : "+file.getOriginalFilename());
			System.out.println("=>file.getSize() : "+file.getSize());
			System.out.println("=>file.getContentType() : "+file.getContentType());
			//저장할 파일 이름
			saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			System.out.println("=>saveName : "+saveName);
			comm.setB_image(saveName);
		}	

		int result = service.updateWrite(comm);
		model.addAttribute("saveName", saveName);
		model.addAttribute("file", file);
		System.out.println("=>HJCommunityController write_update End ");
		return "redirect:community";
	}
	
	@ResponseBody
	@RequestMapping(value = "updateLike")
	public String updateLike(int b_num) {
		//게시글 좋아요 수 +1
		System.out.println("=>HJCommunityController updateLike Start ");
		String result  = service.updateLike(b_num);
		System.out.println("=>HJCommunityController updateLike End ");
		return result;
	}
	
	@PostMapping(value = "search")
	public String search(Community comm, Model model, String currentPage,
			@RequestParam(defaultValue = "b_title") String search_option,
			@RequestParam(defaultValue = "") String keyword 
			
			) {
		System.out.println("=>HJCommunityController search Start ");
		System.out.println("=>search_option : "+search_option);
		System.out.println("=>keyword : "+keyword);
		System.out.println("=>currentPage : "+currentPage);
		
		comm.setSearch(search_option);
		comm.setKeyword(keyword);

		//페이징작업을 위한 게시물 전체 개수 가져오기
		int total = service.totalSearch(comm);
		System.out.println("=>total 개수=>"+total);
		Paging page = new Paging(total, currentPage);
		comm.setStart(page.getStart());
		comm.setEnd(page.getEnd());
		System.out.println("=>page.getStart()"+page.getStart());
		System.out.println("=>page.getEnd()"+page.getEnd());
		//검색
		List<Community> commList = service.search(comm);
		model.addAttribute("page", page);
		model.addAttribute("total", total);
		model.addAttribute("commList", commList);
		System.out.println("=>HJCommunityController search End ");
		return "hj/community";
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteReply")
	public String deleteReply(int re_no) {
		//댓글 삭제 (=댓글 상태 -1로)
		System.out.println("=>HJCommunityController deleteReply Start ");
		String result = service.deleteReply(re_no);
		System.out.println("=>deleteReply result : "+result);
		System.out.println("=>HJCommunityController deleteReply End ");
		
		return "result";
	}
	
	@ResponseBody
	@RequestMapping(value = "Reply_update")
	public String Reply_update(int re_no, String contents) {
		//댓글 수정
		System.out.println("=>HJCommunityController Reply_update Start ");
		Cmu_reply cmu = new Cmu_reply();
		cmu.setRe_no(re_no);
		cmu.setRe_contents(contents);
		String result = service.updateReply(cmu);
		System.out.println("=>HJCommunityController Reply_update End ");
		return result;
	}
	
	
	
	
	
}
