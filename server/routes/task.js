const express = require("express");
const TaskRouter = express.Router();
const TaskController = require("../controller/taskController");

TaskRouter.post("/add-task", TaskController.createTask);
TaskRouter.get("/get-tasks", TaskController.getTasks)
module.exports = TaskRouter;