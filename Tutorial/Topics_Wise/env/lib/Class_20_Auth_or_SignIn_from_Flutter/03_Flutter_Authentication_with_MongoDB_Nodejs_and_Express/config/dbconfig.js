const dotenv = require("dotenv");
dotenv.config({ path: "../config.env" });

module.exports = {
  secret: "thisisthesecret",
  // this is the secret variable we will use for our JSON web token strategy
  database:
    "mongodb+srv://romanrazz189:flutterauth987@cluster0.zmt1d.mongodb.net/UserData?retryWrites=true&w=majority",
};
