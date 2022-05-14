package com.model2.mvc.service.kakao.impl;

import java.net.URI;
import java.net.URISyntaxException;


import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.model2.mvc.service.domain.kakao.KakaoPayApproval;
import com.model2.mvc.service.domain.kakao.KakaoPayReady;
import com.model2.mvc.service.kakao.KakaoService;

@Service("kakaoServiceImpl")
public class KakaoServiceImpl implements KakaoService{
	
	///Field
	private static final String HOST = "https://kapi.kakao.com";
	
	private KakaoPayReady kakaoPayReady;
	private KakaoPayApproval kakaoPayApproval;

	///Method
	public String kakaoPayReady() {
		
		System.out.println("KakaoServiceImpl의 kakaoPayReady() 시작!");
		
		RestTemplate restTemplate = new RestTemplate();
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "c272eac3b73d38d490cb29ed7a5c4ddd");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1006");
        params.add("partner_user_id", "gorany");
        params.add("item_name", "갤럭시S9");
        params.add("quantity", "1");
        params.add("total_amount", "200");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/kakao/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/kakao/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakao/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);
            
            System.out.println("" + kakaoPayReady);
            
            return kakaoPayReady.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
	//*
	public KakaoPayApproval kakaoPayInfo(String pg_token) {
		 
        System.out.println("KakaoPayInfo");
        System.out.println("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "c272eac3b73d38d490cb29ed7a5c4ddd");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReady.getTid());
        params.add("partner_order_id", "1006");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "200");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApproval = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproval.class);
            System.out.println("" + kakaoPayApproval);
          
            return kakaoPayApproval;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
	//*/
}