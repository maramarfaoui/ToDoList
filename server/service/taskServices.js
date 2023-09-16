const Task = require("../model/task");

class TaskServices {
    static async createTask(taskTitle, taskCategory, taskDescription, taskTime, taskDate) {
        const task = new Task({ taskTitle, taskCategory, taskDescription, taskTime, taskDate });
        return Task.create(task);
    }
    static async getTasks() {
        return Task.find();
    }
}

module.exports = TaskServices;