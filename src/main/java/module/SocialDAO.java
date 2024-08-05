package module;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import util.JDBCUtil;

public class SocialDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private String SC_LIST = "select * from social";
	private String SC_INSERT = "insert into social(name, title, text, livtime, hit) values(?,?,?,now(),0)";
	private String SC_ONE = "select * from social where id = ?";
	private String SC_UPDATE ="update social set name = ? ,title =?, text = ?, livtime = now() where id = ?";
	private String SC_DELETE = "delete from social where id =?";
	private String SC_COUNTING = "update social set hit = hit + 1 where id =?";
	
	
	public void countingSc(int id) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(SC_COUNTING);
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void deleteSc(int id) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(SC_DELETE);
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void insertSc(SocialDTO dto) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(SC_INSERT);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getTitle());
			stmt.setString(3, dto.getText());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void updateSc(SocialDTO dto) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(SC_UPDATE);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getTitle());
			stmt.setString(3, dto.getText());
			stmt.setInt(4, dto.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	
	public SocialDTO getOne(int id){
		SocialDTO dto = null;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(SC_ONE);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				dto = new SocialDTO(rs.getInt("id"),rs.getString("name"),
						rs.getString("title"), rs.getString("text"),
						rs.getString("livtime"),rs.getInt("hit"));
			}
		}catch (SQLException  e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt,conn);
		}
		return dto;
	}
	
	public List<SocialDTO> getsocialList(){
		List<SocialDTO> list = new ArrayList<>();
		
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(SC_LIST);
			rs= stmt.executeQuery();
			while(rs.next()) {
				SocialDTO dto = new SocialDTO(rs.getInt("id"),rs.getString("name"),
						rs.getString("title"), rs.getString("text"),
						rs.getString("livtime"),rs.getInt("hit"));
				list.add(dto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt,conn);
		}
		return list;
}
}
