// server.js

require('dotenv').config();
const PORT = process.env.PORT || 8000;

const bodyParser = require('body-parser');
const morgan = require('morgan');
const express = require('express');
const app = express();

// ================================ DEVELOPMENT ================================ //

app.use(express.static("public"));
app.use(bodyParser.json());
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: true }));


// =============================== SERVER ROUTES =============================== //
app.get('/', (req , res) => {
  res.json({status: 'API functioning as expected.'})
});

app.listen(PORT, () => {
  console.log(`Server is listening on PORT: ${PORT}`)
});