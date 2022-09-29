package ex1_get_dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
/*
DAO(Data Access Object) 클래스
- 데이터 베이스와 연동하여 레코드의 추가, 수정, 삭제 작업이 이루어지느 클래스 입니다.
 */
public class DAO {
	
	private DataSource ds;
	
	public DAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

    public JsonArray getList_lib(){
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	JsonArray array = new JsonArray();
    	try {
    		con = ds.getConnection();
    	 
    		String sql = "select * from dept order by deptno";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    	   
    	while(rs.next()) {
			JsonObject obj = new JsonObject();
            obj.addProperty("deptno", rs.getInt(1));
            obj.addProperty("dname", rs.getString(2));
            obj.addProperty("loc", rs.getString(3));
            array.add(obj);
    	}
    } catch (Exception e) {
    	e.printStackTrace();
    } finally {
    	if(rs != null)
    		try {    		
    			rs.close();
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		}
    	if(pstmt != null)    	
    		try {			
    			pstmt.close();
    		} catch (SQLException e) {
    			System.out.println(e.getMessage());
    		}
    	if(con != null)
    		try {           
    			con.close();
    		} catch(Exception e) {
    			System.out.println(e.getMessage());
    		}
		}
    	return array;
    	//return null;
	}

	public JsonArray getList_lib_bean() {
		Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	JsonArray array = new JsonArray();
    	try {
    		con = ds.getConnection();
    	 
    		String sql = "select * from dept order by deptno";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    	   
    	while(rs.next()) {
    		//Dept를 이용해서 저장합니다.
			Dept dept = new Dept();
            dept.setDeptno(rs.getInt(1));
            dept.setDname(rs.getString(2));
            dept.setLoc(rs.getString(3));
            
            //JsonElement com.google.gson.Gson.toJsonTree(Object src);
            JsonElement j = new Gson().toJsonTree(dept);
            array.add(j); //JsonElement 형을 요구합니다.
    	}
    } catch (Exception e) {
    	e.printStackTrace();
    } finally {
    	if(rs != null)
    		try {    		
    			rs.close();
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		}
    	if(pstmt != null)    	
    		try {			
    			pstmt.close();
    		} catch (SQLException e) {
    			System.out.println(e.getMessage());
    		}
    	if(con != null)
    		try {           
    			con.close();
    		} catch(Exception e) {
    			System.out.println(e.getMessage());
    		}
		}
    	return array;
    	//return null;
	}

	public JsonArray getList_lib_search(int deptno) {
		Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	JsonArray array = new JsonArray();
    	try {
    		con = ds.getConnection();
    	 
    		String sql = "select * from dept where deptno=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, deptno);
    		rs = pstmt.executeQuery();
    	   
    	while(rs.next()) {
			JsonObject obj = new JsonObject();
            obj.addProperty("deptno", rs.getInt(1));
            obj.addProperty("dname", rs.getString(2));
            obj.addProperty("loc", rs.getString(3));
            array.add(obj);
    	}
    } catch (Exception e) {
    	e.printStackTrace();
    } finally {
    	if(rs != null)
    		try {    		
    			rs.close();
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		}
    	if(pstmt != null)    	
    		try {			
    			pstmt.close();
    		} catch (SQLException e) {
    			System.out.println(e.getMessage());
    		}
    	if(con != null)
    		try {           
    			con.close();
    		} catch(Exception e) {
    			System.out.println(e.getMessage());
    		}
		}
    	return array;
    	//return null;
	}

}