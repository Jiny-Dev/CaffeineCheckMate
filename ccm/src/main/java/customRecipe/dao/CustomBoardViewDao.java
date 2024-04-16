package customRecipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import customRecipe.dto.CustomBoardListDto;
import jdbc.JdbcUtil;

public class CustomBoardViewDao {

	public ArrayList<CustomBoardListDto> boardview(Connection con, String num) throws SQLException {
		String sql = "select * from custom_view where num=?";
		PreparedStatement pstm = con.prepareStatement(sql);
		CustomBoardListDto dto = new CustomBoardListDto();
		CustomBoardListDao dao = new CustomBoardListDao();
		ArrayList<CustomBoardListDto> list = new ArrayList<>();
		
		
		pstm.setString(1, num);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()) {
			
				
				dto.setCUS_NUM(1);
				dto.setCUS_NO(rs.getInt(2));
				dto.setC_NO(rs.getString(3));
				dto.setcus_title(rs.getString(4));
				dto.setCUS_CONTENT(rs.getString(5));
				dto.setCUS_REGDATE(rs.getString(6));
				dto.setCUS_SUMGOOD(rs.getString(7));
				dao.getimg(dto,con);

				list.add(dto);
				
		}
		JdbcUtil.close(rs);
		return list;
	}
}
