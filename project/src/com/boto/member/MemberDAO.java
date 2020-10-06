package com.boto.member;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.boto.member.MemberBean;


public class MemberDAO {
		// 정보를 처리해서 데이터 베이스에 저장하기
	
		// DB 연결에 필요한 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " ";
		
		
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
		}// getCon()
		
		
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
		
		
		// 회원가입 메서드
		public void insertMember(MemberBean mb) {
			
			
			try {
				// DB연결
				con = getCon();
				
				// sql(insert)
				sql = "insert into boto_member(id,pass,name,email,birth,gender,address,postcode, detailAddress, extraAddress, phone,mobile,reg_date) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				// pstmt 객체 
				pstmt = con.prepareStatement(sql);
				
				// ?
				pstmt.setString(1, mb.getId());
				pstmt.setString(2, mb.getPass());
				pstmt.setString(3, mb.getName());
				pstmt.setString(4,mb.getEmail());
				pstmt.setString(5,mb.getBirth());
				pstmt.setString(6,mb.getGender());
				pstmt.setString(7,mb.getAddress());
				pstmt.setInt(8, mb.getPostcode());
				pstmt.setString(9, mb.getDetailAddress());
				pstmt.setString(10, mb.getExtraAddress());
				pstmt.setString(11, mb.getPhone());
				pstmt.setString(12,mb.getMobile());
				pstmt.setDate(13, mb.getReg_date());
				
				// 실행
				pstmt.executeUpdate();
				
				System.out.println("회원가입완료");
					
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
				closeDB();
			}			
		}// 회원가입메서드 
		
		
		// 아이디 중복 체크 메서드
		public int joinIdCheck(String id) {
		
			int result = -1;
			
			try {
				// DB연결
				con = getCon();
				
				// sql(select - 전달받은 아이디가 있는지 판단
				sql = "select * from boto_member where id=?";
				
				// pstmt 객체 생성 & ? 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리 (1=사용가능, 0=사용불가, -1=오류)
				if(rs.next()) {
					// DB에 같은 아이디가 존재 -> 아이디 중복
					result = 0;
				}else {
					// DB에 같은 아이디 존재 X -> 아이디 사용 가능
					result = 1;
				}
				System.out.println("아이디 중복 체크: " + result);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return result;
		}//아이디 중복 체크 메서드
		
		
		//로그인 체크하는 메서드 
		public int idCheck(String id, String pass) {
			
			int result = -1;
				
			try {
				// DB 연결
				con = getCon();
				
				// sql(select) & pstmt 객체 생성 
				sql = "select pass from boto_member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리 
				if(rs.next()) { // 해당 아이디가 있다면
					if(pass.equals(rs.getString("pass"))) { 
						//DB에 있는 비밀번호와 파라미터로 받은 비밀번호 일치
						// 로그인 성공
						result = 1;
					}else {
						// 비밀번호 일치하지 않을 경우 
						result = 0;
					}
				}else {
					//아이디 정보가 없을 경우
					result = -1;
				}
				System.out.println("로그인 처리완료"+result);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}	
			return result;
		}//로그인 체크하는 메서드 
		
		
		//회원정보 가져오는 메서드
		public MemberBean getMember(String id){
		
			MemberBean mb = null;
			
			try {
				
				// DB연결
				con = getCon();
				
				// sql & pstmt
				sql = "select * from boto_member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()){
					// DB에 있는 회원정보를 MemberBean에 저장해서 페이지로 전달
					mb = new MemberBean();
					
					mb.setId(rs.getString("id"));
					mb.setPass(rs.getString("pass"));
					mb.setName(rs.getString("name"));
					mb.setEmail(rs.getString("email"));
					mb.setBirth(rs.getString("birth"));
					mb.setGender(rs.getString("gender"));
					mb.setAddress(rs.getString("address"));
					mb.setPostcode(rs.getInt("postcode"));
					mb.setDetailAddress(rs.getString("detailAddress"));
					mb.setExtraAddress(rs.getString("extraAddress"));
					mb.setPhone(rs.getString("phone"));
					mb.setMobile(rs.getString("mobile"));
					mb.setReg_date(rs.getDate("reg_date"));
					
					System.out.println("회원정보 저장 완료");
					System.out.println(mb);
				}
				System.out.println("실행완료");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return mb;
		}//회원정보 가져오는 메서드
		
		
		//회원정보 수정 메서드
		public int updateMember(MemberBean mb){
			int result = -1;
			
			try {
				// DB연결
				con = getCon();
				
				// sql - 수정해야할 아이디가 있는지 체크
				sql = "select pass from boto_member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, mb.getId());
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()){ 
					if(mb.getPass().equals(rs.getString("pass"))){
						// DB에 아이디가 있고 비밀번호가 일치 한다면 회원정보 수정 sql 작성
						sql = "update boto_member set name=?, "
								+ "email=?, birth=?, gender=?, address=?, postcode=?, detailAddress=?, extraAddress=?, phone=?, mobile=? " 
								+"where id=?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, mb.getName());
						pstmt.setString(2, mb.getEmail());
						pstmt.setString(3, mb.getBirth());
						pstmt.setString(4, mb.getGender());
						pstmt.setString(5,mb.getAddress());
						pstmt.setInt(6, mb.getPostcode());
						pstmt.setString(7, mb.getDetailAddress());
						pstmt.setString(8, mb.getExtraAddress());
						pstmt.setString(9, mb.getPhone());
						pstmt.setString(10, mb.getMobile());
						pstmt.setString(11, mb.getId());
						
						// 실행
						pstmt.executeUpdate();
						
						System.out.println("정보 수정 완료");
						
						result = 1;		
					}else{
						System.out.println("비밀번호 오류");
						result = 0;
					}
				}else{
					System.out.println("아이디 오류");
					result = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return result;
		}//회원정보 수정 메서드
		
		//비밀번호 수정 메서드
				public int updatePass(String id, String pass, String newpass1){
					int result = -1;
					
					try {
						// DB연결
						con = getCon();
						
						// sql - 수정해야할 아이디가 있는지 체크
						sql = "select pass from boto_member where id=?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						// 실행
						rs = pstmt.executeQuery();
						
						// 데이터 처리
						if(rs.next()){ 
							if(pass.equals(rs.getString("pass"))){
								// DB에 아이디가 있고 비밀번호가 일치 한다면 회원정보 수정 sql 작성
								sql = "update boto_member set pass=? " 
										+"where id=? and pass=?";
								
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, newpass1);
								pstmt.setString(2, id);
								pstmt.setString(3, pass);
								
								// 실행
								pstmt.executeUpdate();
								
								System.out.println("비밀번호 수정 완료");
								
								result = 1;		
							}else{
								System.out.println("비밀번호 오류");
								result = 0;	
							}
						}else{
							System.out.println("아이디 오류");
							result = -1;	
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						closeDB();
					}
					return result;
				}//비밀번호 수정 메서드
		
		
		
		
		//회원탈퇴 메서드
		public int deleteMember(String id, String pass){
			
			int result = -1;
			
			try {
				// DB연결
				con = getCon();
				
				// sql & pstmt
				sql = "select pass from boto_member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,id);
			
				// 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()){
					if(pass.equals(rs.getString("pass"))){
						// 해당 아이디가 있고, 비밀번호 일치하면 
						
						sql = "delete from boto_member where id = ?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						// 실행
						pstmt.executeUpdate();
						
						System.out.println("탈퇴성공");
						
						result = 1;	
					}else{
						System.out.println("비밀번호 오류");
						
						result = 0;
					}
				}else{
					System.out.println("아이디 없음");
					result = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return result;
		}//회원탈퇴 메서드
	
		
		//getMemberList()
		
		public ArrayList getMemberList(){
				
				ArrayList memberList = new ArrayList();
					
					try {
						// DB연결
						con = getCon();
						
						sql = "select * from boto_member";
						
						pstmt = con.prepareStatement(sql);
						
						
						rs = pstmt.executeQuery();
						
						
						while(rs.next()){
							
							MemberBean mb = new MemberBean();
							
							mb.setAddress(rs.getString("address"));
							mb.setDetailAddress(rs.getString("detailAddress"));
							mb.setBirth(rs.getString("birth"));
							mb.setEmail(rs.getString("email"));
							mb.setGender(rs.getString("gender"));
							mb.setId(rs.getString("id"));
							mb.setName(rs.getString("name"));
							mb.setPass(rs.getString("pass"));
							mb.setMobile(rs.getString("mobile"));
							mb.setPhone(rs.getString("phone"));
							mb.setReg_date(rs.getDate("reg_date"));
							mb.setPostcode(rs.getInt("postcode"));
							mb.setExtraAddress(rs.getString("extraAddress"));
							////////////////////////////////
							
							// 배열 (ArrayList) 저장 
							memberList.add(mb);
							
						}// while
						
						System.out.println("정보 검색 완료");
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeDB();
					}
			
			return memberList;
		}//getMemberList()

}
