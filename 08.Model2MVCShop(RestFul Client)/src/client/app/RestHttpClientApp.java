package client.app;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
//import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;
import com.model2.mvc.service.domain.User;


public class RestHttpClientApp {
	
	// main Method
	public static void main(String[] args) throws Exception{
		
		
	
		//==USER========================================================	
//		RestHttpClientApp.getUserTest_JsonSimple();
//		RestHttpClientApp.LoginTest_JsonSimple();
//		RestHttpClientApp.addUserTest_JsonSimple();		
//		RestHttpClientApp.updateUserTest_JsonSimple();			
//		RestHttpClientApp.checkDuplicationTest_JsonSimple();		
//		RestHttpClientApp.listUserTest_JsonSimple();	
		
//		RestHttpClientApp.getUserTest_Codehaus();
//		RestHttpClientApp.LoginTest_Codehaus();
//		RestHttpClientApp.addUserTest_Codehaus();
//		RestHttpClientApp.updateUserTest_Codehaus();
//		RestHttpClientApp.checkDuplicationTest_Codehaus();
//		RestHttpClientApp.listUserTest_Codehaus();		

		
		//==PRODUCT=====================================================
//		RestHttpClientApp.addProductTest_JsonSimple();		
//		RestHttpClientApp.getProductTest_JsonSimple();		
//		RestHttpClientApp.updateProductTest_JsonSimple();		
//		RestHttpClientApp.listProductTest_JsonSimple();
		
//		RestHttpClientApp.addProductTest_Codehaus();		
//		RestHttpClientApp.getProductTest_Codehaus();		
//		RestHttpClientApp.updateProductTest_Codehaus();		
//		RestHttpClientApp.listProductTest_Codehaus();		
		
		
		//==PURCHASE====================================================
//		RestHttpClientApp.addPurchaseTest_JsonSimple();			
//		RestHttpClientApp.getPurchaseTest_JsonSimple();	
//		RestHttpClientApp.updatePurchaseTest_JsonSimple();
//		RestHttpClientApp.updateTranCodeTest_JsonSimple();		
//		RestHttpClientApp.listPurchaseTest_JsonSimple();
//		RestHttpClientApp.listSalesTest_JsonSimple();
		
		
		
//		RestHttpClientApp.addPurchaseTest_Codehaus();		
//		RestHttpClientApp.getPurchaseTest_Codehaus();			
//		RestHttpClientApp.updatePurchaseTest_Codehaus();			
//		RestHttpClientApp.updateTranCodeTest_Codehaus();			
//		RestHttpClientApp.listPurchaseTest_Codehaus();	
//		RestHttpClientApp.listSalesTest_Codehaus();	

		
	}
	
////////////////////////////////////////////////////////////////////////	
////UESR////////////////////////////////////////////////////////////////
//====================================================================//
	public static void addUserTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/addUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("userId", "user700");
		json.put("userName", "SCOTT");
		json.put("password", "7070");
		json.put("ssn", "");
		json.put("phone", "");
		json.put("addr", "SEOUL");
		json.put("email", "SEOUL@gmail.com");
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		//==> ????????(JSON Value ????)
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		System.out.println(jsonobj);
	
	}
	
	public static void addUserTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/addUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user01 =  new User();
		user01.setUserId("user400");
		user01.setUserName("SCOTT");
		user01.setPassword("4040");
		user01.setSsn("");
		user01.setPhone("");
		user01.setAddr("SEOUL");
		user01.setEmail("SEOUL@gmail.com");
		
		System.out.println(user01);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(user01);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 User user = objectMapper.readValue(serverData, User.class);
		 System.out.println(user);
	}	
//================================================================//		

	public static void getUserTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"http://127.0.0.1:8080/user/json/getUser/admin";
				
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		//==> ????????(JSON Value ????)
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}
	
	
	//1.2 Http Protocol GET Request : JsonSimple + codehaus 3rd party lib ????
	public static void getUserTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"http://127.0.0.1:8080/user/json/getUser/admin";

		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		//System.out.println("[ Server ???? ???? Data ???? ] ");
		//String serverData = br.readLine();
		//System.out.println(serverData);
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 User user = objectMapper.readValue(jsonobj.toString(), User.class);
		 System.out.println(user);
	}
//================================================================//	
	
	public static void LoginTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/login";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		//[ ???? 1 : String ????]
