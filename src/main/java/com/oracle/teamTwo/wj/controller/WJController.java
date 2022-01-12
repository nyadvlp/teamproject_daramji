package com.oracle.teamTwo.wj.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.wj.service.WJService;


@Controller
public class WJController {
	
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
	   
    @Autowired
	private WJService wjService;
	
    @RequestMapping(value = "index")
    public String index(Model model) {
    	
    	return "wj/userCheck";
    }
    
    
	@GetMapping(value = "main")
	public String main(HttpServletRequest request,String user_id_email,Model model) {
		
		String context = request.getContextPath();
		User_info user_info = wjService.selectUser(user_id_email);
		if(user_info == null) {
			return "redirect:index";
		}
       List<Challenge> chatbotList = wjService.chatbotList(user_id_email);
		
        Date today = new Date();
        
        System.out.println("context =>" + context);
        System.out.println("today => " + today);
       
	    model.addAttribute("user_id_email", user_info.getUser_id_email());
	    model.addAttribute("user_nickname", user_info.getUser_nickname());
	    model.addAttribute("user_image", user_info.getUser_image());
		model.addAttribute("chatbotList", chatbotList);
		model.addAttribute("context", context);
		return "wj/main";
	}
	
	
	
	@RequestMapping(value = "getCategoryLcNum")
	@ResponseBody
	public List<Main_category> getCategoryLcNum(int lc_num) {
		
		System.out.println("WJController getCategoryNum lc_num =>" + lc_num);
		List<Main_category> categoryLcNum = wjService.selCategoryLc_num(lc_num);
		
		return categoryLcNum;
	}
	
	@RequestMapping(value = "getCategoryMcNum")
	@ResponseBody
	public List<Main_category> getCategoryMcNum(int lc_num,int mc_num) {
		
		Main_category category = new Main_category();
		
		category.setLc_num(lc_num);
		category.setMc_num(mc_num);
		System.out.println("WJController getCategoryNum mc_num =>" + mc_num);
		List<Main_category> categoryMcNum = wjService.selCategoryMc_num(category);
		
		return categoryMcNum;
	}
	
	
	@RequestMapping(value = "getChgTimeChk")
	@ResponseBody
	public Challenge getChgTimeChk(int chg_num) {
		
		System.out.println("ajax 챌린지 번호 chg_num => " + chg_num);
		Challenge getChgTimeChk = wjService.getChgTimeChk(chg_num);
		
		
		return getChgTimeChk;
	}
	
	@PostMapping(value = "mainSearch")
	public String mainSearch(String mainSearchName,String user_id_email,String user_nickname,String user_image,Model model) {
		
		
		
						
		model.addAttribute("user_id_email", user_id_email);
	    model.addAttribute("user_nickname", user_nickname);
	    model.addAttribute("user_image", user_image);
		model.addAttribute("mainSearchName", mainSearchName);
		//model.addAttribute("searchTitleList", searchTitleList);
		return "wj/mainSearch";
	}
	
	@PostMapping(value = "category_searchs")
	public String category_searching(String user_id_email, String user_nickname , String user_image,
			                         int lc_num, int mc_num, int sc_num , Model model) {
		
		System.out.println("WJController category_searching lc_num =>" + lc_num);
		System.out.println("WJController category_searching mc_num =>" + mc_num);
		System.out.println("WJController category_searching sc_num =>" + sc_num);
		
		
		model.addAttribute("user_id_email", user_id_email);
	    model.addAttribute("user_nickname", user_nickname);
	    model.addAttribute("user_image", user_image);
		model.addAttribute("lc_num", lc_num);
		model.addAttribute("mc_num", mc_num);
		model.addAttribute("sc_num", sc_num);
		
		return "wj/category_Challenge";
	}
	
	@RequestMapping(value = "category_ajax_listCount")
	@ResponseBody
	public Challenge category_ajax_listCount(int lc_num , int mc_num, int sc_num) {
		
		Main_category main_category = new Main_category();
		main_category.setLc_num(lc_num);
		main_category.setMc_num(mc_num);
		main_category.setSc_num(sc_num);
		
		Challenge challenge = wjService.category_ajax_listCount(main_category);
		System.out.println("count => " + challenge.getCount());
		return challenge;
	}
	
	
	@RequestMapping(value = "category_ajax")
	@ResponseBody
	public List<Challenge> category_ajax(int lc_num, int mc_num , int sc_num, int count){
		
		System.out.println("test : " + lc_num);
		System.out.println("test : " + mc_num);
		System.out.println("test : " + sc_num);
		System.out.println("test : " + count);
		
		List<Challenge> category_ajax = null;
		
		//Main_category main_category = new Main_category();
		
		//main_category.setLc_num(lc_num);
		//main_category.setMc_num(mc_num);
		//main_category.setSc_num(sc_num);
        
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
	    paramMap.put("lc_num", lc_num);
	    paramMap.put("mc_num", mc_num);
	    paramMap.put("sc_num", sc_num);
	    paramMap.put("count", count);
		
		
		category_ajax = wjService.category_ajax(paramMap);
		
		return category_ajax;
	}
	
}
