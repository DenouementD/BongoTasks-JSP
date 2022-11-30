<%--
  Created by IntelliJ IDEA.
  User: putty
  Date: 30/11/2022
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Create a Task</title>
    </head>

    <body>
        <form>
            <label for="taskName">Task Name</label>
            <input type="text" id="taskName" name="taskName" placeholder="Task Name">
            <br>

            <label for="taskDesc">Task Description</label>
            <textarea id="taskDesc" name="taskDesc" placeholder="Task Description" rows="10"> </textarea>
            <br>

            <input type="submit" value="Submit">
        </form>
    </body>
</html>