//			String data =  "{\"userId\":\"admin\",\"password\":\"1234\"}";
//			HttpEntity httpEntity01 = new StringEntity(data,"utf-8");
		
		//[ ???? 2 : JSONObject ????]
		JSONObject json = new JSONObject();
		json.put("userId", "admin");
		json.put("password", "1234");
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		//==> ????????(JSON Value ????)
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		System.out.println(jsonobj);
	
	}
	
	
	//2.2 Http Protocol POST ???? Request : FromData???? 
	//==> JsonSimple + codehaus 3rd party lib ????
	public static void LoginTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/login";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		//[ ???? 3 : codehaus ????]
		User user01 =  new User();
		user01.setUserId("admin");
		user01.setPassword("1234");
		ObjectMapper objectMapper01 = new ObjectMapper();
		//Object ==> JSON Value ?? ????
		String jsonValue = objectMapper01.writeValueAsString(user01);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 User user = objectMapper.readValue(jsonobj.toString(), User.class);
		 System.out.println(user);
	}	
	
//================================================================//
	public static void updateUserTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/updateUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("userId", "user100");
		json.put("userName", "SCOTT");
		json.put("addr", "????????");
		json.put("email", "SUWON@gmail.com");
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		//==> ????????(JSON Value ????)
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		System.out.println(jsonobj);
	
	}
	
	public static void updateUserTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/updateUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user01 =  new User();
		user01.setUserId("user400");
		user01.setUserName("SCOTT");
		user01.setPassword("4040");
		user01.setSsn("");
		user01.setPhone("");
		user01.setAddr("SUWON");
		user01.setEmail("SUWON@gmail.com");
		
		System.out.println(user01);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(user01);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 User user = objectMapper.readValue(serverData, User.class);
		 System.out.println(user);
	}	
//================================================================//		
	public static void checkDuplicationTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/checkDuplication";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("userId", "admin");
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	
	}
	
	public static void checkDuplicationTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/checkDuplication";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user01 =  new User();
		user01.setUserId("admin");
		
		System.out.println(user01);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(user01);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	}	
//================================================================//	
	public static void listUserTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/listUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("CurrentPage", 1);
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	
	}
	
	public static void listUserTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/user/json/listUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Search search = new Search();
		
		System.out.println(search);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	}	
//================================================================//	
///////////////////////////////////////////////////////////////////////////
////PRODUCT////////////////////////////////////////////////////////////////
//=======================================================================//
	
	public static void addProductTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/addProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("fileName", "??????.jpg");
		json.put("manuDate", "20220422");
		json.put("price", 500);
		json.put("prodDetail", "??????");
		json.put("prodName", "??????");
		
		
		System.out.println(json.toString());
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}
	
	public static void addProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/addProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Product product = new Product();
		product.setFileName("??????.jpg");
		product.setManuDate("20220422");
		product.setPrice(1000);
		product.setProdDetail("ddd");
		product.setProdName("??????22");
		
		System.out.println(product);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(product);
		
		System.out.println(jsonValue);
		
	
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}
	
//================================================================//

	public static void getProductTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/getProduct/10008";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		 System.out.println(product);
	}
	
	public static void getProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/getProduct/10008";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		 System.out.println(product);
	}
	
//================================================================//		
//================================================================//

	public static void updateProductTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/updateProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("fileName", "????????.jpg");
		json.put("manuDate", "20220422");
		json.put("price", 500);
		json.put("prodDetail", "????????");
		json.put("prodName", "????????");
		json.put("prodNo", 10035);
		json.put("prodStock", 30);
		
		
		System.out.println(json.toString());
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}
	
	public static void updateProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/updateProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Product product = new Product();
		product.setFileName("????????.jpg");
		product.setManuDate("20220422");
		product.setPrice(1000);
		product.setProdDetail("ddd");
		product.setProdName("????????22");
		product.setProdNo(10036);
		product.setProdStock(20);
		
		System.out.println(product);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(product);
		
		System.out.println(jsonValue);
		
	
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}
	
//================================================================//		
//================================================================//	
	public static void listProductTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/listProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("CurrentPage", 1);
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	
	}
	
	public static void listProductTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/listProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Search search = new Search();
		search.setCurrentPage(1);
		
		System.out.println(search);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	}	
