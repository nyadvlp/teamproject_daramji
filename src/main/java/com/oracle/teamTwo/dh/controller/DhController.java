package com.oracle.teamTwo.dh.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.teamTwo.dh.model.Inter;
import com.oracle.teamTwo.dh.model.ThisPoint;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.pys.service.MyPageService;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chat_category;
import com.oracle.teamTwo.teamtwo.model.Interest_category;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Controller
public class DhController {
   
   @Autowired
   dhUserServiceImpl dus;
   
   @Autowired
   JavaMailSender mailSender;
   
   // teamtwo user model
   @ModelAttribute("user_model")
   public User_info user_model(HttpServletRequest request) {
	   User_info user_model = new User_info();
	   String user_id_email = request.getParameter("user_id_email");
	   user_model = dus.user(user_id_email);
	   
	   HttpSession session = request.getSession();
	   
	   session.setAttribute("user_id_email", user_model.getUser_id_email());
	   session.setAttribute("user_nickname", user_model.getUser_nickname());
	   session.setAttribute("user_image", user_model.getUser_image());
	   
	   return user_model;
   }
   
   @RequestMapping("/login")
   public String login() {
      return "dh/login";
   }
   
   @RequestMapping("/goLogin")
   public String goLogin(HttpServletRequest request,Model model) {
      System.out.println("goLogin start");
      int insert = 0;
      int dateCha = 0;
      String user_id_email = (String) request.getParameter("user_id_email");
      String user_password = (String) request.getParameter("user_password");
      System.out.println("user_id_email->"+user_id_email);
      System.out.println("user_password->"+user_password);
      
      //????????? ??????
      int login = dus.login(user_id_email,user_password);
      //?????? ?????? ???????????? ??????
      int user_state = dus.state(user_id_email);
      //????????? ????????? ????????? ?????? ?????? ????????????
      String date = dus.chkLogTime(user_id_email);
      System.out.println("date->"+date);
      //??????????????? ????????? ????????? ?????? ????????? ??? ?????????(1?????? ????????? ????????? ????????? ????????? ??????)
      if(user_state == 1) {
      if(date != null) {
      dateCha = dus.dateCha(date);
      System.out.println("dateCha->"+dateCha);
      }
      if(date == null || dateCha >= 1) {
      // ?????? ????????? ????????? ?????? ????????????
      int balance_point = dus.thisPoint(user_id_email);
      System.out.println("balance_point->"+balance_point);
      // ????????? ???????????? ??????
      ThisPoint thisPoint = new ThisPoint();
      thisPoint.setUser_id_email(user_id_email);
      thisPoint.setBalance_point(balance_point);
      insert = dus.loginPoint(thisPoint);
      }
      }
      model.addAttribute("login", login);
      model.addAttribute("user_state", user_state);
      model.addAttribute("user_id_email",user_id_email);
      return "dh/goLogin";
   }
   
   @RequestMapping("/join")
   public String join() {
      return "dh/join";
   }
   //????????? ????????????
   @RequestMapping("/idCheck")
   @ResponseBody
   public int idCheck(@RequestParam("user_id_email") String user_id_email) {
      return dus.idCheck(user_id_email);
   }
   //????????? ????????????
   @RequestMapping("/nicCheck")
   @ResponseBody
   public int nicCheck(@RequestParam("user_nickname") String user_nickname) {
      return dus.nicCheck(user_nickname);
   }
   
   @PostMapping("/goJoin")
   public String goJoin(User_info user_info,Model model) {
      int join = dus.join(user_info);
      int inPoint = dus.point(user_info.getUser_id_email());
      model.addAttribute("join", join);
      model.addAttribute("point", inPoint);
      model.addAttribute("id", user_info.getUser_id_email());
      return "dh/goJoin";
   }
   //????????? ?????? ?????????
   @RequestMapping("/idFound")
   public String idFound() {
      return "dh/idFound";
   }
   //????????? ?????? ajax
   @RequestMapping("/findId")
   @ResponseBody
   public String findId(@RequestParam("user_name") String user_name,@RequestParam("user_phone") String user_phone) {
      User_info user_info = new User_info();
      user_info.setUser_name(user_name);
      user_info.setUser_phone(user_phone);
      
      String findId = dus.findId(user_info);
      return findId;
   }
   //???????????? ?????? ?????????
   @RequestMapping("/pwFound")
   public String pwFound() {
      return "dh/pwFound";
   }
   // ????????? ???????????? ?????????
   @RequestMapping("/findPw")
   @ResponseBody
   public int findPw(@RequestParam("user_name") String user_name,@RequestParam("user_phone") String user_phone,@RequestParam("user_id_email") String user_id_email) {
      System.out.println("mail Sending");
      int result = 0;
      String tomail = user_id_email;// ???????????? ?????????
      String setfrom = "daram.can.do.it@gmail.com"; //????????? ?????????
      String title = "????????? ???????????? ?????????.";//?????? ??????
      try {
         User_info user_info = new User_info();
         user_info.setUser_id_email(user_id_email);
         user_info.setUser_name(user_name);
         user_info.setUser_phone(user_phone);
         int count = dus.findPw(user_info); //???????????? ??????
         if(count == 1) {// ??????????????? ????????? ????????? ???????????? 6?????? ????????? db??? ??????????????? ?????????.
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
         messageHelper.setFrom(setfrom);
         messageHelper.setTo(tomail);
         messageHelper.setSubject(title);
         String tempPassword = (int)(Math.random()*999999)+1+"";
         messageHelper.setText("????????? ?????? ?????????????????????. =>"+tempPassword+" ????????? ????????? ????????????????????? ???????????? ??????????????????."); //????????? ??????????????? ????????? ????????? ?????????
         mailSender.send(message);
         // ???????????? ?????? ???????????? ??????6????????? db??? ??????
         user_info.setUser_id_email(user_id_email);
         user_info.setUser_password(tempPassword); 
         dus.chPw(user_info);
         result = 1;
         }else {
            result = 0;
         }
      } catch (Exception e) {
         System.out.println("e->"+e.getMessage());
         result = -1;
      }
      return result;
   }
   
