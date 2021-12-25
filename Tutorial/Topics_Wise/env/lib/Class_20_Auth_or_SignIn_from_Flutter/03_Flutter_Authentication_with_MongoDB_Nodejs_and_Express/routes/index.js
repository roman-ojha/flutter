const express = require("express");
const actions = require("../methods/actions");
const router = express.Router();

router.get("/", (req, res) => {
  res.send("hello world");
});

router.get("/dashbord", (req, res) => {
  res.send("dashbord");
});

//@desc Adding new user
//@route POST /adduser
router.post("/adduser", actions.addNew);
//@desc Adding Authenticate a user
//@route POST /adduser
router.post("/authenticate", actions.authenticate);

// we also need to handle the authenticated token comming from the user so to handle that request
//@desc Get info on a user Authenticate a user
//@route POST /adduser
router.get("/getinfo", actions.getinfo);

module.exports = router;
