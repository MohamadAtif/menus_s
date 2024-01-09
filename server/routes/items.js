const express = require("express");
const itemRouter = express.Router();
const auth = require("../middlewares/auth");
const { getAllitems, getAllItemsByCategory, rateItem, getTopRatedItems } = require("../controllers/itemController");


itemRouter.get("/api/get-all-items",getAllitems );

itemRouter.get("/api/items/", auth, getAllItemsByCategory);

itemRouter.post("/api/rate-item", auth, rateItem);

itemRouter.get("/api/top-rated-items", auth, getTopRatedItems);

//productRouter.get("/api/products/search/:name", auth, getProductsBySearch);
module.exports = itemRouter;
