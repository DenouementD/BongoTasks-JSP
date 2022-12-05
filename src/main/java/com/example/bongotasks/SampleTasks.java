package com.example.bongotasks;

import java.util.ArrayList;

public class SampleTasks {

    ArrayList<Task> taskList = new ArrayList<>();

    public SampleTasks() {
        taskList.add(new Task("01", "Buy Milk", "Buy some milk", false));
        taskList.add(new Task("02", "Buy Eggs", "Buy some eggs", true));
        taskList.add(new Task("03", "Cook breakfast", "cook some breakfast with milk and eggs", false));
    }

    public ArrayList<Task> getTaskList() {
        return taskList;
    }

    public void addTask(Task task) {
        taskList.add(task);
    }
}
