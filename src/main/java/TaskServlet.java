import com.example.bongotasks.SampleTasks;
import com.example.bongotasks.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {

//    SampleTasks sampleTasks = new SampleTasks();
    public static Task taskToUpdate = new Task("0", "0", "0", false);

    // connection to the database
    protected Connection getConnection() {
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

    protected List<Task> getTasks(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Task> taskList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM bongotasks.tasks")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println(resultSet);

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                taskList.add(new Task(id, name, description, status));
//                System.out.println("Task: " + id + "|" + name + "|" + description + "|" + status);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        request.setAttribute("taskList", taskList);
        request.getRequestDispatcher("/taskDashboard.jsp").forward(request, response);
        return taskList;
    }

    protected Map<String, String> addTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
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

        Map<String, String> newTask = new HashMap<>();
        newTask.put("taskName", taskName);
        newTask.put("taskDesc", taskDesc);

        request.setAttribute("newTask", newTask);
        request.getRequestDispatcher("/confirmCreate.jsp").forward(request, response);
        return newTask;
    }

    protected Task fillTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String editId = request.getParameter("edit-id");

        request.setAttribute("id", editId);

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM bongotasks.tasks WHERE id = " + editId)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                taskToUpdate = new Task(id, name, description, status);
            }

            request.setAttribute("task", taskToUpdate);
            request.getRequestDispatcher("/editTaskForm.jsp").forward(request, response);

            return taskToUpdate;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    protected Task updateTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String taskName = request.getParameter("taskName");
        String taskDesc = request.getParameter("taskDesc");

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE bongotasks.tasks SET name = '" + taskName + "', description = '" + taskDesc + "' WHERE id = " + taskToUpdate.getId())) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        request.setAttribute("taskName", taskName);
        request.setAttribute("taskDesc", taskDesc);
        request.setAttribute("newtaskName", taskToUpdate.getName());
        request.setAttribute("newtaskDesc", taskToUpdate.getDescription());
        request.getRequestDispatcher("/confirmUpdate.jsp").forward(request, response);

        return new Task(taskToUpdate.getId() ,taskToUpdate.getName(), taskToUpdate.getDescription(), taskToUpdate.isStatus());
    }

    protected void updateStatus(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String taskId = request.getParameter("id");
        String taskStatus = request.getParameter("status");

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE bongotasks.tasks SET status = " + taskStatus + " WHERE id = " + taskId)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/");
    }

    protected void deleteTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String deleteId = request.getParameter("delete-id");
        request.setAttribute("id", deleteId);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM bongotasks.tasks WHERE id = " + deleteId)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        request.getRequestDispatcher("/confirmDelete.jsp").forward(request, response);
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
                case "/TaskServlet/dashboard":
                    getTasks(request, response);
                    break;
                case "/TaskServlet/fillTask":
                    fillTask(request, response);
                    break;
                case "/TaskServlet/updateStatus":
                    updateStatus(request, response);
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