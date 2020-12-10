package tw.group4._18_.buyer.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class CourseOrderItems {
	
	@Id @Column(name = "ORDERIDCO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderIdCo;
	
	@Transient
	private int orderNoCo;
	
	@Column(name = "COURSETITLECO")
	private String courseTitle;
	
	@Column(name = "COURSENUMCO")
	private int courseNum;
	
	@Column(name = "COURSEPRICECO")
	private int coursePrice;
	
	@ManyToOne
	@JoinColumn(name = "ORDERNOCO")
	private CourseOrders courseOrders;
	
	
	public CourseOrderItems() {
		
	}


	public CourseOrderItems(String courseTitle, int courseNum, int coursePrice) {
		super();
		this.courseTitle = courseTitle;
		this.courseNum = courseNum;
		this.coursePrice = coursePrice;
	}
	
	public CourseOrderItems(int orderIdCo, int orderNoCo, String courseTitle, int courseNum, int coursePrice,
			CourseOrders courseOrders) {
		
		this.orderIdCo = orderIdCo;
		this.orderNoCo = orderNoCo;
		this.courseTitle = courseTitle;
		this.courseNum = courseNum;
		this.coursePrice = coursePrice;
		this.courseOrders = courseOrders;
	}



	public int getOrderIdCo() {
		return orderIdCo;
	}


	public void setOrderIdCo(int orderIdCo) {
		this.orderIdCo = orderIdCo;
	}


	public int getOrderNoCo() {
		return orderNoCo;
	}


	public void setOrderNoCo(int orderNoCo) {
		this.orderNoCo = orderNoCo;
	}


	public String getCourseTitle() {
		return courseTitle;
	}


	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}


	public int getCourseNum() {
		return courseNum;
	}


	public void setCourseNum(int courseNum) {
		this.courseNum = courseNum;
	}


	public int getCoursePrice() {
		return coursePrice;
	}


	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}


	public CourseOrders getCourseOrders() {
		return courseOrders;
	}


	public void setCourseOrders(CourseOrders courseOrders) {
		this.courseOrders = courseOrders;
	}
	
	
	
	

}
