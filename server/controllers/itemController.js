const {Item } = require("../models/items");

const mongoose=require('mongoose');

module.exports={
   
     //recentlyAdded 25 items
    getAllitems :  async (req, res) => {
        try {
           var limit= parseInt(25)
          // var limit = parseInt(req.body.limit);
          // var skip = (parseInt(req.body.page)-1) * parseInt(limit);
          const items = await Item.find({}).sort({dateCreated: -1}).limit(limit);
          res.json({items: items});
       
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getAllItemsByCategory : async (req, res) => {
        try {
          var page= parseInt(req.body.page) ;
           var limit = parseInt(req.body.limit);
          var skip = (parseInt(page)-1) * parseInt(limit);
          const items = await Item.find({ category: req.query.category }).skip(skip).limit(limit);
          res.json({items: items});
          // console.log(products);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      // create a get request to search products and get them
    
    
    rateItem : async (req, res) => {
        try {
          const { id, rating } = req.body;
          let item = await Item.findById(id);
      // i = number of rating in list 
          for (let i = 0; i < item.ratings.length; i++) {
           
            if (item.ratings[i].userId == req.user) {
             
             
              item.ratings.splice(i, 1);
          
              break;
            }
          }
      
          const ratingSchema = {
            userId: req.user,
            rating,
          };
      
          item.ratings.push(ratingSchema);
          item = await item.save();
          res.json({items});
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getTopRatedItems:async (req, res) => {
        try {
          var limit= parseInt(5)
          let items = await Item.find({}).limit(limit);
      
          items = items.sort((a, b) => {
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
      
          res.json({items : items[0]});
          

        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      }
    }
    
//upload file 
// const FILE_TYPE_MAP={
//     'image/png':'png',
//     'image/jpg':'jpg',
//     'image/jpeg':'jpeg',

// }
// const storage = multer.diskStorage({
//     destination: function (req, file, cb) {
//         // const isValid=FILE_TYPE_MAP[file.mimetype];
//         // let uploadError= new Error('invalid image type');
//         // if (isValid){
//         //     uploadError=null
//         // }
    
//       cb(uploadError, '/uploads/images')
//     },
//     filename: function (req, file, cb) {
//     //   const fileName=file.originalname.spilit(' ').join('-');
//     //   const extension=FILE_TYPE_MAP[file.mimetype]
//       cb(null, file.fieldname + '-' + Date.now()  +'.png')
//     }
//   })
  
//   const uploadOptions = multer({ storage: storage })


//simple upload file

// const storage = multer.diskStorage({
//     destination: function (req, file, cb) {

//       cb(uploadError, 'uploads/images')
//     },
//     filename: function (req, file, cb) {

//       cb(null, file.fieldname + '-' + Date.now()  + '.png')
//     }
//   })
  
//   const uploadOptions = multer({ storage: storage }).single('image')