package ex2_insert_gson_servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
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

    public JsonArray getList(){
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	JsonArray array = new JsonArray();
    	try {
    		con = ds.getConnection();
    	 
    		String sql = "select * from products order by id";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    	   
    	while(rs.next()) {
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("id", rs.getInt(1));
			jsonObject.addProperty("name", rs.getString(2));
			jsonObject.addProperty("price", rs.getInt(3));
			jsonObject.addProperty("maker", rs.getString(4));
            array.add(jsonObject);
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
	}

	public int insert(VO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0; //초기값
		try {
			con = ds.getConnection();
			String sql = "INSERT INTO products "
					+ "   VALUES ("
					+ "             (select nvl(max(id),0)+1 from products), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setString(3, vo.getMaker());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	if(pstmt != null)    	
	    		try {			
	    			pstmt.close();
	    		} catch (SQLException ex) {
	    			ex.printStackTrace();
	    		}
	    	if(con != null)
	    		try {           
	    			con.close();
	    		} catch(Exception e) {
	    			System.out.println(e.getMessage());
	    		}
			}
	    	return result;
		}

	public int update(VO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0; //초기값
		try {
			con = ds.getConnection();
			String sql = "update products "
					+ "   set name=?, price=?, maker=?"
					+ "   where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setString(3, vo.getMaker());
			pstmt.setInt(4, vo.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	if(pstmt != null)    	
	    		try {			
	    			pstmt.close();
	    		} catch (SQLException ex) {
	    			ex.printStackTrace();
	    		}
	    	if(con != null)
	    		try {           
	    			con.close();
	    		} catch(Exception e) {
	    			System.out.println(e.getMessage());
	    		}
			}
		return result;
	}

	public int delete(int id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0; //초기값
		try {
			con = ds.getConnection();
			String sql = "delete products"
					+ "   where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	if(pstmt != null)    	
	    		try {			
	    			pstmt.close();
	    		} catch (SQLException ex) {
	    			ex.printStackTrace();
	    		}
	    	if(con != null)
	    		try {           
	    			con.close();
	    		} catch(Exception e) {
	    			System.out.println(e.getMessage());
	    		}
			}
		return result;
	}
}