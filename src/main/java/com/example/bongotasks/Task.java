package com.example.bongotasks;

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
