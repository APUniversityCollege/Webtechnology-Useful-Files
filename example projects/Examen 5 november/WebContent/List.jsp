<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="edu.ap.rest.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.*" %>
<%
	ArrayList<String> list = new ArrayList<String>();
	String allDocs = CouchDBClient.get("_all_docs?include_docs=true");
	JSONObject obj1 = new JSONObject(allDocs);
	JSONArray array = obj1.getJSONArray("rows");
	for(int i = 0; i < array.length(); i++) {
		JSONObject obj2 = array.getJSONObject(i);
		JSONObject obj3 = obj2.getJSONObject("doc");
		list.add(obj3.getString("punten") + ";" + obj3.getString("achternaam") + ";" + obj3.getString("voornaam"));
	}
	// quick and dirty :-)
	// met de punten als eerste veld werkt dit perfect...
	Collections.sort(list);
%>

		<html>
		<body>
			<center>
			<h2>Puntenlijst</h2>
			<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<td><b>Naam</b></td>
				<td><b>Voornaam</b></td>
				<td><b>Punten</b></td>
			</tr>
<%
				for(String s : list) {
					String[] temp = s.split(";");
%>
					<tr>
				  	<td><%=temp[1] %></td>
				  	<td><%=temp[2] %></td>
				  	<td><%=temp[0] %></td>
					</tr>
<%
				}
%>
			</table>
			</center>
		</body>
	</html>