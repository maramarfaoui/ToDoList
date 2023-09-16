// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const TaskRouter = require("./routes/task");
// INIT
const app = express();
//models
const Task = require("./model/task");
// express.json()
app.use(express.json());

//body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.json());
const DB = "mongodb+srv://radhwenrmili:yr6frMklBGHakk4x@cluster0.salhcvh.mongodb.net/?retryWrites=true&w=majority";
const port = 3000;

// Connections
app.get('/', (req, res) => {
    res.send("hello babies!");
});

app.use('/', TaskRouter);

mongoose
    .connect(DB)
    .then(() => {
        console.log("Connection Successful");
        app.listen(port, "0.0.0.0", () => {
            console.log(`connected at port ${port}`);
        });
    })
    .catch((e) => {
        console.log(e);
    });