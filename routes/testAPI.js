// testAPI.js

const express = require('express');
const router = express.Router();
const chalk = require('chalk');

const { db } = require('../db/db_config.js');


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