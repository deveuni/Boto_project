package com.boto.comment;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class CommentDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// DB연결 메서드
	private Connection getCon() throws Exception {

		// Context 객체를 생성
		Context init = new InitialContext();

		// 디비 연결 정보를 불러오기 "java:comp/env/설정이름"

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/BotoDB");

		// ds 사용해서 연결
		con = ds.getConnection();

		System.out.println("연결: " + con);

		return con;
	}// DB연결 메서드

	// 자원 해제 메서드
	public void closeDB() {

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// closeDB()

	// 댓글 등록
	public boolean insertComment(CommentBean comment) {
		boolean result = false;

		int num = 0;

		HttpServletRequest request = null;

		try {
			con = getCon();

			con.setAutoCommit(false);

			// 글번호 계산하기
			sql = "select max(comment_num) from boto_comment";

			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);

			// 실행
			rs = pstmt.executeQuery();

			// 데이터 처리
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			System.out.println("저장될 글 번호: " + num);

			sql = "insert into boto_comment(comment_num, comment_board, comment_id, comment_date, "
					+ "comment_parent, comment_content) " + "values(?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setInt(2, comment.getComment_board());
			pstmt.setString(3, comment.getComment_id());
			pstmt.setInt(4, comment.getComment_parent());
			pstmt.setString(5, comment.getComment_content());

			int flag = pstmt.executeUpdate();
			if (flag > 0) {
				result = true;
				con.commit();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	// 댓글 등록

	// 댓글목록
	public ArrayList<CommentBean> getCommentList(int bno){
		ArrayList<CommentBean> list = new ArrayList<CommentBean>();
		
		
		try {
			con = getCon();
			
			sql ="select * from boto_comment where comment_board = ?";
					                                             
			
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, bno);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CommentBean comment = new CommentBean();
				//comment.setComment_level(rs.getInt("level"));
				comment.setComment_num(rs.getInt("comment_num"));
				comment.setComment_board(rs.getInt("comment_board"));
				comment.setComment_id(rs.getString("comment_id"));
				comment.setComment_date(rs.getDate("comment_date"));
				comment.setComment_parent(rs.getInt("comment_parent"));
				comment.setComment_content(rs.getString("comment_content"));
				
				list.add(comment);
				System.out.println("댓글리스트는?");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return list;
	}
	// 댓글목록

	// 댓글 삭제

	public int deleteComment(int comment_num) { 
		int result = -1;
  
		try { 
			con = getCon(); 
  
			sql = "select * from boto_comment where comment_num=?";
  
			pstmt = con.prepareStatement(sql);
  
			pstmt.setInt(1, comment_num);
  
			rs = pstmt.executeQuery();
  
			if(rs.next()) { 
	  
				if(comment_num == rs.getInt("comment_num") ) {

					sql = "delete from boto_comment where comment_num =?";
  
  
					pstmt = con.prepareStatement(sql);
  
					pstmt.setInt(1, comment_num);
  
					pstmt.executeUpdate();
 
					System.out.println("댓글 삭제 완료");
  
					result = 1;
  
				}
  
			}
		} catch (Exception e) { // TODO Auto-generated catch block
				e.printStackTrace(); 
		}finally { closeDB(); }
			return result; 
	}
	


	// 댓글 하나의 정보
	public CommentBean getComment(int comment_num) {
	
		CommentBean cb = null;
	
		try {
			con = getCon();
		
			sql = "select * from boto_comment where comment_num=?";
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, comment_num);
		
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
			
				cb = new CommentBean();
			
				cb.setComment_num(rs.getInt("comment_num"));
				cb.setComment_board(rs.getInt("comment_board"));
				cb.setComment_content(rs.getString("comment_content"));
				cb.setComment_date(rs.getDate("comment_date"));
				cb.setComment_id(rs.getString("comment_id"));
				cb.setComment_parent(rs.getInt("comment_parent"));
			
			}
		
			System.out.println("댓글 정보 저장완료");
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
			return cb;
	}// 댓글 하나의 정보


	//댓글수정
	public int updateComment(CommentBean cb) {
	
		int result = -1;
	
		try {
			con = getCon();
		
			sql = "update boto_comment set comment_content =? where comment_num=?";
		 
			pstmt = con.prepareStatement(sql);
		 
			pstmt.setString(1, cb.getComment_content());
			pstmt.setInt(2, cb.getComment_num());
		 
			pstmt.executeUpdate();
		 
			System.out.println("댓글 수정 완료");
		  
			result = 1;
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
			return result;
	}//댓글수정














}


	
