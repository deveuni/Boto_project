package com.boto.gallery;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;



import com.boto.board.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalleryDAO {
	
	
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	public static void getInstance(){
		
		
	}
	
	
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
		public void insertGallery(GalleryBean gb){
			int num = 0;
			
			try {
				// DB연결
				con = getCon();
				
				// 글번호 계산하기
				sql = "select max(bno) from boto_gallery";
				
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
				
				sql = "insert into boto_gallery(bno,name,pass,subject,content,readcount,re_ref,re_seq,re_lev,date,ip,file) "
						+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
						
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				pstmt.setString(2, gb.getName());
				System.out.println("@@@ DAO name값 : " +gb.getName());
				pstmt.setString(3, gb.getPass());
				pstmt.setString(4, gb.getSubject());
				pstmt.setString(5, gb.getContent());
				pstmt.setInt(6, 0); //readcount
				pstmt.setInt(7, num); // re_ref (답글 그룹번호 == 글번호)
				pstmt.setInt(8, 0); // re_seq 일반글 0
				pstmt.setInt(9, 0); // re_lev 일반글 0
				pstmt.setString(10, gb.getIp());
				pstmt.setString(11,gb.getFile());
				
				pstmt.executeUpdate();
				
				System.out.println(num+"번 글쓰기 완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
		}// 글작성 메서드
		
		
		// 게시판 글 개수 리턴하는 메서드 
		public int getGalleryCount(){
			int count = 0;
			
			try {
				// DB연결
				getCon();
				
				// sql - DB에 저장된 목록 총 개수 
				sql = "select count(*) from boto_gallery";
				
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
		

		// 게시판 글 목록 보는 메서드
		public ArrayList getGalleryList(int startRow, int pageSize){
			
			ArrayList galleryList = new ArrayList();
			
				try {
					// DB연결
					con = getCon();
					
					// sql (최신글이 위쪽으로 보이게 정렬)
					sql = "select * from boto_gallery order by re_ref desc, re_seq asc limit ?,?";
							
					// pstmt 객체 생성
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, startRow-1); // 한페이지에 글갯수 잘라서 가져오기
					pstmt.setInt(2, pageSize); 
					
					// 실행
					rs = pstmt.executeQuery();
					
					// 검색된 모든 정보를 저장해서 이동하는 데이터 처리
					while(rs.next()){
						// 글 정보 하나를 BoardBean 객체 하나에 저장
						GalleryBean gb = new GalleryBean();
						
						gb.setBno(rs.getInt("bno"));
						gb.setName(rs.getString("name"));
						gb.setPass(rs.getString("pass"));
						gb.setSubject(rs.getString("subject"));
						gb.setContent(rs.getString("content"));
						gb.setReadcount(rs.getInt("readcount"));
						gb.setRe_ref(rs.getInt("re_ref"));
						gb.setRe_lev(rs.getInt("re_lev"));
						gb.setRe_seq(rs.getInt("re_seq"));
						gb.setDate(rs.getDate("date"));
						gb.setFile(rs.getString("file"));
						gb.setIp(rs.getString("ip"));
						
						// 글 하나의 정보를 arrayList 한칸에 저장
						galleryList.add(gb);
					}
					System.out.println("글 정보 저장 완료");
					//System.out.println(boardList);
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					closeDB();
				}
				return galleryList;
		}// 게시판 글 목록 보는 메서드
		

		// 조회수 메서드 updateReadCount()
		public void updateReadCount(int bno){
		
			try {
				// DB연결
				con = getCon();
				
				// sql(해당 글 번호의 맞는 글의 조회수 1 증가)
				sql = "update boto_gallery set readcount = readcount + 1 where bno=?";
				
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
		public GalleryBean getGallery(int bno){
		
			GalleryBean gb = null;
			
			try {
				// 디비연결
				getCon();
				
				
				// sql - 글 번호에 해당하는 모든 글의 정보를 가져오기
				sql = "select * from boto_gallery where bno=?";
				
				// pstmt 객체 생성
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, bno);
				
				// 실행
				rs = pstmt.executeQuery();
				
				if(rs.next()){ // 데이터가 있으면 실행
					
					// DB -> jsp 전달하기 위해서 BoardBean객체에 저장
					gb = new GalleryBean(); 
					
					// 데이터 저장 
					gb.setBno(rs.getInt("bno"));
					gb.setReadcount(rs.getInt("readcount"));
					gb.setName(rs.getString("name"));
					gb.setDate(rs.getDate("date"));
					gb.setSubject(rs.getString("subject"));
					gb.setFile(rs.getString("file"));
					gb.setContent(rs.getString("content"));
					gb.setIp(rs.getString("ip"));
					gb.setPass(rs.getString("pass"));
					gb.setRe_lev(rs.getInt("re_lev"));
					gb.setRe_ref(rs.getInt("re_ref"));
					gb.setRe_seq(rs.getInt("re_seq"));
					
				}
				
				System.out.println("정보 저장 완료");
				System.out.println(gb);	
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return gb;
		}// 글 정보 가져오는 메서드 getGallery()
		
		
		// 글 수정 메서드 
		public int updateGallery(GalleryBean gb){
			
			int result = -1;
			
			
			try {
				// DB연결
				con = getCon();
				
				// sql - select(수정할 글이 있는지 확인하기)
				sql = "select pass from boto_gallery where bno=?";
				
				// pstmt 객체 생성
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, gb.getBno());
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()){
					System.out.println("&&&&DAO id 넘어가는가");
					if(gb.getPass().equals(rs.getString("pass"))){
						// 아이디가 존재하고 비밀번호 일치하면 글 수정하기
						
						System.out.println("&&&&DAO 비번일치하는가");
						
						sql = "update boto_gallery set name=?, subject=?, content=?, file=? where bno=?";
						
						// pstmt 객체 생성 
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, gb.getName());
						pstmt.setString(2, gb.getSubject());
						pstmt.setString(3, gb.getContent());
						pstmt.setString(4, gb.getFile());
						pstmt.setInt(5, gb.getBno());
						
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
		}// 글 수정 메서드 
		
		// 글삭제 메서드 deleteBoard(bno, pass)
		public int deleteGallery(int bno, String pass){
			int result = -1;
			
			try {
				// DB연결
				con = getCon();
				
				// sql - 삭제하려고 하는 글이 있는지 판단하기 위해 select
				sql = "select pass from boto_gallery where bno=?";
				
				// pstmt 객체 생성 
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, bno);
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터처리
				if(rs.next()){
					if(pass.equals(rs.getString("pass"))){
						// 글 삭제 처리 
						sql = "delete from boto_gallery where bno=?";
						
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
	

}
