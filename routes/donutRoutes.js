var express = require('express');
var router = express.Router();
var knex = require('../db/knex');

router.get('/', function (req, res, next) {
    knex.raw(`select * from donuts order by name`)
        .then((donuts) => {
            res.render('donuts', {
                donutList: donuts.rows
            });
        });
});


router.get('/:donut_id/edit', (req, res) => {
    knex.raw(`select * from donuts where id = ${req.params.donut_id}`)
    .then((donuts) => {
        res.render('editdonuts', {
        donutList: donuts.rows[0] 
        });
    });
});

router.post('/:donut_id', (req,res) => {
    //console.log(req.body);
    
    knex.raw(`update donuts set (name, topping) = ('${req.body.name}', '${req.body.topping}') where id = ${req.params.donut_id}`)
    .then(knex.raw('select * from donuts')
        .then((donuts) => {
            res.redirect('/donuts');
        }) 
    )
});

router.get('/new', (req,res) => {
    res.render('donutsNew');
})

router.post('/', (req,res) => {
    knex.raw(`insert into donuts (name, topping) values ('${req.body.name}', '${req.body.topping}')`)
        .then(knex.raw('select * from donuts')
        .then((donuts) => {
            res.redirect('/donuts');
        }) 
    )
});

router.get('/delete/:id', (req,res) => {
    //console.log(req.body, req.params);
    knex.raw(`delete from donuts where id = (${req.params.id})`)
        .then(knex.raw('select * from donuts')
        .then((donuts) => {
            res.redirect('/donuts');
        }) 
    )    
})

router.get('/:donut_id', (req, res) => {
    knex.raw(`select s.name as name, s.city, d.name as donut from shops s join shop_donut_m2m sd on s.id=sd.shop_id join donuts d on sd.donut_id = d.id where d.id = ${req.params.donut_id}`)
        .then((donuts) => {
            //console.log(donuts[0].rows);
            res.render('donutsshow', {
                donutDetails: donuts.rows,
            });
        });
});

module.exports = router;