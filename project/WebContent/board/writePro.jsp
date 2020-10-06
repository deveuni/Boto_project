<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.boto.board.BoardBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.boto.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boto</title>
</head>
<body>

	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
	%>
	
	<!-- 전달되는 정보를 BoardBean 객체에 저장 -->
	<jsp:useBean id="bb" class="com.boto.board.BoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	
	 	 <!-- 파일 업로드 처리 -->
	<%
	
		// 파일 저장 위치
		String uploadPath = request.getRealPath("/upload2");
	
		// 저장 크기 지정 (10MB)
		int maxSize = 10 * 1024 * 1024;
	
	 	try{ 
		// MultipartRequest 객체 사용 파일 업로드
		 		MultipartRequest multi =
					new MultipartRequest(
							request,
							uploadPath,
							maxSize,
							"UTF-8",
							new DefaultFileRenamePolicy()
							);
		
			// 파일업로드 완료
			
			// 전달되는 이름, 제목 저장
			bb.setName(multi.getParameter("name"));
			bb.setPass(multi.getParameter("pass"));
			bb.setSubject(multi.getParameter("subject"));
			bb.setContent(multi.getParameter("content"));
			
			bb.setIp(request.getRemoteAddr());
		
			// 전달된 파일의 이름 확인
			Enumeration files =  multi.getFileNames();
		
			// 전달된 파일의 정보를 저장 
			String file1 = (String)files.nextElement();
			
			// 서버에 저장되는 파일 이름
			
			bb.setFile(multi.getFilesystemName(file1));
			//filename = multi.getFilesystemName(file1);
		
			// 원래 파일 이름
			 bb.setFile(multi.getOriginalFileName(file1));
			//OFilename= multi.getOriginalFileName(file1);  
			
			// 업로드 동작 끝
			// => 예외 발생가능성 높음
		 }catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<%
	System.out.println("@@@@writePro.jsp 에서 bb" +bb);
		// IP정보 추가 저장 
		bb.setIp(request.getRemoteAddr());
	
		// BoardDAO 객체 생성 
		BoardDAO bdao = new BoardDAO();
		
		// 글작성 메서드 호출 (insertBoard(bb))
		bdao.insertBoard(bb);
		
		// 페이지 이동
		response.sendRedirect("boardList.jsp");
	%>













</body>
</html>