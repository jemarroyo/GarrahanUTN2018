package p2018.test;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.JsonNodeType;

import p2018.backend.exceptions.GarrahanAPIException;
import p2018.backend.utils.OrderInfoSpecification;
import p2018.backend.utils.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
public class ParseFilterRequest {
	
	private String filter = "{\"where\":{\"and\":[{\"institutionId\":5},{\"statusId\":\"PENDIENTE\"},{\"priorityId\":2}]},\"skip\":0,\"limit\":20,\"order\":[\"lastModified DESC\"],\"include\":[{\"units\":{\"type\":true}},{\"status\":true},{\"priority\":true},{\"owner\":true},{\"institution\":true}]}";
	
	private String filter_2 = "{\"where\":{\"institutionId\":\"5\"},\"limit\":5,\"order\":[\"creationDate DESC\"]}";
	
	private String filter_3 = "{\"where\":{\"and\":[{\"code\":{\"regexp\":\".*xucHQNny.*\"}}]},\"skip\":0,\"limit\":20,\"order\":[\"lastModified DESC\"],\"include\":[{\"units\":{\"type\":true}},{\"status\":true},{\"priority\":true},{\"owner\":true},{\"institution\":true}]}";
	
	private String filter_4 = "{\"where\":{\"and\":[{\"or\":[{\"creationDate\":\"2018-12-01T03:00:00.000Z\"},{\"creationDate\":{\"gt\":\"2018-12-01T03:00:00.000Z\"}}]},{\"or\":[{\"creationDate\":\"2019-02-11T03:00:00.000Z\"},{\"creationDate\":{\"lt\":\"2019-02-11T03:00:00.000Z\"}}]}]},\"skip\":0,\"limit\":20,\"order\":[\"lastModified DESC\"],\"include\":[{\"units\":{\"type\":true}},{\"status\":true},{\"priority\":true},{\"owner\":true},{\"institution\":true}]}";
	
	private String filter_5 = "{\"where\":{\"institutionId\":5},\"skip\":0,\"limit\":20,\"order\":[\"lastModified DESC\"],\"include\":[{\"units\":{\"type\":true}},{\"status\":true},{\"priority\":true},{\"owner\":true},{\"institution\":true}]}";
	
	@Test
	public void ParseFilter(){
		
		ObjectMapper mapper = new ObjectMapper();
		Specification value = null;
		
		try {
			JsonNode actualTree = mapper.readTree(filter_5);
			//JsonNode whereTree = actualTree.get("where");
			Iterator<JsonNode> i = this.fetchFilterParameter(actualTree.toString());
			Integer checkPosition = 0;
			
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
					code = "%" + code + "%";
							
					OrderInfoSpecification spec = new OrderInfoSpecification(new SearchCriteria("code", "like", code));
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
			
			assertTrue(!actualTree.equals(null));
			assertNotEquals(null, value);
			
		} catch (IOException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
	}
	
	private Iterator<JsonNode> fetchFilterParameter(String filter) {
		
		 String result = filter;
		 Iterator<JsonNode> iterator = null;
		 
		 try {
			 
			 ObjectMapper mapper = new ObjectMapper();
			 
			 if(filter.contains("and")) {
				 result = result.replace("{\"and\":", "");
				 result = result.replace("]},", "],");
				 result = result.replace("\"{\"where", "{\"where");
			 }
			 
			 if(filter.contains("or")) {
				 result = result.replace("[{\"or\":[", "");
				 result = result.replace("", "");
			 }
			 
			 JsonNode node = mapper.readTree(result);
			 JsonNode whereNode = node.get("where");
			 iterator = whereNode.elements();
			 
		} catch (IOException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		 
		return iterator;
	}
	
	public void testJsonParser() {
		
		JSONObject resobj;
		try {
			resobj = new JSONObject(filter);
			Iterator<?> keys = resobj.keys();
			while(keys.hasNext() ) {
			    String key = (String)keys.next();
			    if ( resobj.get(key) instanceof JSONObject ) {
			        JSONObject wereNode = new JSONObject(resobj.get(key).toString());
			        Iterator<?> levelKeys = wereNode.keys();
			        while(levelKeys.hasNext() ) {
			        	String key2 = (String)levelKeys.next();
			        	if ( wereNode.get(key2) instanceof JSONObject ) {
			        		JSONObject filterNode = new JSONObject(wereNode.get(key2).toString());
			        		
			        		System.out.println("res1: " + filterNode.getString("institutionId"));
					        System.out.println("res2: " + filterNode.getString("statusId"));
			        	}	
			        }
			    }
			}
		} catch (JSONException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		
	}
	

	public void ParseDateTest() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		Date dateParsed = null;
		Calendar cal = Calendar.getInstance();
		try {
			dateParsed = dateFormat.parse("2019-02-01T03:00:00.000Z");
			cal.setTime(dateParsed);
			cal.add(Calendar.MONTH, 1);
			Date endDate = cal.getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertTrue(!dateParsed.equals(null));
	}
}
