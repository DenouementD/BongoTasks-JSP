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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI";
        }

        body {
            color: white;
            padding: 10px;
            background: #0D1117;
        }

        button {
            cursor: pointer;
        }

        .topbar {
            display: flex;
            flex-direction: row;
            max-width: 75%;
            justify-content: space-between;
            padding: 25px 0 20px 0;
            margin: auto;
        }


        .input-button {
            height: 50px;
            width: 8em;
            outline: none;
            color: white;
            border: none;
            font-size: 20px;
            font-weight: 500;
            border-radius: 5px;
            letter-spacing: 1px;
            background-color: #2e9f43;
        }

        .bongo-cat {
            height: 4ch;
        }

        .title {
            padding: 0 16px;
        }

        .title-flex {
            display: flex;
            align-items: center;
        }

        .container-bg {
            display: flex;
            max-width: 75%;
            width: 100%;
            padding: 0 25px 0 25px;
            border-radius: 10px;
            background: #161B22;
            outline: 2px solid #30363d;
            align-items: center;
            justify-content: center;
            margin: auto;
            filter: drop-shadow(0 0 6px black);
        }

        .task-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            width: 100%;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #101318;
        }

        .centered-table {
            text-align: center;
        }

        .task-table th {
            background-color: #202731;
            padding: 10px;
            font-size: 15px;
        }

        .task-table td {
            padding: 10px;
        }

        .table-button {
            background-color: Transparent;
            background-repeat: no-repeat;
            border: none;
            color: white;
            font-size: 2em;
        }

        .table-checkbox {
            transform: scale(2);
        }

        .table-task {
            font-size: 15px;
            font-weight: 600;
        }

        .edit-button:hover {
            color: #2e9f43;
        }

        .delete-button:hover {
            color: #da3633;
        }
    </style>
    <head>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>BongoTasks</title>
    </head>
    <body>
        <div class="topbar">
            <div class="title-flex">
                <img class="bongo-cat"
                     src="https://cdn.discordapp.com/attachments/1033251577609342988/1049237421121880124/bongo-cat-drum.gif"/>
                <h1 class="title">
                    BongoTasks
                </h1>
            </div>
            <button
                    class="input-button"
                    type="submit"
                    onclick="location.href='createTaskForm.jsp'"
            >
                <i class="fa fa-plus-circle" aria-hidden="true"></i> Add Task
            </button>
        </div>
        <div class="container-bg">
            <table class="task-table">
                <tr>
                    <th>Status</th>
                    <th>Task</th>
                    <th>Description</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${taskList}" var="task">
                    <tr>
                        <td class="centered-table" width="50px">
                            <input
                                    class="table-checkbox"
                                    type="checkbox"
                                    value="Status"
                                ${task.status ? "checked" : ""}
                            />
                        </td>
                        <td class="table-task" width="200px">
                                ${task.name}
                        </td>
                        <td>
                                ${task.description}
                        </td>
                        <td class="centered-table" width="20px">
                            <form action="TaskServlet/fillTask" method="post">
                                <button class="table-button" type="submit" name="edit-id" value=${task.id}>
                                    <i class="fa fa-pencil-square-o edit-button" aria-hidden="true"></i>
                                </button>
                            </form>
                        </td>
                        <td class="centered-table" width="20px">
                            <form method="post" action="confirmDelete.jsp">
                                <button class="table-button" type="submit" value="Delete Task">
                                    <i class="fa fa-trash delete-button" aria-hidden="true"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
