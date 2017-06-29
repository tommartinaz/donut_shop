var express = require('express');
var router = express.Router();
var knex = require('../db/knex');

router.get('/', function (req, res, next) {
    knex.raw(`select * from donuts`)
        .then((shops) => {
            (res.send(shops.rows))
        })
});

module.exports = router;