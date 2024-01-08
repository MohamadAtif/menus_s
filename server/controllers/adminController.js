const { Product } = require("../models/product");
const {Place}=require("../models/place");
const Order = require("../models/order");
const { fetchCategoryWiseProduct } = require("../logic/adminLogic");


module.exports={
    addProduct: async (req, res) => {
        try {
          const { name, description, images, quantity, price, category } = req.body;
          let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
          });
          product = await product.save();
          res.json({product});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getAllProductByAdmin: async (req, res) => {
        try {
          const products = await Product.find({});
          res.json({products});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      deleteProduct: async (req, res) => {
        try {
          const { id } = req.body;
          let product = await Product.findByIdAndDelete(id);
          res.json({product});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      /////////////////////////////places
      addPlace: async (req, res) => {
        try {
          const { name, description, images,location, category } = req.body;
          let place = new Place({
            name,
            description,
            location,
            images,
            category,
          });
          place = await place.save();
          res.json({place});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      

      getAllPlacesByAdmin: async (req, res) => {
        try {
          const places = await Place.find({});
          res.json({places});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      deletePlace: async (req, res) => {
        try {
          const { id } = req.body;
          let place = await Place.findByIdAndDelete(id);
          res.json({place});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      //////////orders

      getOrdersByAdmin: async (req, res) => {
        try {
          const orders = await Order.find({});
          res.json({orders});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      
     changeOrderStatusByAdmin: async (req, res) => {
        try {
          const { id, status } = req.body;
          let order = await Order.findById(id);
          order.status = status;
          order = await order.save();
          res.json({order});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      fetchAnalitics: async (req, res) => {
        try {
          const orders = await Order.find({});
          let totalEarnings = 0;
      
          for (let i = 0; i < orders.length; i++) {
            for (let j = 0; j < orders[i].products.length; j++) {
              totalEarnings +=
                orders[i].products[j].quantity * orders[i].products[j].product.price;
            }
          }
          // CATEGORY WISE ORDER FETCHING
          let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
          let applianceEarnings = await fetchCategoryWiseProduct("Appliances");
          let cosmeticsEarnings = await fetchCategoryWiseProduct("Cosmetics");
          let fashionEarnings = await fetchCategoryWiseProduct("Fashion");
          let earnings = {
            totalEarnings,
            mobileEarnings,
            applianceEarnings,
            cosmeticsEarnings,
            fashionEarnings,
          };
      
          res.json({earnings});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
        
      },
      

}