//================================================================//	
///////////////////////////////////////////////////////////////////////////
////PURCHASE////////////////////////////////////////////////////////////////
//=======================================================================//

	public static void addPurchaseTest_JsonSimple() throws Exception {
	
		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/addPurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
//		User user = new User();
//		user.setUserId("user12");
//		
//		Product product = new Product();
//		product.setProdNo(10001);
		
		Map map1 = new HashMap();
		map1.put("userId", "user12");
		
		Map map2 = new HashMap();
		map2.put("prodNo", 10036);
		
		JSONObject json = new JSONObject();
		json.put("buyer", map1);
		json.put("purchaseProd", map2);
		json.put("divyAddr", "suwon");
		json.put("divyDate", "");
		json.put("divyRequest", "test");
		json.put("paymentOption", "1");
		json.put("receiverName", "SCOTT");
		json.put("receiverPhone", "");
		json.put("tranCode", "001");
		json.put("buyNum", 2);
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString: "+json.toString());
		System.out.println();
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	
	}

	public static void addPurchaseTest_Codehaus() throws Exception {
	
		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/addPurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user = new User();
		user.setUserId("user12");
		
		Product product = new Product();
		product.setProdNo(10035);
		
		Purchase purchase = new Purchase();
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setDivyAddr("suwon");
		purchase.setDivyDate("");
		purchase.setDivyRequest("test");
		purchase.setPaymentOption("1");
		purchase.setReceiverName("SCOTT");
		purchase.setReceiverPhone("");
		purchase.setTranCode("001");
		purchase.setBuyNum(3);
		
		
		
		System.out.println(purchase);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(purchase);
		
		System.out.println(jsonValue);
		
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();
		
		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		
	
	}

//================================================================//
//================================================================//

	public static void getPurchaseTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/getPurchase/10013";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		 System.out.println(purchase);
	}
	
	public static void getPurchaseTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/getPurchase/10013";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		 System.out.println(purchase);
	}
	
//================================================================//	
//================================================================//

	public static void updatePurchaseTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updatePurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("paymentOption", "1");
		json.put("receiverName", "????");
		json.put("receiverPhone", "");
		json.put("divyAddr", "????");
		json.put("divyRequest", "????????");
		json.put("divyDate", "");
		json.put("tranNo", 10013);
		
		
		System.out.println(json.toString());
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}
	
	public static void updatePurchaseTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updatePurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Purchase purchase = new Purchase();
		purchase.setDivyAddr("????");
		purchase.setDivyDate("");
		purchase.setDivyRequest("CodeHaus");
		purchase.setPaymentOption("1");
		purchase.setReceiverName("??????");
		purchase.setReceiverPhone("");
		purchase.setTranNo(10014);
		
		System.out.println(purchase);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(purchase);
		
		System.out.println(jsonValue);
		
	
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}
	
//================================================================//		
//================================================================//
	
	public static void updateTranCodeTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updateTranCode/10013";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		 System.out.println(purchase);
	}
	
	public static void updateTranCodeTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol ?? client ??????
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updateTranCode/10013";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		// HttpGet : Http Protocol ?? GET ???? Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		// HttpResponse : Http Protocol ???? Message ??????
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		
		//==> API ???? : Stream ?????? ???? ???? 
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();
		 Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		 System.out.println(purchase);
	}
	
//================================================================//		
//================================================================//	
	public static void listPurchaseTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/listPurchase/user12";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("CurrentPage", 1);
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	
	}
	
	public static void listPurchaseTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/listPurchase/user12";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Search search = new Search();
		search.setCurrentPage(1);
		
		System.out.println(search);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	}	
//================================================================//	
//================================================================//	
	public static void listSalesTest_JsonSimple() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/listSales";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		JSONObject json = new JSONObject();
		json.put("CurrentPage", 1);
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		System.out.println("json.toString"+json.toString());
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	
	}
	
	public static void listSalesTest_Codehaus() throws Exception{
		
		// HttpClient : Http Protocol ?? client ?????? 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/listSales";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Search search = new Search();
		search.setCurrentPage(1);
		
		System.out.println(search);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);
		
		System.out.println(jsonValue);
		
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response ????
		System.out.println(httpResponse);
		System.out.println();

		//==> Response ?? entity(DATA) ????
		HttpEntity httpEntity = httpResponse.getEntity();
		
		//==> InputStream ????
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> ???? ???????? serverData ???? 
		System.out.println("[ Server ???? ???? Data ???? ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
	}	
//================================================================//	
}