// db_config.js

const Pool = require('pg').Pool
const db = new Pool({
  user: 'nixx',
  host: 'localhost',
  database: 'api',
  password: 'alexroks',
  port: 5432,
});

module.exports = { db };
