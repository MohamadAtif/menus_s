const { Place } = require("../models/place");

const mongoose=require('mongoose');

module.exports={
   
     //recentlyAdded 25 Product
    getAllPlaces:  async (req, res) => {
        try {
        //    var limit= parseInt(100)
          const places = await Place.find({})
          res.json({places});
       
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getAllPlacesByCategory : async (req, res) => {
        try {
          var page= parseInt(req.body.page) ;
           var limit = parseInt(req.body.limit);
          var skip = (parseInt(page)-1) * parseInt(limit);
          const places = await Place.find({ category: req.query.category }).skip(skip).limit(limit);
          res.json({places: places});
          
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      // create a get request to search products and get them
    
    
    ratePlace : async (req, res) => {
        try {
          const { id, rating } = req.body;
          let place = await Place.findById(id);
      // i = number of rating in list 
          for (let i = 0; i < place.ratings.length; i++) {
           
            if (place.ratings[i].userId == req.user) {
             
             
              place.ratings.splice(i, 1);
          
              break;
            }
          }
      
          const ratingSchema = {
            userId: req.user,
            rating,
          };
      
          place.ratings.push(ratingSchema);
          place = await place.save();
          res.json({place});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getTopRatedPlaces:async (req, res) => {
        try {
          var limit= parseInt(5)
          let places = await Place.find({}).limit(limit);
      
          places = places.sort((a, b) => {
            let aSum = 0;
            let bSum = 0;
      
            for (let i = 0; i < a.ratings.length; i++) {
              // aSum =aSum + a.ratings[i].rating;
              aSum += a.ratings[i].rating;
          
            }
      
            for (let i = 0; i < b.ratings.length; i++) {
              bSum += b.ratings[i].rating;
             
            }
            return aSum < bSum ? 1 : -1;
          });
      
          res.json({places});
          

        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      }
    }
 