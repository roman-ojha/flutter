var User = require("../models/user");
var jwt = require("jwt-simple");
var config = require("../config/dbconfig");

var functions = {
  addNew: function (req, res) {
    //   saving the user and password to the database
    if (!req.body.name || !req.body.password) {
      res.json({ success: false, msg: "Enter all fields" });
    } else {
      var newUser = User({ name: req.body.name, password: req.body.password });
      newUser.save(function (err, newUser) {
        if (err) {
          res.json({ success: false, msg: "Failed to save" });
        } else {
          res.json({ success: true, msg: "Successfully saved" });
        }
      });
    }
  },
  authenticate: function (req, res) {
    User.findOne(
      {
        name: req.body.name,
      },
      function (err, user) {
        if (err) throw err;
        if (!user) {
          res.status(403).send({
            success: false,
            msg: "Authentication Failed, User not found",
          });
        } else {
          // if user exist in the database then we have to compare the passport
          user.comparePassword(req.body.password, function (err, isMatch) {
            if (isMatch && !err) {
              // if password got match then we are generating the token
              var token = jwt.encode(user, config.secret);
              res.json({ success: true, token: token });
              //   here we are sending token back to the user
            } else {
              return res.status(403).send({
                success: false,
                msg: "Authentication failed, password is incorrect",
              });
            }
          });
        }
      }
    );
  },
  getinfo: function (req, res) {
    if (
      req.headers.authorization &&
      req.headers.authorization.split(" ")[0] === "Bearer"
    ) {
      //   now here we will get the token from the user request
      var token = req.headers.authorization.split(" ")[1];
      var decodedtoken = jwt.decode(token, config.secret);
      //   now here after getting the jwt token from the user we will decode that token and get the user from the data base based on that token
      return res.json({ success: true, msg: "Hello " + decodedtoken.name });
    } else {
      return res.json({ success: false, msg: "No Headers" });
    }
  },
};

module.exports = functions;
