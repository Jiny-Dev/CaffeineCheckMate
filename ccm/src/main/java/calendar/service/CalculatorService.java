package calendar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import calendar.dao.CalendarDao;
import calendar.dto.Calendar;
import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import connection.ConnectionProvider;
import global.function.CCMFunctions;
import jdbc.JdbcUtil;
import mypage.dao.ProfileDao;

public class CalculatorService {
	
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	CalendarDao calendarDao = new CalendarDao();
	ProfileDao profileDao = new ProfileDao();
	
	public void calculate(int memberNo, int coffeeNo) {
		Connection conn = null;
		Coffee coffee = null;
		Calendar todaysCaffeine = null;
		Date date = new Date(System.currentTimeMillis());
		int caffeine = 0;
		String color;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int weight = profileDao.getWeight(memberNo, conn);
			
			//커피제품에서 커피넘버로 커피정보 찾아 카페인양 구하기
			coffee = coffeeListDao.selectByCoffeeNo(coffeeNo, conn);
			caffeine = coffee.getC_CAFFEINE();
			
			//저장되어있는 하루섭취량 찾기
			todaysCaffeine = calendarDao.getTodaysRecord(memberNo, date, conn);
			
			if (todaysCaffeine != null) {
				//저장되어있는 섭취량이 있을 경우
				//저장되어있는 섭취량을 가져와 선택한 커피의 카페인양과 합산 => 오늘 섭취량
				caffeine +=  todaysCaffeine.getCAL_DAILYCF();
				color = CCMFunctions.ColorFn(caffeine, weight);
				
				//새로 얻은 오늘 섭취량을 캘린더에 저장
				calendarDao.recordCaffeine(todaysCaffeine.getCAL_DATE(), memberNo, caffeine,color, conn);

			} else {
				//저장되어있는 섭취량이 없을 경우
				//선택한 커피의 카페인양을 오늘 섭취량에 저장
				color = CCMFunctions.ColorFn(caffeine, weight);
				calendarDao.createTodaysRecord(date, memberNo, caffeine, color, conn);
			}
			conn.commit();
		} catch (SQLException e){
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
