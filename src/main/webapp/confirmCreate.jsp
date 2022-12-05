<%--
  Created by IntelliJ IDEA.
  User: putty
  Date: 5/12/2022
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Task Created</title>
        <style>
            html, body {
                height: 100vh;

            }

            button {
                cursor: pointer;
            }

            .main {
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body class="main">

        <h1>Task Created Successfully!</h1>
        <div>
            <p>Task Name: <span>${newTask.taskName}</span></p>
            <p>Task Name: <span>${newTask.taskDesc}</span></p>
        </div>
        <p></p>
        <button onclick="location.href='taskDashboard.jsp'">Return to Task Dashboard</button>
    </body>
</html>
