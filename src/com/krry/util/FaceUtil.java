package com.krry.util;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;

import com.baidu.aip.face.AipFace;

/**
 * 人脸识别工具类
 * @author krry
 * @version v1.0 
 * 
 */
public class FaceUtil {

	
	 //设置APPID/AK/SK
    public static final String APP_ID = "10242455";
    public static final String API_KEY = "F98C6sQoL9V2VfDCZLoLYnH5";
    public static final String SECRET_KEY = "O1ftDAMCxSa3GZXWvPbjbp0VdArYeZl3";

    /**
     *  人脸对比
     *  @author krry
     *  @param imgFace1 原图像
     *  @param imgFace2 新图像
     *  @return boolean 是否是本人
     * 
     */
    public static String isFace(String imgFace1,String imgFace2){
    	
        // 初始化一个AipFace
        AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);
        ArrayList<String> pathArray = new ArrayList<String>();
        pathArray.add(imgFace1);
        pathArray.add(imgFace2);
        JSONObject response = client.match(pathArray, new HashMap<String, String>());
        
        String result = response.toString();
        // 将JSON的字符串转换成JSON对象
        net.sf.json.JSONObject fromObject = net.sf.json.JSONObject.fromObject(result);
        net.sf.json.JSONArray jsonArray = fromObject.getJSONArray("result");
        
        boolean flag = false;
        int size = jsonArray.size();
        for(int i = 0; i < size; i++){
        	net.sf.json.JSONObject object = (net.sf.json.JSONObject)jsonArray.get(i);
        	double resultList = object.getDouble("score");
        	if(resultList >= 90){
        		flag = true;
        	}
        }
        
        String msg1 = "是同一个人";
        String msg2 = "不是同一个人";
        
    	return flag ? msg1 : msg2;
    }
    
    public static void main(String[] args) {
        // 初始化一个AipFace
        //AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);

        // 可选：设置网络连接参数
        //client.setConnectionTimeoutInMillis(2000);
        //client.setSocketTimeoutInMillis(60000);

        // 可选：设置代理服务器地址, http和socket二选一，或者均不设置
       // client.setHttpProxy("proxy_host", proxy_port);  // 设置http代理
       // client.setSocketProxy("proxy_host", proxy_port);  // 设置socket代理

        // 调用接口
        //String path = "D:\\Windows 7 Documents\\Desktop\\big\\pic\\images\\2.jpg";
        //JSONObject res = client.detect(path, new HashMap<String, String>());
        //System.out.println(res.toString(2));
    	
//    	String imgFace1 = "D:\\5.jpg";
//    	String imgFace2 = "D:\\2.jpg";
//    	
//    	boolean bol = isFace(imgFace1, imgFace2);
//    	
//    	if(bol){
//    		System.out.println("是同一个人 ！");
//    	} else {
//    		System.out.println("不是同一个人 ！");
//    	}
    	
    }	
	
}
