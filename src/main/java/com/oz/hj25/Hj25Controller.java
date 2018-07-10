package com.oz.hj25;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oz.hj25.biz.AnswerBiz;
import com.oz.hj25.biz.BoardBiz;
import com.oz.hj25.biz.GoodsBiz;
import com.oz.hj25.biz.InfoBiz;
import com.oz.hj25.biz.OrdersBiz;
import com.oz.hj25.biz.StockBiz;
import com.oz.hj25.biz.UserBiz;
import com.oz.hj25.dto.AnswerDto;
import com.oz.hj25.dto.BoardDto;
import com.oz.hj25.dto.InfoDto;
import com.oz.hj25.dto.UserDto;
import com.oz.hj25.utill.Urlcoding;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Hj25Controller {
	
	@Autowired
	private AnswerBiz answerBiz;
	@Autowired
	private BoardBiz boardBiz;
	@Autowired
	private UserBiz userBiz;
	@Autowired
	private InfoBiz infoBiz;


	@RequestMapping(value="login.do")
	public String login() {
		return "userLogin";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "userLogin";
	}
	
	@RequestMapping(value="loginAjax.do")
	@ResponseBody
	public  Map<String, Boolean> loginAjax(HttpSession session, @RequestParam("u_id") String u_id,
			@RequestParam("u_pw") String u_pw) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		
		UserDto mapResult = userBiz.userCheck(u_id,u_pw);
		
		
		boolean lc = false;
		boolean u_enabled = false;
		if(mapResult != null) {
			lc=true;
			session.setAttribute("loginPerson", mapResult);
			System.out.println(mapResult.getU_enabled());
			
			if( mapResult.getU_enabled().equals("Y")) {
		
			u_enabled=true;
			}
		}
		System.out.println(u_enabled+"하년ㅇ");
		Map<String,Boolean> resMap=new HashMap<String,Boolean>();
		resMap.put("lc", lc);
			resMap.put("u_enabled", u_enabled);
		
	
		
		return resMap;
	}
	
	//url decode 
		@RequestMapping(value = "decode.do")
		public void decode(Model model, @RequestParam("url") String url, HttpServletResponse response) {
			Urlcoding code = new Urlcoding();
			String res = code.urlDecode(url);

			try {
				response.getWriter().print(res);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	
	@RequestMapping(value="loginRes.do")
	public String loginform(HttpSession session) {
		boolean grade=((UserDto)session.getAttribute("loginPerson")).getU_grade().equals("ADMIN");
		if(grade) {
			return "adminMain";			
		}else {
			return "userMain";
		}

	}
	
	@RequestMapping(value = "userInsert.do", method = RequestMethod.GET)
	public String userInsertForm() {
		return "userJoin";
	}
	
	@RequestMapping(value = "AfterInsert.do", method = RequestMethod.POST)
	public String AfterInsert(@ModelAttribute UserDto dto) {
		userBiz.insert(dto);
		return "AfterInsert";
	}
	
	@RequestMapping(value = "userIdSearch.do")
	public String userIdSearch(){
		return "userIdSearch";
	}
	
	@RequestMapping("userIdSearchRes.do")
	public void userIdSearchRes(String u_name, String u_email, HttpServletResponse response) {
		String i_id = userBiz.UserIdSearch(u_name, u_email);
		
		if(i_id == null || i_id.equals("")) {
			try {
				response.getWriter().print("해당 회원은 존재하지 않습니다");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("가입 ID: "+i_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "UdundantInspection.do")
	@ResponseBody
	public void UserUdundantInspection(Model model, @RequestParam("column") String column,
			@RequestParam("val") String val, HttpServletResponse response) {
		System.out.println(val);
		String u_no = userBiz.UdundantInspection(column, val);

		try {
			response.getWriter().print(u_no);
		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "I_IDUdundantInspection.do")
	@ResponseBody
	public void I_IDUserUdundantInspection(Model model, @RequestParam("i_id") String i_id,
			HttpServletResponse response) {
		System.out.println("cont1");
		String i_id2 = infoBiz.selectI_id(i_id);
		System.out.println("cont2");
		boolean res = false;
		if (i_id2 == null || i_id2 == "") {
			try {
				response.getWriter().print("i_id없음");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			String u_no = userBiz.UdundantInspection("I_ID", i_id2);
			if (u_no == null || u_no == "") {
				res = true;
			}

			try {
				response.getWriter().print(res);
			} catch (IOException e) {

				e.printStackTrace();
			}

		}

	}
	
	//비밀번호찿기
		@RequestMapping(value = "PwSearch.do")
		@ResponseBody
		public void PwSearch(Model model, @RequestParam("u_id") String u_id, @RequestParam("u_name") String u_name,
				@RequestParam("u_email") String u_email, @RequestParam("sysdate") String sysdate,
				HttpServletResponse response) {
			UserDto dto = new UserDto(u_id, u_name, u_email);
			String u_id2 = userBiz.UserPwSearch(dto);
			if (u_id2 == null || u_id2 == "") {
				try {
					response.getWriter().print("회원정보를 찾을 수 없습니다");
				} catch (IOException e) {

					e.printStackTrace();
				}
			} else {
			

				boolean res = userBiz.pwEmail(u_email, u_id, sysdate);

				try {
					response.getWriter().print(res);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	
	//비밀번호찿기 from
		@RequestMapping(value = "userPwSearch.do")
		public String userPwSearch(Model model) {
			return "userPwSearch";
		}
		
		//비밀번호변경
		@RequestMapping(value="pwUpdate.do")
		@ResponseBody
		public void pwUpdate(Model model, @RequestParam("u_id") String u_id, @RequestParam("u_pw") String u_pw,
				HttpServletResponse response) {
			int res = userBiz.UserPwUpdate(u_id, u_pw);

			try {
				response.getWriter().print(res);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		@RequestMapping(value = "userList.do")
		public String userList(Model model,@RequestParam("pageNo") int pageNo){
			Map<String, Integer> map=userBiz.UserPageSize(pageNo);
			model.addAttribute("UserList", userBiz.selectAll(pageNo));
			model.addAttribute("total", map.get("total"));
			model.addAttribute("start", map.get("start"));
			model.addAttribute("end", map.get("end"));
			return "userList";
		}
		@RequestMapping(value="userListSearch.do")
		public String userListSearch(Model model,@RequestParam("option") String option,@RequestParam("input")String input,@RequestParam("pageNo")int pageNo) {
			Map map =userBiz.UserSearchPageSize(pageNo, option, input);
			model.addAttribute("total", map.get("total"));
			model.addAttribute("start", map.get("start"));
			model.addAttribute("end", map.get("end"));		
			model.addAttribute("UserList", userBiz.UserSearch(pageNo, option, input));
			return "userList";
		}
		@RequestMapping(value="userDrop.do")
		public String userDrop(@RequestParam("u_enabled")String u_enabled,@RequestParam("u_id") String u_id) {
			userBiz.UserDrop(u_enabled, u_id);
			return "redirect:userList.do?pageNo=1";
		}
		
	@RequestMapping(value = "userInfo.do")
	public String userInfo(Model model, String u_id){
		UserDto dto = userBiz.selectOne(u_id);
		model.addAttribute("myInfo", dto);
		
		return "userInfo";
	}
	
	@RequestMapping("userInfoUpdate.do")
	public String userInfoUpdate(Model model, @ModelAttribute UserDto dto) {
		int res = userBiz.update(dto);
		if(res>0) {
			model.addAttribute("msg", "개인정보 수정 성공");
		} else {
			model.addAttribute("msg", "개인정보 수정 실패");
		}
		
		UserDto uDto = userBiz.selectOne(dto.getU_id());
		model.addAttribute("myInfo", uDto);
		
		return "userInfo";
	}
	
	@RequestMapping("userDelete.do")
	public void userDelete(HttpSession session, Model model, HttpServletResponse response, String u_no) {
		int res = userBiz.delete(Integer.parseInt(u_no));
		if(res>0) {
			session.invalidate();
			try {
				response.getWriter().print("지금까지 이용해주셔서 감사합니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("탈퇴 실패");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//게시판 리스트
		@RequestMapping(value="BoardList.do")
		public String BoardList(Model model,@RequestParam("pageNo") int pageNo) {
			Map<String, Integer> map=boardBiz.pageSize(pageNo);
			model.addAttribute("list",boardBiz.selectAll(pageNo));  
			model.addAttribute("total", map.get("total"));
			model.addAttribute("start", map.get("start"));
			model.addAttribute("end", map.get("end"));
			model.addAttribute("pageNum",map.get("pageNum"));
			model.addAttribute("pageBlock", map.get("pageBlock"));
			return "boardList";
		}
	
		//게시판 입력 폼
		@RequestMapping(value="BoardInsertForm.do")
		public String BoardWriteForm() {
			return "boardInsert";
		}
	
		//게시판 입력완료하고 나서 ..
		@RequestMapping(value="BoardInsert.do")
		public String BoardWrite(Model model,@ModelAttribute BoardDto dto) {
			int res=boardBiz.insert(dto);
			if(res>0) {
				model.addAttribute("list",boardBiz.selectAll(1));
				return "redirect:BoardList.do?pageNo=1";
			}else {
				return "boardInsert";
			}
			
		}
	
		//게시판 상세보기
		@RequestMapping(value="BoardDetail.do")
		public String BoardDetail(Model model,@RequestParam("b_no") int b_no) {
			boardBiz.boardCount(b_no);
			model.addAttribute("detail",boardBiz.selectOne(b_no));
			return "boardDetail";
		}
		@RequestMapping(value="AnswerList.do")
		@ResponseBody
		public List<AnswerDto> AnswerList(Model model,@RequestParam("b_no") int b_no){
			return answerBiz.selectAll(b_no);
		}
		//댓글 입력
		@RequestMapping(value="AnswerInsert.do")
		@ResponseBody
		public int AnswerInsert(@ModelAttribute AnswerDto dto) {
			return answerBiz.insert(dto);
		}
		//댓글 추가입력
		@RequestMapping(value="AnswerInsertRe.do")
		@ResponseBody
		public int AnswerInsertRe(@ModelAttribute AnswerDto dto) {
			return answerBiz.Reinsert(dto);
		}
		@RequestMapping(value="AnswerDelete.do")
		@ResponseBody
		public int AnswerDelete(@RequestParam("a_no") int a_no) {
			int count =answerBiz.answerCount(a_no);
			if(count == 0) {
				return answerBiz.delete(a_no);
			}else {
				return answerBiz.answerUpDel(a_no);
			}
			
		}
		@RequestMapping(value="AnswerUpdate.do")
		@ResponseBody
		public int AnswerUpdate(@ModelAttribute AnswerDto dto) {
			return answerBiz.update(dto);
		}
		
		
	
		//게시판 게시글 삭제
		@RequestMapping(value="BoardDelete.do")
		public String BoardDelete(Model model,@RequestParam("b_no") int b_no) {
			int res = boardBiz.delete(b_no);
			if(res>0) {
				model.addAttribute("list",boardBiz.selectAll(1));
				return "redirect:BoardList.do?pageNo=1";
			}else {
				model.addAttribute("list",boardBiz.selectAll(1));
				return "redirect:BoardList.do?pageNo=1";
			}
			
		}
	
		//게시판 게시글 수정 폼
		@RequestMapping(value="BoardUpdateForm.do")
		public String BoardUpdateForm(Model model,@RequestParam("b_no") int b_no) {
			model.addAttribute("detail",boardBiz.selectOne(b_no));
			return "boardUpdateForm";
		}
	
		//게시판 게시글 수정하고 나서..
		@RequestMapping(value="BoardUpdate.do")
		public String BoardUpdate(Model model,@ModelAttribute BoardDto dto, @RequestParam("b_no") int b_no) {
			boardBiz.update(dto);
			model.addAttribute("detail",boardBiz.selectOne(dto.getB_no()));
			model.addAttribute("AnswerList",answerBiz.selectAll(b_no));	
			return "redirect:BoardDetail.do?b_no="+dto.getB_no();
		}
	
		//게시판 검색처리된 페이징
		@RequestMapping(value="BoardSearch.do")
		public String BoardSearch(Model model,@RequestParam("option") String option,@RequestParam("input")String input,@RequestParam("pageNo")int pageNo) {
			Map<String, Object> map =boardBiz.searchPageSize(pageNo, option, input);
			model.addAttribute("total", map.get("total"));
			model.addAttribute("start", map.get("start"));
			model.addAttribute("end", map.get("end"));		
			model.addAttribute("list", boardBiz.search(option,input,pageNo));
			return "boardList";
		}
	
	//어드민 게시판 리스트에서 삭제
	@RequestMapping(value="BoardMulDel.do")
	public String BoardMulDel(@RequestParam("chk") String[] b_no) {
		boardBiz.boardMulDel(b_no);
		return "redirect:BoardList.do?pageNo=1";
	}

	//가게 정보 추가
	@RequestMapping(value="InfoInsert.do")
	@ResponseBody
	public void InfoInsert( Model model,@RequestParam("i_id") String i_id,
			@RequestParam("i_name") String i_name
			,@RequestParam("i_addr") String i_addr
			,@RequestParam("i_detailaddr") String i_detailaddr
			,@RequestParam("i_postno") String i_postno,
			HttpServletResponse response) {
		InfoDto dto = new InfoDto(i_id,i_name,i_addr,i_detailaddr,i_postno);
		int res  = infoBiz.insertInfo(dto);
		
		try {
			response.getWriter().print(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	 
    OutputStream out = null;
    PrintWriter printWriter = null;
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");

    String resourcePath = "D://SpringWorkspace/HJ25/src/main/webapp/resources/boardImg/";

    Date date = new Date();
    date.getTime();
    
    try{

        String fileName = upload.getOriginalFilename();
        String[] fileNameArr = fileName.split("\\.");
        System.out.println(Arrays.toString(fileNameArr));
        String storeFileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];
        System.out.println("저장경로 : " + resourcePath + storeFileName);
        byte[] bytes = upload.getBytes();
        String uploadPath = resourcePath + storeFileName;//저장경로

        out = new FileOutputStream(new File(uploadPath));
        out.write(bytes);
        String callback = request.getParameter("CKEditorFuncNum");

        String filePath = "resources/boardImg/" + storeFileName;
        
        printWriter = response.getWriter();

        printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                + callback
                + ",'"
                + filePath
                + "','이미지를 업로드 하였습니다.'"
                + ")</script>");
        printWriter.flush();

    }catch(IOException e){
        e.printStackTrace();
    } finally {
        try {
            if (out != null) {
                out.close();
            }
            if (printWriter != null) {
                printWriter.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    return;
}


}

