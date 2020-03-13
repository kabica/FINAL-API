// testAPI.js


const fs = require("fs");
const path = require("path");

const express = require('express');
const router = express.Router();
const chalk = require('chalk');

const { db } = require('../db/db_config.js');

// ========================== DATABASE RESET ========================== //
function read(file) {
  return new Promise((resolve, reject) => {
    fs.readFile(
      file,
      {
        encoding: "utf-8"
      },
      (error, data) => {
        if (error) return reject(error);
        resolve(data);
      }
    );
  })
  .catch(err => console.log(err));
}


// ========================== DATABASE TOOLS ========================== //
const getUsers = function () {
  return db.query(`SELECT * FROM users;`)
    .then(res => res.rows);
};


// ============================ API ROUTER ============================ //
module.exports = () => {

  router.get('/', (req , res) => {
    res.json({status: "API functioning a expected."})
  });

  router.get('/users' , (req , res) => {
    getUsers()
    .then(users => res.json(users))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  return router;
};