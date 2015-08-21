package edu.ap.rest;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.http.Header;

public class CouchDBClient {

	public static void post(String json) {
		CloseableHttpResponse response1 = null;
		try {

			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost("http://127.0.0.1:5984/punten");
			
			StringEntity strEntity = new StringEntity(json);
			httpPost.setEntity(strEntity);
			httpPost.setHeader("Content-Type", "application/json"); 
	        
			response1 = httpclient.execute(httpPost);
		    System.out.println("Response Status : " + response1.getStatusLine());
		} 
		catch (Exception e) {
			System.out.println("In main : " + e.getMessage());
		} 
		finally {
		    try {
				response1.close();
			} 
		    catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public static String get(String view) {
		CloseableHttpResponse response1 = null;
		try {
			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet("http://127.0.0.1:5984/punten/" + view);
			response1 = httpclient.execute(httpGet);

		    HttpEntity entity1 = response1.getEntity();
		    
		   return EntityUtils.toString(entity1);
		} 
		catch (Exception e) {
			System.out.println("In main : " + e.getMessage());
			return "";
		} 
		finally {
		    try {
				response1.close();
			} 
		    catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
