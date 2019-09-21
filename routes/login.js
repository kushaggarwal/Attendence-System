//jshint esversion:6

const express = require("express")
const bodyParser = require("body-parser") 
const ejs = require("ejs");
const util = require(__dirname + "/../functions.js")

const router = express.Router();

const redirectLogin = (req, res, next) => {
  if(!req.session.userId) {
    res.redirect('/login')
  }
  else {
    next()
  }
}

const redirectHome = (req, res, next) => {
  if(req.session.userId) {
    res.redirect('/teacher/timeTable')
  }
  else {
    next()
  }
}

router.get("/", redirectHome, (req, res) => {
  // if(loggedIn) res.redirect("/");
  res.render("login", {error_msg: ""});
});

router.post("/", redirectHome, (req, res) => {
  let userId = req.body.userid;
  let password = req.body.password;
  util.getConnection().query(`select userID, userType, department from users where userid='${userId}' and password='${password}'`, (err, result) => {
    if(err) throw err;
    if(result.length === 0) {
      res.render("login", {error_msg: "Invalid username or password"});
    }
    else {
      console.log("User " + userId + " logged in");
      req.session.userId = userId;
      req.session.department = result[0].department;
      console.log(req.session.department);
      if(result[0].userType.toLowerCase === 'admin') {
        req.session.adminIN = true;
        res.redirect("/admin");
      }
      else {
        res.redirect("/teacher/timeTable");
        req.session.userSections = []
        util.getConnection().query(`select * from teacher_${req.session.userId}`, (err, result) => {
          //console.log(result);
          for(let i=0; i<result.length; i++) {
            for(let j=1; j<8; j++) {
              util.addElement(req.session.userSections, result[i][`lec${j}`]);
            }
          }
          req.session.save();
          console.log(req.session.userSections);
        });
      }
    }
  });
});


module.exports = router;
