<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                </tr>
                <tr>
                    <td class="table-checkbox">
                        <input type="checkbox"/>
                    </td>
                    <td>
                        Task name
                    </td>
                    <td>
                        Task description
                    </td>
                </tr>
            </table>
        </div>
        <br/>
        <div class="add-task-container">
            <button class="add-task-btn">Add Task</button>
        </div>
    </body>
</html>