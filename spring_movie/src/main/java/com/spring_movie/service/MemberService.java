package com.spring_movie.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dao.MemberDao;
import com.spring_movie.dto.MemberDto;



@Service
public class MemberService {

	private ModelAndView mav;

	@Autowired
	private MemberDao mdao;

	@Autowired
	private HttpSession session;
	
	// 저장경로 설정
	private String savePath = "D:\\Work_Space_Spring\\spring_movie\\src\\main\\webapp\\resources\\mprofileUpload";

	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("MemberService.memberJoin() 호출");
		MultipartFile mfile = member.getMfile();
		mav = new ModelAndView();
		// 파일저장 - 파일이름
		/*
		 * System.out.println(member.getMfile().getOriginalFilename()); // 현재 파일은 mfile
		 * 필드에만 저장되어있을뿐, 서버에 저장된 상태는 아님
		 */

		// 파일명 생성
		String mprofile = ""; // mybatics에서는 db에 null값을 insert하기위해서는 설정이 필요하므로 길이가 0인 문자열로 대체
//		System.out.println(mfile.isEmpty());	//	 null이면 true, !null이면 false
		if (!mfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 16진수 32자리 무작위 uuid생성
			// UUID : : universal unit id?
			mprofile = uuid.toString() + "_" + mfile.getOriginalFilename();

			// 파일 저장
			mfile.transferTo(new File(savePath, mprofile)); // eclipse에서 사용했던 방법과 같이 savePath경로에 mprofile이름으로 파일저장.
		}
		System.out.println("mprofile : " + mprofile);

		member.setMprofile(mprofile);

		// 주소 처리
		member.setMaddress(member.getMpostcode() + "_" + member.getMaddr() + "_" + member.getMdetailAddr() + "_"
				+ member.getMextraAddr());

		// 회원가입 처리 (dao - insert문)
		int joinResult = mdao.insertMember(member);
		System.out.println(joinResult);

		// Main.jsp로 넘어가도 되고, controller에 주소인 '/'로 넘어가도 된다.

//		mav.setViewName("Main");	//	 return page주소
		// 스프링에서는 페이지 이름을 넘겨주는 형식이라 Board/boardView라고 보내게 되면 Board/boardView.jsp로 넘어가게
		// 되므로 리다이렉트 형식으로 보내기 위해서 redirect:를 붙인다.
		mav.setViewName("redirect:/movieMain");

		return mav;
	}

	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberIdCheck() 호출");
		int searchResult = mdao.memberIdCheck(inputId);
		String IdCheckResult = "";
		if (searchResult > 0) {
			IdCheckResult = "NG";
		} else {
			IdCheckResult = "OK";
		}
		return IdCheckResult;
	}
	
	// 로그인 기능
	public ModelAndView memberLogin(MemberDto loginMember, RedirectAttributes ra) {
		System.out.println("MemberService.memberLogin() 호출");
		MemberDto loginResult = mdao.memberLogin(loginMember);
		mav = new ModelAndView();
		System.out.println(loginResult);
		if(loginResult != null) {
			if(loginResult.getMstate() == 0) {
				ra.addFlashAttribute("msg", "이용정지된 회원입니다.");
				mav.setViewName("redirect:/memberLoginForm");
			}else {
				// 로그인 성공
				System.out.println("로그인성공");
				session.setAttribute("loginId", loginResult.getMid());
				session.setAttribute("loginProfile", loginResult.getMprofile());
				session.setAttribute("loginType", loginResult.getMstate());
				ra.addFlashAttribute("msg", "로그인 되었습니다.");
				mav.setViewName("redirect:/movieMain");							
			}
		}else {
			// 로그인 실패
			System.out.println("로그인실패");
			
			// 1. parameter로 보내게 될 경우
//			mav.addObject("msg", "아이디/비밀번호가 일치하지 않습니다.");
//			mav.setViewName("member/MemberLoginForm");
			// parameter로 담아서 dispatcher 방식으로 넘기게 될 경우에도 값을 쓸 수는 있다.
			// 페이지를 새로고침 할 경우에 값이 유지
			
			// 2. redirect방식으로 attribute에 담아 보내게 될 경우
			ra.addFlashAttribute("msg", "아이디/비밀번호가 일치하지 않습니다.");
			// parameter와 달리 한번 사용하게 될 경우 사라짐
			// redirect방식이 아닌 dispatcher방식으로 보내게 될 경우 사용할 수 없음(redirect: 필요)
			
			mav.setViewName("redirect:/memberLoginForm");
		}
		
		
		return mav;
	}

	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("MemberService.memberLogout() 호출");
		mav = new ModelAndView();
		session.invalidate();	// session 초기화
		ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
		mav.setViewName("redirect:/movieMain");
		return mav;
	}

	public ModelAndView memberView() {
		String mid = (String) session.getAttribute("loginId");
		MemberDto memberInfo = mdao.getMemberView(mid);
		mav = new ModelAndView();
		if(memberInfo.getMaddress() != null) {
			String[] maddress_split = memberInfo.getMaddress().split("_");
			System.out.println(maddress_split[0]);
			memberInfo.setMpostcode(maddress_split[0]);
			System.out.println(maddress_split[1]);
			memberInfo.setMaddr(maddress_split[1]);
			System.out.println(maddress_split[2]);
			memberInfo.setMdetailAddr(maddress_split[2]);
			System.out.println(maddress_split[3]);
			memberInfo.setMextraAddr(maddress_split[3]);			
		}
		
		System.out.println(memberInfo);
		mav.setViewName("member/MemberViewForm");
		mav.addObject("memberInfo", memberInfo);
		return mav;
	}

	public ModelAndView kakaoLogin(String kakaoId, String kakaoEmail, String kakaoNickname, String kakaoProfile, RedirectAttributes ra) {
		System.out.println("MemberService.kakaoLogin() 호출");
		System.out.println("kakaoId : " + kakaoId + " | " + "kakaoEmail : " + kakaoEmail + " | " + "kakaoNickname : " + kakaoNickname + " | " + "kakaoProfile : " + kakaoProfile);
		MemberDto kakaoInfo = mdao.kakaoLogin(kakaoId);
		System.out.println(kakaoInfo);
		ModelAndView mav = new ModelAndView();
		if (kakaoInfo != null) {
			session.setAttribute("loginId", kakaoInfo.getMid());
			session.setAttribute("loginProfile", kakaoInfo.getMprofile());
			session.setAttribute("loginType", kakaoInfo.getMstate());
			ra.addFlashAttribute("msg", "카카오 계정으로 로그인 되었습니다.");
			mav.setViewName("redirect:/movieMain");
		}else {
			mdao.insertKakaoMember(kakaoId, kakaoEmail, kakaoNickname, kakaoProfile);
			ra.addFlashAttribute("msg", "회원정보가 등록되었습니다. 다시 로그인해주세요.");
			mav.setViewName("redirect:/memberLoginForm");
		}
		return mav;
	}
	
}
