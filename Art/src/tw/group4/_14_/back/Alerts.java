package tw.group4._14_.back;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ALERTSCENTER")
public class Alerts {
	
	@Id
	@Column(name = "ALERTNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int  aleartNo;
	
	@Column(name = "LINK")
	private String link;
	
	@Column(name = "ICON")
	private String icon;
	
	@Column(name = "TIME")
	private Date time;
	
	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "CONTENTAC")
	private String contentAC;

	
	
	
	public Alerts() {
	}

	public Alerts(int aleartNo, String link, String icon, Date time, String type, String contentAC) {
		this.aleartNo = aleartNo;
		this.link = link;
		this.icon = icon;
		this.time = time;
		this.type = type;
		this.contentAC = contentAC;
	}

	public int getAleartNo() {
		return aleartNo;
	}

	public void setAleartNo(int aleartNo) {
		this.aleartNo = aleartNo;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContentAC() {
		return contentAC;
	}

	public void setContentAC(String contentAC) {
		this.contentAC = contentAC;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	

}
