<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Task Updated</title>
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
        align-items: center;
        background: #0D1117;
        padding: 10px;
        column-gap: 20px;
        justify-content: center;
      }

      button {
        cursor: pointer;
      }

      .edit-bg {
        max-width: 500px;
        width: 100%;
        padding: 25px 30px;
        border-radius: 15px;
        background: #161B22;
        outline: 2px solid #30363d;
      }

      .title {
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

      .container {
        display: flex;
        flex-direction: column;
      }

      .taskdesc-section {
        padding: 0 0 30px 0;
      }

      .solid {
        margin: 15px 0 15px 0;
        border: 1px solid #30363d;
      }

      .outer-container {
        margin: auto;
        display: flex;
        flex-direction: row;
        width: 60%;
        height: 300px;
        justify-content: space-evenly;
      }

      .input-button {
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
        align-self: center;
      }

      .large-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        height: 50%;
      }
    </style>
  </head>
  <body>
    <div class="large-container">
      <div class="outer-container">
        <div class="edit-bg">
          <div class="title">
            Previous Task
          </div>
          <div class="container">
            <div class="taskname-section">
              <label class="form-label">Name</label>
              <div>
                ${taskName}
              </div>
            </div>
            <hr class="solid">
            <div class="taskdesc-section">
              <label class="form-label">Description</label>
              <p>${taskDesc}</p>
            </div>
          </div>
        </div>
        <hr class="solid">
        <div class="edit-bg">
          <div class="title">
            Updated Task
          </div>
          <div class="container">
            <div class="taskname-section">
              <label class="form-label">Name</label>
              <p>${newtaskName}</p>
            </div>
            <hr class="solid">
            <div class="taskdesc-section">
              <label class="form-label">Description</label>
              <p>${newtaskDesc}</p>
            </div>
          </div>
        </div>
      </div>
      <button
              class="input-button"
              type="button"
              onclick="location.href='<%=request.getContextPath()%>/'"
      >
        Return to Task Dashboard
      </button>
    </div>
  </body>
</html>