   // ?????? ?????????
   @RequestMapping("/myType")
   public String myType(HttpServletRequest request,Model model) {
      String id = request.getParameter("user_id_email");
      List<Chat_category> list = dus.chatList();
      model.addAttribute("id", id);
      model.addAttribute("list", list);
      return "dh/myType";
   }
   // 1??? ????????? ???
   @RequestMapping("/a1")
   @ResponseBody
   public String a1(@RequestParam("anum") int anum, @RequestParam("id") String id) {
      System.out.println("value->"+anum);
      System.out.println("id->"+id);
      String data = null;
      Interest_category category = new Interest_category();
      category.setUser_id_email(id);
      category.setQ_cnum(1);
      category.setA_cnum(anum);
      try {
         int result = dus.interest(category);
         if(result == 1) {
            System.out.println("??????");
            data = dus.subject(category);
         }else {
            System.out.println("??????");
         }
      } catch (Exception e) {
         System.out.println("DhController a1 Exception ->"+e.getMessage());
      }
      return data;
   }
   //2??? ????????? ???
   @RequestMapping("/a2")
   @ResponseBody
   public String a2(@RequestParam("anum") int anum, @RequestParam("id") String id) {
      System.out.println("value->"+anum);
      System.out.println("id->"+id);
      String data = null;
      Interest_category category = new Interest_category();
      category.setUser_id_email(id);
      category.setQ_cnum(2);
      category.setA_cnum(anum);
      try {
         int result = dus.interest(category);
         if(result == 1) {
            System.out.println("??????");
            data = dus.subject(category);
         }else {
            System.out.println("??????");
         }
      } catch (Exception e) {
         System.out.println("DhController a1 Exception ->"+e.getMessage());
      }
      return data;
   }
   // 3??? ????????? ???
   @RequestMapping("/a3")
   @ResponseBody
   public String a3(@RequestParam("anum") int anum, @RequestParam("id") String id) {
      System.out.println("value->"+anum);
      System.out.println("id->"+id);
      String data = null;
      Interest_category category = new Interest_category();
      category.setUser_id_email(id);
      category.setQ_cnum(3);
      category.setA_cnum(anum);
      try {
         int result = dus.interest(category);
         if(result == 1) {
            System.out.println("??????");
            data = dus.subject(category);
         }else {
            System.out.println("??????");
         }
      } catch (Exception e) {
         System.out.println("DhController a1 Exception ->"+e.getMessage());
      }
      return data;
   }
   // ?????? ?????? ?????? ????????? ?????????
   @RequestMapping("/a41")
   @ResponseBody
   public List<Challenge> a41(@RequestParam("id") String id) {
      System.out.println("DhController a41 gogo");
      List<Challenge> list = null;
      try {
         list = dus.uchatList3(id);
      } catch (Exception e) {
         System.out.println("DhController a1 Exception ->"+e.getMessage());
      }
      return list;
   }
   
