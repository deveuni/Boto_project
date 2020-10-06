package com.boto.board;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.boto.board.BoardBean;

public class BoardDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// DB연결 메서드
	private Connection getCon() throws Exception{
		
		//Context 객체를 생성
		Context init = new InitialContext();
			

		// 디비 연결 정보를 불러오기 "java:comp/env/설정이름"
		
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/BotoDB");
			
		// ds 사용해서 연결
		con = ds.getConnection();
			
		System.out.println("연결: " + con );
		
		return con;
	}// DB연결 메서드
	
	
	// 자원 해제 메서드
	public void closeDB(){
				
		try {
			   if(rs != null)	rs.close();
			   if(pstmt != null) pstmt.close();
			   if(con != null) con.close();
						
			} catch (SQLException e) {
				e.printStackTrace();
			}	
	}//closeDB()
	
	// 글작성 메서드
	public void insertBoard(BoardBean bb){
		int num = 0;
		
		try {
			// DB연결
			con = getCon();
			
			// 글번호 계산하기
			sql = "select max(bno) from boto_board";
			
			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			
			//실행
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
			System.out.println("저장될 글 번호: " +num);
			
			//*************************************
			
			// 글 정보 저장하기
			
			sql = "insert into boto_board(bno,name,pass,subject,content,readcount,re_ref,re_seq,re_lev,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
					
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			System.out.println("@@@ DAO name값 : " +bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); //readcount
			pstmt.setInt(7, num); // re_ref (답글 그룹번호 == 글번호)
			pstmt.setInt(8, 0); // re_seq 일반글 0
			pstmt.setInt(9, 0); // re_lev 일반글 0
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11,bb.getFile());
			
			pstmt.executeUpdate();
			
			System.out.println(num+"번 글쓰기 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}// 글작성 메서드
	
	
	// 게시판 글 개수 리턴하는 메서드 
	public int getBoardCount(){
		int count = 0;
		
		try {
			// DB연결
			getCon();
			
			// sql - DB에 저장된 목록 총 개수 
			sql = "select count(*) from boto_board";
			
			// pstmt
			pstmt = con.prepareStatement(sql);
			
			// 실행 -> rs 저장
			rs = pstmt.executeQuery();
			
			// 데이터 처리 
			if(rs.next()){
				// 게시판 글 총 개수
				count = rs.getInt(1);
			}
			System.out.println("게시판 글 개수 확인 : " + count);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return count;
	}// 게시판 글 개수 리턴하는 메서드 
	
	
	//getBoardList
		public ArrayList getBoardList(){
			
			ArrayList boardList = new ArrayList();
			
			
			try {
				
				// 디비연결
				getCon();
				
				// sql & pstmt
				//sql = "select * from itwill_board";
				
				// 정렬(최신글이 가장 위쪽으로 보이게)
				sql = "select * from boto_board "
						+ "order by re_ref desc";
				
				
				pstmt = con.prepareStatement(sql);
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리(검색된 모든 정보를 저장해서 이동)
				while(rs.next()){
					// 글 정보 하나를 BoardBean 객체 하나에 저장 
					BoardBean bb = new BoardBean();
					
					bb.setBno(rs.getInt("bno"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					
					// 글 하나의 정보를 arrayList 한칸에 저장
					boardList.add(bb);
				}
				System.out.println("글 정보 저장 완료");
				//System.out.println(boardList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return boardList;	
		}//getBoardList
	
	
	
	// 게시판 글 목록 보는 메서드
	public ArrayList getBoardList(int startRow, int pageSize){
		
		ArrayList boardList = new ArrayList();
		
			try {
				// DB연결
				con = getCon();
				
				// sql (최신글이 위쪽으로 보이게 정렬)
				sql = "select * from boto_board "
						+ "order by re_ref desc, re_seq asc "
						+ "limit ?,?";
				
				// pstmt 객체 생성
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, startRow-1); // 한페이지에 글갯수 잘라서 가져오기
				pstmt.setInt(2, pageSize); 
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 검색된 모든 정보를 저장해서 이동하는 데이터 처리
				while(rs.next()){
					// 글 정보 하나를 BoardBean 객체 하나에 저장
					BoardBean bb = new BoardBean();
					
					bb.setBno(rs.getInt("bno"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					
					// 글 하나의 정보를 arrayList 한칸에 저장
					boardList.add(bb);
				}
				System.out.println("글 정보 저장 완료");
				//System.out.println(boardList);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return boardList;
	}// 게시판 글 목록 보는 메서드
	
	// 조회수 메서드 updateReadCount()
	public void updateReadCount(int bno){
	
		try {
			// DB연결
			con = getCon();
			
			// sql(해당 글 번호의 맞는 글의 조회수 1 증가)
			sql = "update boto_board set readcount = readcount + 1 where bno=?";
			
			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// 실행
			pstmt.executeUpdate();
			
			System.out.println("조회수 1증가 완료");

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}// 조회수 메서드 updateReadCount()
	
	// 글 정보 가져오는 메서드 getBoard()
	public BoardBean getBoard(int bno){
	
		BoardBean bb = null;
		
		try {
			// 디비연결
			getCon();
			
			
			// sql - 글 번호에 해당하는 모든 글의 정보를 가져오기
			sql = "select * from boto_board where bno=?";
			
			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()){ // 데이터가 있으면 실행
				
				// DB -> jsp 전달하기 위해서 BoardBean객체에 저장
				bb = new BoardBean(); 
				
				// 데이터 저장 
				bb.setBno(rs.getInt("bno"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getDate("date"));
				bb.setSubject(rs.getString("subject"));
				bb.setFile(rs.getString("file"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
			}
			
			System.out.println("정보 저장 완료");
			System.out.println(bb);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return bb;
	}// 글 정보 가져오는 메서드 getBoard()
	
	
	// 글 수정 메서드 updateBoard(bb)
	public int updateBoard(BoardBean bb){
		
		int result = -1;
		
		
		try {
			// DB연결
			con = getCon();
			
			// sql - select(수정할 글이 있는지 확인하기)
			sql = "select pass from boto_board where bno=?";
			
			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getBno());
			
			// 실행
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				System.out.println("&&&&DAO id 넘어가는가");
				if(bb.getPass().equals(rs.getString("pass"))){
					// 아이디가 존재하고 비밀번호 일치하면 글 수정하기
					
					System.out.println("&&&&DAO 비번일치하는가");
					
					sql = "update boto_board set name=?, subject=?, content=?, file=? where bno=?";
					
					// pstmt 객체 생성 
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setString(4, bb.getFile());
					pstmt.setInt(5, bb.getBno());
					
					// 실행
					pstmt.executeUpdate();
					
					System.out.println("글수정완료!");
					
					result = 1;

				}else{
					System.out.println("비밀번호 오류");
					result = 0;
				}
			}else{
				System.out.println("오류");
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return result;
	}// 글 수정 메서드 updateBoard(bb)
	
	
	
	// 글삭제 메서드 deleteBoard(bno, pass)
	public int deleteBoard(int bno, String pass){
		int result = -1;
		
		try {
			// DB연결
			con = getCon();
			
			// sql - 삭제하려고 하는 글이 있는지 판단하기 위해 select
			sql = "select pass from boto_board where bno=?";
			
			// pstmt 객체 생성 
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// 실행
			rs = pstmt.executeQuery();
			
			// 데이터처리
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					// 글 삭제 처리 
					sql = "delete from boto_board where bno=?";
					
					// pstmt 객체 생성
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
					
					pstmt.executeUpdate();
					
					System.out.println("삭제완료!");
					result = 1;
					
				}else{
					result = 0;
					System.out.println("비밀번호오류");
				}
			}else{
				result = -1;
				System.out.println("오류");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return result;
	}// 글삭제 메서드 deleteBoard(bno, pass)
	
	
	// 답글쓰기 메서드 - reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb){
		
		int num = 0;
		
		try {
			// DB연결
			con = getCon();
			
	/***************************답글 번호 계산*************************************/
	// sql 작성(select - 게시판 글 번호중 최대값 계산) & pstmt
	sql = "select max(bno) from boto_board";
	pstmt = con.prepareStatement(sql);
	
	//실행
	rs = pstmt.executeQuery();
	
	// 데이터 처리
	if(rs.next()){
		num = rs.getInt(1) + 1; 
	}
	System.out.println("답글번호 : " + num);
			
	/***************************답글 번호 계산*************************************/

	
	/***************************답글 순서 재배치*************************************/
	
	// re_ref (같은 그룹 기준) re_seq 값이 기존의 값보다 큰 값이 있을 경우
	// re_seq 값을 1 증가 
	
	sql = "update boto_board set re_seq = re_seq+1 where re_ref=? and re_seq>?";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, bb.getRe_ref());
	pstmt.setInt(2, bb.getRe_seq());
	
	
	pstmt.executeUpdate();
	
	/***************************답글 순서 재배치*************************************/

	
	/***************************답글 추가 동작*************************************/
	 
	sql = "insert into boto_board values(?,?,?,?,?,?,?,?,?,now(),?,?)";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, num); // bno - 계산한 글 번호
	pstmt.setString(2, bb.getName());
	pstmt.setString(3, bb.getPass());
	pstmt.setString(4, bb.getSubject());
	pstmt.setString(5, bb.getContent());
	pstmt.setInt(6, bb.getReadcount());
	pstmt.setInt(7, bb.getRe_ref());
	pstmt.setInt(8, bb.getRe_lev()+1);
	pstmt.setInt(9, bb.getRe_seq() + 1);
	pstmt.setString(10, bb.getIp());
	pstmt.setString(11, bb.getFile());
	
	// 실행
	pstmt.executeUpdate();
	
	System.out.println("답글 저장 완료");
	
	
	/***************************답글 추가 동작*************************************/
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}// 답글쓰기 메서드 - reInsertBoard(bb)
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
