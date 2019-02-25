package p2018.backend.utils;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import p2018.backend.exceptions.GarrahanAPIException;

/**
 * This is a support class to handle the filter request parameter from the front end.
 * 
 * @author gmolina
 *
 */
@Component
public class RequestFilterParser {
	
	private Specification specification;
	
	/**
	 * Class constructor
	 */
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
	 * Parse the request json recursively 
	 * @param input
	 * @throws JSONException
	 */
	private void loopThroughJson(Object input) throws JSONException {
        
		if (input instanceof JSONObject) {
            Iterator<?> keys = ((JSONObject) input).keys();
            while (keys.hasNext()) {
                String key = (String) keys.next();
                if (!(((JSONObject) input).get(key) instanceof JSONArray))
                	buildSpecification(key, ((JSONObject) input).get(key).toString());
                else
                    loopThroughJson(new JSONArray(((JSONObject) input).get(key).toString()));
            }
        }
		
        if (input instanceof JSONArray) {
            for (int i = 0; i < ((JSONArray) input).length(); i++) {
                JSONObject a = ((JSONArray) input).getJSONObject(i);
                Object key = a.keys().next().toString();
                if (!(a.opt(key.toString()) instanceof JSONArray))
                	buildSpecification(key.toString(), a.opt(key.toString()).toString());
                else
                    loopThroughJson(a.opt(key.toString()));
            }
        }

    }
	
	/**
	 * Builds the all possible OrderSpecification filter to be used by JPA
	 * @param key
	 * @param value
	 */
	private void buildSpecification(String key, String value) {
		
		OrderInfoSpecification spec = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		
		try {
			
			if(key.equals("code")) {
				
				String code = value;
				
				code = code.replace("{\"regexp\":\".*", "");
				code = code.replace(".*\"}", "");
				code = "%" + code + "%";
						
				spec = new OrderInfoSpecification(new SearchCriteria("code", "like", code));
				
			} else if(key.equals("statusId")) {
				
				String statusId = value;
				spec = new OrderInfoSpecification(new SearchCriteria("statusId", ":", statusId));
			
			} else if(key.equals("creationDate")) {
				
				if(value.contains("gt")) { 
					String param = value.replace("{\"gt\":\"", "");
					param = param.replace("}", "");
					Date initDate = dateFormat.parse(param);
					spec = new OrderInfoSpecification(new SearchCriteria("creationDate", ">", param));
					
				}
				
				if(value.contains("lt")) {
					String param = value.replace("{\"lt\":\"", "");
					param = param.replace("}", "");
					Date endDate = dateFormat.parse(param);
					spec = new OrderInfoSpecification(new SearchCriteria("creationDate", "<", param));
					
				}
				
			} else {
				
				Long numberValue = new Long(value);
				spec = new OrderInfoSpecification(new SearchCriteria(key, ":", numberValue));
			}
			
			if (spec != null) {
				
				if ( specification == null) {
					
					specification = Specification.where(spec);
					
				}else {
					
					specification = specification.and(spec);
				}
			}
			
		}catch (Exception e) {
			throw new GarrahanAPIException("Error building Specification filter from request", e);
		}
	}

	
	/**
	 * This function parses the json filter string and handle specifics parameters for OrderInfo entity
	 * @param filter
	 * @return
	 */
	public Specification crateOrderSpecification(String filter) {
		
		ObjectMapper mapper = new ObjectMapper();
		specification = null;
		
		try {
			
			JsonNode actualTree = mapper.readTree(filter);
			loopThroughJson(new JSONObject(actualTree.get("where").toString()));
			
		} catch (IOException | JSONException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		
		return specification;
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
	
	public JsonNode parseGenericBodyRequest(String request) {
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = null;
		
		try {
			jsonNode = mapper.readTree(request);
		}catch (Exception e) {
			throw new GarrahanAPIException("Error parsing request.", e);
		}
		
		return jsonNode;
	}
}
