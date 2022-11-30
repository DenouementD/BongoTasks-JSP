package com.example.bongotasks;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {

    public List<Task> taskList = new ArrayList<Task>();

    public void initTask() {
        taskList.add(new Task("Buy Milk", "Buy some milk", false));
        taskList.add(new Task("Buy Eggs", "Buy some eggs", false));
        taskList.add(new Task("Cook breakfast", "cook some breakfast with milk and eggs", false));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
