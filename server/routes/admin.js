const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const { PromiseProvider } = require("mongoose");
const { addProduct, getAllProductByAdmin, deleteProduct, getOrdersByAdmin, changeOrderStatusByAdmin, fetchAnalitics, addPlace, getAllPlacesByAdmin, deletePlace } = require("../controllers/adminController");

// Add product
adminRouter.post("/admin/add-product", admin,addProduct);

// Get all your products
adminRouter.get("/admin/get-products", admin, getAllProductByAdmin);

// Delete the product
adminRouter.post("/admin/delete-product", admin, deleteProduct);
///////////////////////
// Add Place
adminRouter.post("/admin/add-place", admin,addPlace);

// Get all your products
adminRouter.get("/admin/get-places",admin, getAllPlacesByAdmin);

// Delete the product
adminRouter.post("/admin/delete-place",admin, deletePlace);

adminRouter.get("/admin/get-orders", admin, getOrdersByAdmin);

adminRouter.post("/admin/change-order-status", admin, changeOrderStatusByAdmin);

adminRouter.get("/admin/analytics", admin, fetchAnalitics );


module.exports = adminRouter;
