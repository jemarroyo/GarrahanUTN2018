package p2018.backend.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import p2018.backend.entities.OrderInfo;
import p2018.backend.exceptions.GarrahanAPIException;

public class OrderInfoSpecification implements Specification<OrderInfo> {
	

	private static final long serialVersionUID = -8040950528007195293L;
	
	private SearchCriteria criteria;
	
	@Override
    public Predicate toPredicate
      (Root<OrderInfo> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		
		try {
		
	        if (criteria.getOperation().equalsIgnoreCase(">")) {
	        	if(criteria.getKey() == "creationDate") {
	        		Date dateParam = dateFormat.parse(criteria.getValue().toString());
	        		return builder.greaterThanOrEqualTo(
	        				root.<java.sql.Date>get(criteria.getKey()), dateParam);
	        	} else {
	        		return builder.greaterThanOrEqualTo(
	        				root.<String> get(criteria.getKey()), criteria.getValue().toString());
	        	}
	        } 
	        else if (criteria.getOperation().equalsIgnoreCase("<")) {
	        	if(criteria.getKey() == "creationDate") {
	        		Date dateParam = dateFormat.parse(criteria.getValue().toString());
	        		return builder.lessThanOrEqualTo(
	        	              root.<java.sql.Date>get(criteria.getKey()), dateParam);
	        	} else {
	            return builder.lessThanOrEqualTo(
	              root.<String> get(criteria.getKey()), criteria.getValue().toString());
	        	}
	        } 
	        else if (criteria.getOperation().equalsIgnoreCase(":")) {
	            if (root.get(criteria.getKey()).getJavaType() == String.class && !criteria.getKey().equals("statusId")) {
	                return builder.like(
	                  root.<String>get(criteria.getKey()), "%" + criteria.getValue() + "%");
	            } else {
	                return builder.equal(root.get(criteria.getKey()), criteria.getValue());
	            }
	        }
        
		}catch (ParseException e) {
			throw new GarrahanAPIException("Error parsing date parameter from request", e);
		}
		
        return null;
    }

	public OrderInfoSpecification(SearchCriteria criteria) {
		this.criteria = criteria;
	}
	
	
}
