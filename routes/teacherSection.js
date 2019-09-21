//jshint esversion:6
const express = require("express")
const bodyParser = require("body-parser");
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
    res.redirect('/timeTable')
  }
  else {
    next()
  }
}

router.get("/timeTable", redirectLogin, async (req, res) => {

  let timeTable;
  await new Promise((resolve, reject) => {
    util.getConnection().query(`select * from teacher_${req.session.userId}`, (err, result) => {
      timeTable = result;
      resolve(1);
    });
  });

  let lecturesCompleted = [];
  await new Promise(async (resolve, reject) => {
    //needs to be change after having data of all users
    // for(let section of userSections) {
    //   let lectures = await getTotalLectures(/*subject that taught by this teacher to this section*/, section);
    //   lecturesCompleted.push([section, lectures]);
    // }
    lecturesCompleted.push(['s10', await util.getTotalLectures('oops', 's10', req.session.department)])
    resolve(true);
  });

  // res.render("timeTable", {timeTable: timeTable});
  res.render("timeTable", {timeTable: timeTable, lecturesCompleted: lecturesCompleted})

});

router.get("/attendance/:lecture/:section", redirectLogin, (req, res) => {

  req.session.selectedSection = req.params.section;
  req.session.lecture = req.params.lecture;
  if(!req.session.userSections.includes(req.session.selectedSection)) {
    return res.send("<h2>You cannot access that section</h2>");
  }

  util.getConnection().query(`select * from section_${req.session.selectedSection}`, (err, result) => {

    if(err || result.length === 0) {
      console.log("cannot process further");
      return
    }
    req.session.Students = result;
    res.render("attendance", {Students: req.session.Students});

    console.log(req.session.userId);
    util.getConnection().query(`select subject from department_${req.session.department} where Teacher_id='${req.session.userId}' and section='${req.session.selectedSection}'`, (err, result) => {
      //choose the subject that is in timeTable due to changing semesters
      console.log(result);
      req.session.userSubject = result[0].subject;
      req.session.save();
      console.log(req.session.userSubject);
    });

    req.session.totalStudents = result.length;
    //res.send(result);
    console.log(req.session);
  });
});

router.post("/attendance", redirectLogin, async (req, res) => {

  const attendStatus = req.body;
  console.log(attendStatus);

  let rollNumbers = '';
  let attendanceList = "";

  for(let i=0; i<req.session.totalStudents; i++) {
    if(attendStatus[`${req.session.Students[i].studentRollNo}`]) {
      attendanceList += "'Present', ";
    }
    else {
      attendanceList += "'Absent', ";
    }
    rollNumbers += `a${req.session.Students[i].studentRollNo}, ` ;
  }

  console.log(req.session);
  let valid_entry = await new Promise((resolve, reject) => {
    util.getConnection().query(`select SNo from section_${req.session.selectedSection}_attendance where lecture='${req.session.userSubject}_${util.getDate()}_${req.session.lecture}'`, (err, result) => {
      if(result.length === 1) {
        res.send(`
          attendance already taken
          <br>
          <a href='timeTable'>home</a>
          `);
          resolve(0)
      }
      else {
        resolve(1)
      }
    })
  })
  if(!valid_entry) return;
  let sql = `insert into section_${req.session.selectedSection}_attendance (lecture, ${rollNumbers.substring(0, rollNumbers.length-2)}) values('${req.session.userSubject}_${util.getDate()}_${req.session.lecture}', ${attendanceList.substring(0, attendanceList.length-2)})`;
  console.log(sql);
  util.getConnection().query(sql);

  res.send(`${req.body}
    return to <a href='/home'>Home</a>`);                         //needs to be change

  let total_lectures = await util.getTotalLectures(req.session.userSubject, req.session.selectedSection, req.session.department);
  let sql2 = `update department_${req.session.department} set total_lectures=${total_lectures}+1 where Teacher_id='${req.session.userId}' and section='${req.session.selectedSection}'`;
  console.log(sql2);
  util.getConnection().query(sql2);
});

module.exports  = router;
