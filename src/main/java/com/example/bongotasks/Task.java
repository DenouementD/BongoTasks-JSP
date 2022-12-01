package com.example.bongotasks;

public class Task {
    private String taskName;
    private String taskDesc;
    private boolean status;

    public Task(String taskName, String taskDesc, boolean status) {
        super();
        this.taskName = taskName;
        this.taskDesc = taskDesc;
        this.status = status;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }


}
