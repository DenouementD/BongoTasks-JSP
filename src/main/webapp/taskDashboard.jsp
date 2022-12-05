<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 1/12/2022
  Time: 7:29 pm
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>BongoTasks</title>
    </head>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid black;
        }

        table,
        td {
            text-align: center;
            border: 1px solid black;

        }

        th {
            background-color: #333;
            color: #fff;
        }

        .title {
            padding: 0 16px;
        }

        .table-container {
            padding: 0 16px;
        }

        .table-checkbox {
            width: 10%;
        }

        .add-task-container {

            padding-right: 16px;
            display: flex;
            justify-content: end;
        }
    </style>
    <body>
        <h1 class="title">Tasks</h1>
        <div class="table-container">
            <table>
                <tr>
                    <th>Completed</th>
                    <th>Task</th>
                    <th>Description</th>
                    <th>Edit</th>
                    <th>Delete Task</th>
                </tr>
                <c:forEach items="${taskList}" var="task">
                    <tr>
                        <td class="table-checkbox" width="50px">
                            <input type="checkbox" value="Status" ${task.status ? "checked" : ""}/>
                        </td>
                        <td>
                                ${task.taskName}
                        </td>
                        <td>
                                ${task.taskDesc}
                        </td>
                        <td>
                            <button onclick="location.href='editTaskForm.jsp'">Edit</button>
                        </td>
                        <td width="100px">
                            <form method="post" action="confirmDelete.jsp">
                                <input type="submit" value="Delete Task">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br/>
        <div class="add-task-container">
            <button onclick="location.href='createTaskForm.jsp'">Add Task</button>
        </div>
    </body>
</html>
