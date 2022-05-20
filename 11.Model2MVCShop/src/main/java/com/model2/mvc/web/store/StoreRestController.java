package com.model2.mvc.web.store;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.store.StoreService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/store/*")
public class StoreRestController {
	
	///Field
	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;
	//setter Method 구현 않음
		
	public StoreRestController(){
		System.out.println(this.getClass());
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
    public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		System.out.println("썸머노트");
		System.out.println("1: "+multipartFile);
		
		
        //JsonObject jsonObject = new JsonObject();
        Map map = new HashMap();
		
		
        String fileRoot = "C:\\z.utility\\summernote_image\\";	//저장될 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        // 랜덤 UUID+확장자로 저장될 savedFileName
        String savedFileName = UUID.randomUUID() + extension;	
        
        System.out.println("2: "+savedFileName);
        
        File targetFile = new File(fileRoot + savedFileName);
        
        System.out.println("3: "+targetFile);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream,targetFile);	//파일 저장
            //jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
            map.put("url", "/summernoteImage/"+savedFileName);
            //jsonObject.addProperty("responseCode", "success");
            map.put("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	// 실패시 저장된 파일 삭제
            //jsonObject.addProperty("responseCode", "error");
            map.put("responseCode", "error");
            e.printStackTrace();
        }

        
        
        System.out.println("4: "+map);
        
        return map;
    }
	
}