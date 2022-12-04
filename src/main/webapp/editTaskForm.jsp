<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Edit a Task</title>
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
        border-radius: 25px;
        background: #161B22;
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

    </style>
  </head>
  <body>
    <div class="edit-bg">
      <form>
        <div class="edit-title">
          Edit Task
        </div>
        <div>
          <label class="form-label">Name</label>
          <input name="taskName" class="form-input">
        </div>
        <div>
          <label class="form-label">Description</label>
          <textarea name="taskDesc" class="form-input form-textarea"></textarea>
        </div>
      </form>
    </div>
  </body>
</html>