   //??? ??????(?????????,????????????) ?????? ???
   @RequestMapping("myInfo")
   public String myInfo(HttpServletRequest request,Model model) {
	   
	   String user_id_email = request.getParameter("user_id_email");
	   
	   // TEAM TWO USER MODEL
      User_info user_info = dus.myInfo(user_id_email);
      model.addAttribute("user_id_email", user_id_email);
      model.addAttribute("user", user_info);
      return "dh/myInfo";
   }
   
// ??? ??????(?????????,????????????) ????????????
   @PostMapping("myInfo_update")
   public String myInfo_update(HttpServletRequest request,MultipartFile user_image,Model model) 
      throws Exception{
      System.out.println("myInfo_update start");
      
      User_info user_info = new User_info();
      
      String user_id_email = request.getParameter("user_id_email");
      String user_nickname = request.getParameter("user_nickname");
      try {
      String uploadPath = request.getSession().getServletContext().getRealPath("/upload/profileIMG"); //?????? ????????? ??????
      String saveName = uploadFile(user_image.getOriginalFilename(),user_image.getBytes(),uploadPath);
      System.out.println(user_image.getOriginalFilename());
      user_info.setUser_id_email(user_id_email);
      user_info.setUser_image(saveName);
      } catch (Exception e) {
         user_info.setUser_id_email(user_id_email);
         user_info.setUser_image(request.getParameter("user_image"));
         System.out.println(e.getMessage());
      }
      
      try {
      String user_intro = request.getParameter("user_intro");
      user_info.setUser_intro(user_intro);
      } catch (Exception e) {
         System.out.println(e.getMessage());
      } finally {
         int update = dus.updateInfo(user_info);
         model.addAttribute("update", update);
         model.addAttribute("user_id_email", user_id_email);
         model.addAttribute("user_nickname", user_nickname);
         model.addAttribute("user_image", user_info.getUser_image());
      }
      
      return "dh/myInfo_update";
   }
      
   //?????? ?????????  ?????????
      private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception{
    	  File fileDirectory = new File(uploadPath);
          if(!fileDirectory.exists()) { //????????? ????????? ?????????
             fileDirectory.mkdirs(); // ????????? ?????? ????????? ????????????
          }
          String saveName = originalName;
          File target = new File(uploadPath, saveName);
          FileCopyUtils.copy(fileData, target);
          return saveName;
       }
   // ?????? ??????(?????????,????????????,????????? ???) ?????? ?????????
   @RequestMapping("myUser_info")
   public String myUser_info(HttpServletRequest request,Model model) {
      String user_id_email =  request.getParameter("user_id_email");
      
      //????????? 1,2,3??? ?????? ?????? ????????????
      int a_num1 = dus.interNum1(user_id_email);
      int a_num2 = dus.interNum2(user_id_email);
      int a_num3 = dus.interNum3(user_id_email);
      model.addAttribute("a_num1", a_num1);
      model.addAttribute("a_num2", a_num2);
      model.addAttribute("a_num3", a_num3);
      
      // TEAM TWO USER MODEL
      User_info user_info = dus.myInfo(user_id_email);
      model.addAttribute("user_id_email", user_id_email);
      model.addAttribute("user", user_info);
      return "dh/myUser_info";
   }
   // ?????? ?????? ?????? ??? ?????? ?????? ajax
   @RequestMapping("pwChk")
   @ResponseBody
   public int pwChk(@RequestParam("user_id_email") String user_id_email,@RequestParam("pw") String pw) {
      int result = 0;
      String password = dus.pwChk(user_id_email);
      if(password.equals(pw)) {
         result = 1;
      }else {
         result = 0;
      }
      return result;
   }
   // ?????? ??????(?????????,????????????,????????? ???) ??????
   @PostMapping("myUser_info_update")
   public String myUser_info_update(User_info user_info,HttpServletRequest request,Model model) {
      String user_id_email =  request.getParameter("user_id_email");
      String user_nickname =  request.getParameter("user_nickname");
      String user_image =  request.getParameter("user_image");
      int a_cnum1 = Integer.parseInt(request.getParameter("a_cnum1"));
      int a_cnum2 = Integer.parseInt(request.getParameter("a_cnum2"));
      int a_cnum3 = Integer.parseInt(request.getParameter("a_cnum3"));
      System.out.println("a_cnum1->"+a_cnum1);
      System.out.println("a_cnum2->"+a_cnum2);
      System.out.println("a_cnum3->"+a_cnum3);
      int update = dus.myUser_update(user_info); //???????????? ??????
      if(update == 1) {
      Inter inter = new Inter();
      inter.setUser_id_email(user_id_email);
      inter.setA_cnum1(a_cnum1);
      inter.setA_cnum2(a_cnum2);
      inter.setA_cnum3(a_cnum3);
      int inter1= dus.inter_update1(inter);
      int inter2= dus.inter_update2(inter);
      int inter3= dus.inter_update3(inter);
      }else {
         System.out.println("??????");
      }
      model.addAttribute("update", update);
      model.addAttribute("user_id_email", user_id_email);
      model.addAttribute("user_nickname", user_nickname);
      model.addAttribute("user_image", user_image);
      return "dh/myUser_info_update";
   }
   //?????? ????????? ?????? ???????????? ajax
   @RequestMapping("nicCheckInfo")
   @ResponseBody
   public int nickCheckInfo(@RequestParam("user_nickname") String user_nickname,@RequestParam("user_id_email") String user_id_email) {
      int result = 0;
      result = dus.nickCheckInfo(user_id_email,user_nickname);
      return result;
   }
}