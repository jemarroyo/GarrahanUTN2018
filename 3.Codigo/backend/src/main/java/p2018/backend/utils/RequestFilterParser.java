package p2018.backend.utils;

import java.io.IOException;
import java.util.Iterator;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.JsonNodeType;

import p2018.backend.exceptions.GarrahanAPIException;

/**
 * This is a support class to handle the filter request parameter from the front end.
 * 
 * @author gmolina
 *
 */
@Component
public class RequestFilterParser {
	
	public RequestFilterParser() {
		
	}

	
	/**
	 * Create and prepare the conditions to return a page from the source data.
	 * @param filter
	 * @return Pageable object to be used by the JPA Repository
	 */
	public Pageable createPageRequest(String filter) {
		
		Pageable page = null;
		try {
			ObjectMapper mapper = new ObjectMapper();
		    JsonNode actualTree = mapper.readTree(filter);
		    Integer skip;
		    if(actualTree.get("skip") == null) {
		    	skip = 0;
		    }else {
		    	skip = actualTree.get("skip").asInt();
		    }
		    Integer limit = actualTree.get("limit").asInt();
		    Integer pageNumber = skip / limit + (skip % limit == 0 ? 0 : 1);
		    
		    page = new PageRequest(pageNumber, limit, Sort.Direction.DESC, "lastModified");
		    
		} catch (Exception e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		return page;
	}

	
	/**
	 * This function parses the json filter string and handle specifics parameters for OrderInfo entity
	 * @param filter
	 * @return
	 */
	public Specification crateOrderSpecification(String filter) {
		
		ObjectMapper mapper = new ObjectMapper();
		Specification value = null;
		
		try {
			JsonNode actualTree = mapper.readTree(filter);
			Iterator<JsonNode> i = this.fetchFilterParameter(actualTree.toString());
			Integer checkPosition = 0;
			
			if(!i.toString().contains("where") && i.toString().contains("institutionId")) {
				JsonNode jsonNode = (JsonNode) i.next();
				Long institutionId = new Long(jsonNode.get("institutionId").asInt());
				OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("institutionId", ":", institutionId));
				return Specification.where(spec);
			}
			
			while (i.hasNext()) {
				JsonNode jsonNode = (JsonNode) i.next();
				
				if(jsonNode.get("institutionId") != null) {
					Long institutionId = new Long(jsonNode.get("institutionId").asInt());
					OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("institutionId", ":", institutionId));
					if(checkPosition == 0) {
						value = Specification.where(spec);
					}else{
						value = value.and(spec);
					}
					checkPosition++;
				}
				
				if(jsonNode.get("statusId") != null) {
					String statusId = jsonNode.get("statusId").toString();
					statusId = statusId.replace("\"", "");
					OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("statusId", ":", statusId));
					if(checkPosition == 0) {
						value = Specification.where(spec);
					}else{
						value = value.and(spec);
					}
					checkPosition++;
				}
				
				if(jsonNode.get("priorityId") != null) {
					Long priorityId = new Long(jsonNode.get("priorityId").asInt());
					OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("priorityId", ":", priorityId));
					if(checkPosition == 0) {
						value = Specification.where(spec);
					}else{
						value = value.and(spec);
					}
					checkPosition++;
				}
				
				if(jsonNode.get("code") != null) {
					String code = jsonNode.get("code").toString();
					
					code = code.replace("{\"regexp\":\".*", "");
					code = code.replace(".*\"}", "");
					//code = "%" + code + "%";
							
					OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("code", ":", code));
					if(checkPosition == 0) {
						value = Specification.where(spec);
					}else{
						value = value.and(spec);
					}
					checkPosition++;
				}
				
				if(jsonNode.getNodeType().equals(JsonNodeType.NUMBER)) {
					Long institutionId = new Long(jsonNode.asLong());
					OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("institutionId", ":", institutionId));
					if(checkPosition == 0) {
						value = Specification.where(spec);
					}else{
						value = value.and(spec);
					}
					checkPosition++;
				}
				
			}
			
		} catch (IOException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		return value;
	}
	
	/**
	 * This function helps to fix the json string to be valid for the JsonNode
	 * and be iterated by the crateOrderSpecification method
	 * @param filter
	 * @return Iterator<JsonNode>
	 */
	private Iterator<JsonNode> fetchFilterParameter(String filter) {
		
		 String result = null;
		 Iterator<JsonNode> iterator = null;
		 
		 try {
			 
			 ObjectMapper mapper = new ObjectMapper();
			 
			 if(filter.contains("and")) {
				 result = filter.replace("{\"and\":", "");
				 result = result.replace("]},", "],");
				 result = result.replace("\"{\"where", "{\"where");
			 } else {
				 result = filter;
			 }
			 
			 JsonNode node = mapper.readTree(result);
			 JsonNode whereNode = node.get("where");
			 iterator = whereNode.elements();
			 
		} catch (IOException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		 
		return iterator;
	}
}
