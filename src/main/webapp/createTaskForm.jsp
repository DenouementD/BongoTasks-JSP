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

        <style>
            *{
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

            .edit-bg {
                max-width: 500px;
                width: 100%;
                padding: 25px 30px;
                border-radius: 15px;
                background: #161B22;
                outline: 2px solid #30363d;
            }

            .edit-title {
                font-size: 25px;
                font-weight: 500;
                position: relative;
                text-align: center;
                padding: 0 0 20px 0;
            }

            .form-label {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .form-input {
                height: 45px;
                width: 100%;
                outline: none;
                border-radius: 5px;
                border: 1px solid white;
                font-size: 16px;
                border-bottom-width: 2px;
                margin-bottom: 20px;
                padding: 10px;
                font-weight: 500;
            }

            .form-textarea {
                resize: none;
                height: 10em;
                font-weight: 500;
            }

            .form-buttons {
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                align-items: center;
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

            .cancel {
                /*outline: 2px solid #da3633;*/
                background-color: #da3633;
            }

            .confirm {
                /*outline: 2px solid #2e9f43;*/
                background-color: #2e9f43;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="edit-bg">
            <form action="TaskServlet" method="get">
                <div class="edit-title">
                    Add Task
                </div>
                <div>
                    <label class="form-label">Name</label>
                    <input name="taskName" class="form-input" placeholder="e.g. 'Buy Milk'">
                </div>
                <div>
                    <label class="form-label">Description</label>
                    <textarea name="taskDesc" class="form-input form-textarea" placeholder="e.g. 'Go to UnfairPrice buy milk and come back home'"></textarea>
                </div>
                <div class="form-buttons">
                    <button
                        class="input-button cancel"
                        type="submit"

                    >
                        <i class="fa fa-ban"></i> Cancel
                    </button>
                    <button
                        class="input-button confirm"
                        type="submit"
                    >
                        <i class="fa fa-check"></i> Confirm
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
