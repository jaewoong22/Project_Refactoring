package com.model2.mvc.web.store;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.service.store.StoreService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/store/*")
public class StoreRestController {
	
	///Field
	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;
	//setter Method ���� ����
		
	public StoreRestController(){
		System.out.println(this.getClass());
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
    public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
	//public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, @RequestParam("userId") String userId) {

		System.out.println("��ӳ�Ʈ");
		//System.out.println("userId: "+userId);		
		System.out.println("1: "+multipartFile);
		
		
        //JsonObject jsonObject = new JsonObject();
        Map map = new HashMap();
		
		
        String fileRoot = "C:\\z.utility\\summernote_image\\";	//����� ���� ���
        String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����

        // ���� UUID+Ȯ���ڷ� ����� savedFileName
        //String savedFileName = UUID.randomUUID() + extension;	

        Date now = new Date();
       
        SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
        
        String formatedNow = formatter.format(now);
        
       //���ϸ� ����ũ�� �ο� -> ����Ͻú���
        String savedFileName = formatedNow + extension;	
        //String savedFileName = userId+formatedNow + extension;	
        
        System.out.println("2: "+savedFileName);
        System.out.println("2: "+extension);
        System.out.println("2: "+formatedNow);
        //System.out.println("2: "+userId);
        
        File targetFile = new File(fileRoot + savedFileName);
        
        System.out.println("3: "+targetFile);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream,targetFile);	//���� ����
            //jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
            map.put("url", "/summernoteImage/"+savedFileName);
            //jsonObject.addProperty("responseCode", "success");
            map.put("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	// ���н� ����� ���� ����
            //jsonObject.addProperty("responseCode", "error");
            map.put("responseCode", "error");
            e.printStackTrace();
        }

        
        
        System.out.println("4: "+map);
        
        return map;
    }
	
}