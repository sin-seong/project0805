package module;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;import java.sql.SQLException;

import util.JDBCUtil;

public class PlayerDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	

	private String PL_INSERT = "insert into player(name, sss, tel, email) values(?,?,?,?)";
	private String PL_CON = "select count(*) as ct from player where name = ? and sss= ?";
	
	
	public boolean checkLogin(String name, String sss){
		conn = JDBCUtil.getConnection();
	try {
		stmt = conn.prepareStatement(PL_CON);
		stmt.setString(1, name);
		stmt.setString(2, sss);
		rs = stmt.executeQuery();
		rs.next();
		
		if(rs.getInt("ct") == 1) {
			return true;
		}
	}catch (SQLException e) {		
		e.printStackTrace();
	}finally {
		JDBCUtil.close(rs, stmt, conn);
	}
	return false;
	}
	
	
	public void regPl(PlayerDTO dto) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(PL_INSERT);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getSss());
			stmt.setString(3, dto.getTel());
			stmt.setString(4, dto.getEmail());
			stmt.executeUpdate();
			} catch (Exception e) {
			e.printStackTrace();
			}finally {
				JDBCUtil.close(stmt, conn);
			}
		}
	}

