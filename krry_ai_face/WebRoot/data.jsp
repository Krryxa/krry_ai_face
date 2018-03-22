<%@ page language="java" import="java.util.*,com.krry.util.*" pageEncoding="utf-8"%>
<%
	// 获取图像路径
	String src1 = request.getParameter("path1");
	String path1 = request.getRealPath("/") + src1;
	String src2 = request.getParameter("path2");
	String path2 = request.getRealPath("/") + src2;
	// 获取图像识别的信息
	String info = FaceUtil.isFace(path1,path2);
	
	out.print(info);
%>
