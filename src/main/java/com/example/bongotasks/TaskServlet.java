package com.example.bongotasks;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {

    public List<Task> taskList = new ArrayList<Task>();

    public void initTask() {
        taskList.add(new Task("Buy Milk", "Buy some milk", false));
        taskList.add(new Task("Buy Eggs", "Buy some eggs", true));
        taskList.add(new Task("Cook breakfast", "cook some breakfast with milk and eggs", false));
    }

    private void getTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("taskList", taskList);
        request.getRequestDispatcher("/taskDashboard.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initTask();
        getTasks(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
