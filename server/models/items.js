const mongoose = require("mongoose");
const ratingSchema = require("./rating");
const placeSchema = require("./place");


const itemSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  dateCreated:{
    type:Date,
    default:Date.now,
  },
  place:{
    type:mongoose.Schema.Types.ObjectId,
    ref:'Place',
    required:true,
  },
  // place: placeSchema,
  ratings: [ratingSchema],
});

const Item = mongoose.model("Item", itemSchema);
module.exports = { Item, itemSchema: itemSchema };
