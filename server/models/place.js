const mongoose = require("mongoose");
const ratingSchema = require("./rating");

const placeSchema = new mongoose.Schema({
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
  location: {
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
  category: {
    type: String,
    required: true,
  },
  dateCreated:{
    type:Date,
    default:Date.now,
  },
  ratings: [ratingSchema],
});

const Place = mongoose.model("Place", placeSchema);
module.exports = { Place, placeSchema };
