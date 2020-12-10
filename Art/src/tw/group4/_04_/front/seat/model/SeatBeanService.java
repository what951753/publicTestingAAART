package tw.group4._04_.front.seat.model;

import java.util.Map;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group4._04_.back.cmsAct.model.ShowBean;
import tw.group4._04_.back.cmsAct.model.ShowBeanDAO;

@Service
public class SeatBeanService {

	private SeatBeanDAO seatBeanDAO;

	@Autowired
	public SeatBeanService(SeatBeanDAO seatBeanDAO) {
		this.seatBeanDAO = seatBeanDAO;
	}
	// BEAN查詢
	public SeatBean selectBean(int actno) {
		
		return (SeatBean) seatBeanDAO.selectBean(actno);
	}

	// 新增
	public SeatBean insert(SeatBean seatBean) {
		return seatBeanDAO.insert(seatBean);
	}

	// 查詢
	public Map<String, Integer> select(int actno) {
		return seatBeanDAO.select(actno);
	}

	// 修改
	public SeatBean updateSeatnum(Integer actno,Integer seatnum) {
		return seatBeanDAO.updateSeatnum(actno, seatnum);
	}

	// 刪除
	public boolean delete(int actno) {;
		return  seatBeanDAO.delete(actno);
	}
	//插入座位
	public Boolean insert4Seat(String[] seats,String actno) {
		
		return seatBeanDAO.insert4Seat(seats,actno);
	}

	public Boolean insert3Seat(String[] seats,String actno) {

		return seatBeanDAO.insert3Seat(seats, actno);
	}

	public Boolean insert2Seat(String[] seats,String actno) {

		return seatBeanDAO.insert2Seat(seats,actno);
	}

	public Boolean insert1Seat(String[] seats,String actno) {
		
		return seatBeanDAO.insert1Seat(seats,actno);
	}
	//刪除座位
	public Boolean delete4Seat(String[] seats,String actno) {
		
		return seatBeanDAO.delete4Seat(seats,actno);
	}

	public Boolean delete3Seat(String[] seats,String actno) {

		return seatBeanDAO.delete3Seat(seats, actno);
	}

	public Boolean delete2Seat(String[] seats,String actno) {

		return seatBeanDAO.delete2Seat(seats,actno);
	}

	public Boolean delete1Seat(String[] seats,String actno) {
		
		return seatBeanDAO.delete1Seat(seats,actno);
	}
	
	public SeatBean update(
			 Integer actno,
			 Integer seatnum,
			 Integer A1,
			 Integer A2,
			 Integer A3,
			 Integer A4,
			 Integer A5,
			 Integer A6,
			 Integer A7,
			 Integer A8,
			 Integer A9,
			 Integer A10,
			 Integer B1,
			 Integer B2,
			 Integer B3,
			 Integer B4,
			 Integer B5,
			 Integer B6,
			 Integer B7,
			 Integer B8,
			 Integer B9,
			 Integer B10,
			 Integer C1,
			 Integer C2,
			 Integer C3,
			 Integer C4,
			 Integer C5,
			 Integer C6,
			 Integer C7,
			 Integer C8,
			 Integer C9,
			 Integer C10,
			 Integer D1,
			 Integer D2,
			 Integer D3,
			 Integer D4,
			 Integer D5,
			 Integer D6,
			 Integer D7,
			 Integer D8,
			 Integer D9,
			 Integer D10,
			 Integer E1,
			 Integer E2,
			 Integer E3,
			 Integer E4,
			 Integer E5,
			 Integer E6,
			 Integer E7,
			 Integer E8,
			 Integer E9,
			 Integer E10) {
		
		return seatBeanDAO.update(
				actno,seatnum,
				A1,	A2,	A3,	A4,	A5,	A6,	A7,	A8,	A9,	A10,
				B1,	B2,	B3,	B4,	B5,	B6,	B7,	B8,	B9,	B10,
				C1,	C2,	C3,	C4,	C5,	C6,	C7,	C8,	C9,	C10,
				D1,	D2,	D3,	D4,	D5,	D6,	D7,	D8,	D9,	D10,
				E1,	E2,	E3,	E4,	E5,	E6,	E7,	E8,	E9,	E10
				);
	}
	
	public  Integer search1seat(String seat, int actno) {

		
		return  seatBeanDAO.search1seat(seat, actno);
	}

}
