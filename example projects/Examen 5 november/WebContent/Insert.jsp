<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="edu.ap.rest.*" %>
<%@ page import="org.json.*" %>
<%
	if(request.getParameter("action") != null) {
		JSONObject obj = new JSONObject();
		obj.put("achternaam", request.getParameter("achternaam"));
		obj.put("voornaam", request.getParameter("voornaam"));
		obj.put("punten", Integer.parseInt(request.getParameter("punten")));
		CouchDBClient.post(obj.toString());
	}
%>

<html>
<head>
	<title>Studenten toevoegen</title>
</head>
	<body>
	<center>
	<form action="Insert.jsp" method="post">
	<input type="hidden" name="action" value="post">
	<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table>
				<tr>
				<td colspan="3" align="center">
				<h2>Voeg studenten toe</h2></td>
				</tr>
				<tr>
				<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
				<td>Naam :</td>
				<td><input name="achternaam" type="text" size="50"></td>
				</tr>
				<tr>
				<td>Voornaam:</td><td><input name="voornaam" type="text" size="50"></td>
				</tr>
				<tr>
				<td>Punten:</td><td><input name="punten" type="text" size="10"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="Ok"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	</center>
	</body>
</html>
