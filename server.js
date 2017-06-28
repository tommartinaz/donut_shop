var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var port = process.env.PORT || 8000;
var cors = require('cors');
var logger = require('morgan');
var knex = require('./db/knex');

var index = require('./routes/indexRoutes');
var shops = require('./routes/shopRoutes');
var donuts = require('./routes/donutRoutes');
var employees = require('./routes/employeeRoutes');

var app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(cors());
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }));

app.use('/', index);
app.use('/shops', shops);
app.use('/donuts', donuts);
app.use('/employees', employees);

app.listen(port, function() {
console.log("listening on port: ", port);
})
