const mongoose = require("mongoose");
const ratingSchema = require("./rating");
const placeSchema = require("./place");


const productSchema = new mongoose.Schema({
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
  quantity: {
    type: Number,
    required: true,
  },
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

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };
