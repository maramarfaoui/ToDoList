const TaskServices = require("../service/taskServices");
exports.createTask =async (req,res,next) =>{
    try {
        const {taskTitle,taskCategory,taskDescription,taskTime, taskDate} =req.body;
        let task = await TaskServices.createTask(taskTitle,taskCategory,taskDescription,taskTime, taskDate);
        res.json({status:true,success:task});
    }
    catch (e){
        next(e);
    }
}
exports.getTasks =async (req,res,next) =>{
    try {
        const {} =req.body;
        let tasks = await TaskServices.getTasks();
        res.json({status:true,success:tasks});
    }
    catch (e){
        next(e);
    }
}