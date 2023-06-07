var jwtStrategy = require("passport-jwt").Strategy;
var Extractjwt = require("passport-jwt").ExtractJwt;
var User = require("../models/user");
var config = require("./dbconfig");

module.exports = function (passport) {
  var opts = {};

  opts.secretOrKey = config.secret;
  opts.jwtFromRequest = Extractjwt.fromAuthHeaderWithScheme("jwt");
  passport.use(
    new jwtStrategy(opts, function (jwt_payload, done) {
      User.find(
        //   here we are authenticating the user based on the user token
        {
          id: jwt_payload.id,
        },
        function (err, user) {
          if (err) {
            return done(err, false);
          }
          if (user) {
            return done(null, user);
          } else {
            return done(null, false);
          }
        }
      );
    })
  );
};
