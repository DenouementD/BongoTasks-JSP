<%--
  Created by IntelliJ IDEA.
  User: terry
  Date: 11/30/2022
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deletion Confirmation</title>
</head>

<body>
<h1>
    <%= "Deletion Confirmation" %>
</h1>

    Are you sure you want to delete this task? <br> <br>
<tr>
    <th><input type="button" id=b3 value="Delete" name="button" onClick='submitForm(this)'/></th>
</tr>
<form method="post" action="taskDashboard.jsp">
    <input type="submit" value="Confirm Deletion">
</form>
<%--<button> Confirm Deletion </button>--%>
</body>
</html>
