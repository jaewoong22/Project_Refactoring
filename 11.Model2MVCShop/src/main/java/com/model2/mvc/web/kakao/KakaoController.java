package com.model2.mvc.web.kakao;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.kakao.KakaoService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/kakao/*")
public class KakaoController {
	
	///Field
	@Autowired
	@Qualifier("kakaoServiceImpl")
	private KakaoService kakaoService;
	//setter Method 구현 않음
		
	public KakaoController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="kakaoPay")
	public String kakaoPay() throws Exception{
	
		System.out.println("kakaoPay:POST");
		
		return "redirect:"+kakaoService.kakaoPayReady();
	}
	

	
	@RequestMapping("kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        System.out.println("kakaoPay:GET");
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaoService.kakaoPayInfo(pg_token));
        
        return "forward:/purchase/kakaoPayInfo.jsp";
    }
	
	
}