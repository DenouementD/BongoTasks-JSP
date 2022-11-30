package com.example.bongotasks;

public class Task {
    private String taskName;
    private String taskDesc;
    private boolean status;

    public Task(String taskName, String taskDesc, boolean status) {
        this.taskName = taskName;
        this.taskDesc = taskDesc;
        this.status = status;
    }
}
