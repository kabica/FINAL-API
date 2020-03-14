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
const getUserImages = function () {
  return db.query(`SELECT * FROM user_images;`)
    .then(res => res.rows);
};
const getUserGames = function () {
  return db.query(`SELECT * FROM user_games;`)
    .then(res => res.rows);
};
const getReviews = function () {
  return db.query(`SELECT * FROM reviews;`)
    .then(res => res.rows);
};
const getGames = function () {
  return db.query(`SELECT * FROM games;`)
    .then(res => res.rows);
};
const getGamePlatforms = function () {
  return db.query(`SELECT * FROM game_platforms;`)
    .then(res => res.rows);
};
const getFavoriteGames = function () {
  return db.query(`SELECT * FROM favorite_games;`)
    .then(res => res.rows);
};
const getComments = function () {
  return db.query(`SELECT * FROM comments;`)
    .then(res => res.rows);
};
const getAlias = function () {
  return db.query(`SELECT * FROM alias;`)
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

  router.get('/user_images' , (req , res) => {
    getUserImages()
    .then(user_images => res.json(user_images))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  router.get('/user_games' , (req , res) => {
    getUserGames()
    .then(user_games => res.json(user_games))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  router.get('/reviews' , (req , res) => {
    getReviews()
    .then(reviews => res.json(reviews))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  router.get('/games' , (req , res) => {
    getGames()
    .then(games => res.json(games))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  router.get('/games' , (req , res) => {
    getGamePlatforms()
    .then(game_platforms => res.json(game_platforms))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  router.get('/favorite_games' , (req , res) => {
    getFavoriteGames()
    .then(favorites => res.json(favorites))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  router.get('/comments' , (req , res) => {
    getComments()
    .then(comments => res.json(comments))
    .catch((error) => {
      console.log(chalk.red('error: ', error))
    });
  });

  


  return router;
};