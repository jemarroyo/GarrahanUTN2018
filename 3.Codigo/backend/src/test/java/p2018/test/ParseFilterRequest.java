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

import org.json.JSONArray;
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
	
	private String filter_6 = "{\"where\":{\"institutionId\":\"6\"},\"limit\":5,\"order\":[\"creationDate DESC\"]}";
	
	private String filter_7 = "{\"where\":{\"and\":[{\"id\":\"000117\"},{\"code\":{\"regexp\":\".*999.*\"}},{\"institutionId\":5},{\"statusId\":\"RECHAZADA\"},{\"priorityId\":1},{\"or\":[{\"creationDate\":\"2019-02-20T03:00:00.000Z\"},{\"creationDate\":{\"gt\":\"2019-02-20T03:00:00.000Z\"}}]},{\"or\":[{\"creationDate\":\"2019-02-22T03:00:00.000Z\"},{\"creationDate\":{\"lt\":\"2019-02-22T03:00:00.000Z\"}}]}]},\"skip\":0,\"limit\":20,\"order\":[\"lastModified DESC\"],\"include\":[{\"units\":{\"type\":true}},{\"status\":true},{\"priority\":true},{\"owner\":true},{\"institution\":true}]}";
	
	private Specification specification = null;
	

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
	
	
	public void checkRequest() {
		
		ObjectMapper mapper = new ObjectMapper();
		String institutionId = null;
		
		try {
			
			JsonNode actualTree = mapper.readTree(filter);
			institutionId = actualTree.get("institutionId").toString();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertTrue(!institutionId.equals(null));
	}
	
	@Test
	public void ParserFilter_3() {
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			JsonNode actualTree = mapper.readTree(filter_7);
			loopThroughJson(new JSONObject(actualTree.get("where").toString()));
			
	    } catch (JSONException | IOException e) {
	    	e.printStackTrace();
	    }
		
		System.out.println("Specification: " + specification.toString());
		
		assertTrue(this.specification != null);
		
	}
	
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
	
	private void buildSpecification(String key, String value) {
		
		OrderInfoSpecification spec = null;
		
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
				
				spec = new OrderInfoSpecification(new SearchCriteria("creationDate", ">", value));
				
			}
			
			if(value.contains("lt")) {
				
				spec = new OrderInfoSpecification(new SearchCriteria("creationDate", "<", value));
				
			}
			
		} else {
			
			Long numberValue = new Long(value);
			spec = new OrderInfoSpecification(new SearchCriteria(key, ":", numberValue));
		}
		
		if ( specification == null) {
			
			specification = Specification.where(spec);
			
		}else {
			
			specification = specification.and(spec);
		}
	}
}
