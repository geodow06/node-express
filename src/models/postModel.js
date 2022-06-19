const mongoose = require("mongoose");

const postSchema = new mongoose.Schema({
    title: {
        type: String,
        require: [true, "Must include title"]
    },
    body: {
        type: String,
        require: [true, "Must include body"]
    }
})

const Post = mongoose.model("Post", postSchema);
module.exports = Post;