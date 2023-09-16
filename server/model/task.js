const mongoose = require("mongoose");
const { Schema } = mongoose
const taskSchema = new Schema({
    taskTitle: {
        type: String,
    },
    taskCategory: {
        type: String,
    },
    taskDescription: {
            type: String,
        },
    taskTime: {
        type: String,
    },
    taskDate: {
        type: String,
    },
});

const Task = mongoose.model("Task", taskSchema);
module.exports = Task;