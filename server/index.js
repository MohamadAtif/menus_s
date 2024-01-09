const express = require("express");
const app = express();
const mongoose = require("mongoose");

// // IMPORTS FROM OTHER FILES
const adminRouter = require("./routes/admin");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const searchRouter = require("./routes/search");
const placeRouter = require("./routes/place");
const itemRouter = require("./routes/items");


// middleware
app.use(express.json());
app.use(itemRouter);
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
app.use(searchRouter);
app.use(placeRouter);

// Connections
mongoose.connect('mongodb+srv://pedri:pedri@cluster0.razkqoh.mongodb.net/').then(()=>{
    console.log('connected On DataBase succefully')
}).catch((error)=>{console.log('error on connecting',error)});

// const PORT = process.env.PORT || 6000;
const PORT = 6000;
app.listen(6000, () => {
  console.log(`connected at port ${PORT}`);
});
