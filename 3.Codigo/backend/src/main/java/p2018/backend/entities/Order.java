package p2018.backend.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Orders")
public class Order {

	public Order() {
		super();
	}

	public Order(String code, String carrier) {
		this.code = code;
		this.carrier = carrier;
	}

	@Id
	@GeneratedValue
	private Long id;

	private String code;
	private String carrier;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", code=" + code + ", carrier=" + carrier + "]";
	}
	
	

}
