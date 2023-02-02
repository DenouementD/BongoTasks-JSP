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
        <link rel="icon" type="image/x-icon"
              href="https://cdn.discordapp.com/attachments/1033251577609342988/1049237421121880124/bongo-cat-drum.gif">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Segoe UI"
            }

            body {
                color: white;
                display: flex;
                height: 100vh;
                justify-content: center;
                align-items: center;
                background: #0D1117;
                padding: 10px;
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
                gap: 20px;
            }

            .input-button {
                margin-top: 5px;
                height: 3em;
                width: 40%;
                outline: none;
                color: white;
                border: none;
                font-size: 20px;
                font-weight: 500;
                border-radius: 5px;
                letter-spacing: 1px;
                background-color: #30363d;
            }
        </style>
    </head>
    <body class="main">

        <h1>Task Created Successfully!</h1>
        <div>
            <p>Task Name: <span>${newTask.taskName}</span></p>
            <p>Task Description: <span>${newTask.taskDesc}</span></p>
        </div>
        <p></p>
        <button
                class="input-button"
                type="button"
                onclick="location.href='<%=request.getContextPath()%>/'"
        >
            Return to Task Dashboard
        </button>
    </body>
</html>
