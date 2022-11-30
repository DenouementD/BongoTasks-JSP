package com.example.bongotasks;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {

    public class Task {
        public String taskName;
        public String taskDesc;
        public boolean status;

        public Task(String taskName, String taskDesc, boolean status) {
            this.taskName = taskName;
            this.taskDesc = taskDesc;
            this.status = status;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
