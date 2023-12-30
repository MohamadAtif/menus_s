const express = require("express");
const placeRouter = express.Router();
const auth = require("../middlewares/auth");
const { getAllPlaces, getAllPlacesByCategory, ratePlace, getTopRatedPlaces } = require("../controllers/placeController");


placeRouter.get("/api/get-all-places", getAllPlaces);

placeRouter.get("/api/places/", auth, getAllPlacesByCategory);

placeRouter.post("/api/rate-place", auth, ratePlace);

placeRouter.get("/api/top-rated-places", auth, getTopRatedPlaces);

// placeRouter.get("/api/places/search/:name", auth, getPlacesBySearch);
module.exports = placeRouter;
