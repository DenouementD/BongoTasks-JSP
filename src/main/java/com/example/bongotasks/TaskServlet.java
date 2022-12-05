package com.example.bongotasks;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {

    SampleTasks sampleTasks = new SampleTasks();

    // connection to the database
    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Variables that are used for database connections
            String sqlURL = "jdbc:mysql://127.0.0.1:3306/?user=root";
            String sqlUsername = "root";
            String sqlPassword = "admin";
            connection = DriverManager.getConnection(sqlURL, sqlUsername, sqlPassword);
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return connection;
    }

    private void getTasks(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Task> taskList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM bongotasks.tasks")) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                taskList.add(new Task(id, name, description, status));
                System.out.println("Task: " + id + "|" + name + "|" + description + "|" + status);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        request.setAttribute("taskList", taskList);
        request.getRequestDispatcher("/taskDashboard.jsp").forward(request, response);
    }

    private void addTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // @PuttTim - Please add the code to add a task to the database
        String taskName = request.getParameter("taskName");
        String taskDesc = request.getParameter("taskDesc");

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO bongotasks.tasks (name, description, status) VALUES (?, ?, ?)")) {
            preparedStatement.setString(1, taskName);
            preparedStatement.setString(2, taskDesc);
            preparedStatement.setBoolean(3, false);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        request.getRequestDispatcher("/taskDashboard.jsp").forward(request, response);
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // @UnscriptedLogic - Please add the code to update a task in the database
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // @DenouementD - Please add the code to delete a task in the database
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        try {
            switch (servletPath) {
                case "/TaskServlet/addTask":
                    addTask(request, response);
                    break;
                case "/TaskServlet/updateTask":
                    updateTask(request, response);
                    break;
                case "/TaskServlet/deleteTask":
                    deleteTask(request, response);
                    break;
                default:
                    getTasks(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}
