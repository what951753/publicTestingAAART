package tw.group4._03_.input.Calendar;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

public class CreateShopCalendarTable {

	private DataSource dataSource;

	public DataSource getDataSource() {// 只需get因為只要用不希望被改

		// lazy init，能有多晚用到就多晚產生，放constructor會先產出佔用記憶體
		if (dataSource == null) { // 不希望重複產生，
			BasicDataSource ds = new BasicDataSource();
			ds.setDriverClassName("oracle.jdbc.OracleDriver");
			ds.setUrl("jdbc:oracle:thin:@//localhost:1521/xepdb1");
			ds.setUsername("group4");
			ds.setPassword("oracle");
			ds.setMaxTotal(50);
			ds.setMaxIdle(50);

			dataSource = ds; // 把BasicDataSource放在屬性上
		}
		return dataSource;
	}
	
	public void dropShopCalendarTable() {
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();
			
		    String sql = "DROP TABLE CS_CALENDAR_TABLE CASCADE CONSTRAINTS";
	    
		    stmt.executeUpdate(sql);
		    System.out.println("預約行事歷表格已刪除");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void createShopCalendarTable(){
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();
		     
			String sql = "CREATE TABLE CS_CALENDAR_TABLE "
					+ "(CALENDARNO NUMBER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) PRIMARY KEY NOT NULL,  "
					+ "SHOPID NUMBER REFERENCES CS_CREATIVE_SHOP_TABLE(SHOPID), "
					+ "SHOPNAME VARCHAR2(1000 BYTE), "
					+ "MEMBERID NUMBER, "
					+ "YEAR NUMBER(8,0), "
					
					+ "MONTH NUMBER(8,0), "
					+ "DAY NUMBER(8,0), "
					+ "PERMISSION NUMBER(8,0), "
					+ "MAXIMUM NUMBER(8,0), "
					+ "DATETIME VARCHAR2(80), "
					
					+ "STARTTIME VARCHAR2(80), "
					+ "ENDTIME VARCHAR2(80), "
					+ "NOTE VARCHAR2(4000 BYTE))";
		    
		    stmt.executeUpdate(sql);
		    System.out.println("預約行事歷表格已建立");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
