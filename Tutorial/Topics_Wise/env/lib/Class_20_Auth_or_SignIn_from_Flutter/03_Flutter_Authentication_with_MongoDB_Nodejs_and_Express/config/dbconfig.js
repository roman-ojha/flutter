const dotenv = require("dotenv");
dotenv.config({ path: "../config.env" });

module.exports = {
  secret: process.env.SECRET,
  // this is the secret variable we will use for our JSON web token strategy
  database: process.env.DATABASE,
};
