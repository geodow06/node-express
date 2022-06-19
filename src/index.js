const express = require("express");
const mongoose = require("mongoose");
const { MONGO_USER, MONGO_PASSWORD, MONGO_IP, MONGO_PORT } = require("./config/config");

const postRouter = require("./routes/postRoutes");
const healthRouter = require("./routes/healthRoutes");

const app = express();

const mongoURL = `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}?authSource=admin`;
mongoose
    .connect(mongoURL)
    .then(() => console.log("Successfully connected to mondoDB"))
    .catch((e) => console.log(e));

app.use(express.json());

app.get("/", (req, res) => {
    res.send("<h2>Welcome to test</h2>");
});


app.use("/api/v1/posts", postRouter);
app.use("/api/v1/health", healthRouter);

const port = process.env.PORT || 3000;

app.listen(port, () => console.log(`Listening on port ${port}`));