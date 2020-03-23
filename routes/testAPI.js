// testAPI.js


const fs = require("fs");
const path = require("path");
const bcrypt = require('bcryptjs');
const express = require('express');
const router = express.Router();
const chalk = require('chalk');
const Cryptr = require('cryptr');
const cryptr = new Cryptr('a1b2c3d4e5f6g7h8alexa1b2c3d4e5f6g7h8');

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
const addUser = function(email, password) {
  return db.query(`INSERT INTO users (email, password) VALUES($1, $2) RETURNING email;`,[email, password])
  .then(res => res.rows)
}

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
  return db.query(`SELECT * FROM comments ORDER BY created_at;`)
    .then(res => res.rows);
};
const getAlias = function () {
  return db.query(`SELECT * FROM alias;`)
    .then(res => res.rows);
};
const postComment = function(author, user, text) {
  return db.query(`INSERT INTO comments (author_id, user_id, text) VALUES ($1, $2, $3);`, [author, user, text])
  .then(res => res.rows)
}

let testObj = {};

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
  router.post('/comments', (req , res) => {
    const {author , user , text} = req.body;
    postComment(author, user, text)
    .then(console.log('done'))
    .catch(error => console.error(error))
  })

  router.post('/alex', (req , res) => {
    console.log(req.body)
  });

  // USER AUTHENTICATION
  // Payload = the encrypted email stored in Clinet sessionStorage
  // Email is decrypted and run against the database 
  // If there is a match, verified === true
  router.post('/auth', async(req , res) => {
    const decryptedString = cryptr.decrypt(req.body.email);
    const verify = await checkEmail(decryptedString);
    const verified = verify[0] ? 'true' : 'false'

    res.json({em: decryptedString, verified: verified})
  });

  const getPassword = function(email) {
    return db.query(`SELECT password FROM users WHERE email = $1;`, [email])
    .then(res => res.rows)
    .catch(error => console.log(error))
  }
  const checkEmail = function(email) {
    return db.query(`SELECT email FROM users WHERE email = $1;`, [email])
    .then(res => res.rows)
    .catch(error => console.log(error))
  }
  router.post('/login', async(req , res) => {
    let {email , password} = req.body;
    let storedEmail = await checkEmail(email);
    // let verifyEmail = storedEmail[0] ? true: false;
    if(!storedEmail[0]) {
      res.json({error: 'Invalid Email'})
      return;
    }

    let storedPW = await getPassword(email);
    storedPW = storedPW[0].password;

    if(bcrypt.compareSync(password, storedPW)) {
      console.log(storedEmail)
      const encryptedEmail = cryptr.encrypt(storedEmail[0].email);
      console.log(encryptedEmail)
      res.json({Encryption: encryptedEmail})
    } else {
      res.json({error: 'Invalid Password'})
    }
  });

  router.post('/register', async(req , res) => {
    let {email , password} = req.body;
    let verifyEmail = await checkEmail(email);
    if(verifyEmail[0]) {
      res.json({error: 'Email is already in use.'});
      return;
    }
    encryptedPW = bcrypt.hashSync(password, 10)
    addUser(email, encryptedPW)
    .then(email => {
      let storedEmail = email[0].email;
      const encryptedEmail = cryptr.encrypt(storedEmail);
      res.json({Encryption: encryptedEmail})
    })
    .catch(err => console.log(err))
  })

  


  return router;
};