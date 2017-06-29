var express = require('express');
var router = express.Router();
var knex = require('../db/knex');

router.get('/', function (req, res, next) {
    knex.raw(`select * from shops order by name`)
        .then((shops) => {
            res.render('shops', {
                shopList: shops.rows
            });
        });
});


router.get('/:shop_id/edit', (req, res) => {
    knex.raw(`select * from shops where id = ${req.params.shop_id}`)
    .then((shops) => {
        res.render('editShops', {
        shopList: shops.rows[0] 
        });
    });
});

router.post('/:shop_id', (req,res) => {
    //console.log(req.body);
    
    knex.raw(`update shops set (name, city) = ('${req.body.name}', '${req.body.city}') where id = ${req.params.shop_id}`)
    .then(knex.raw('select * from shops')
        .then((shops) => {
            res.redirect('/shops');
        }) 
    )
});

router.get('/new', (req,res) => {
    res.render('shopsNew');
})

router.post('/', (req,res) => {
    knex.raw(`insert into shops (name, city) values ('${req.body.name}', '${req.body.city}')`)
        .then(knex.raw('select * from shops')
        .then((shops) => {
            res.redirect('/shops');
        }) 
    )
});

router.get('/delete/:id', (req,res) => {
    //console.log(req.body, req.params);
    knex.raw(`delete from shops where id = (${req.params.id})`)
        .then(knex.raw('select * from shops')
        .then((shops) => {
            res.redirect('/shops');
        }) 
    )    
})

router.get('/:shop_id', (req, res) => {
    Promise.all([knex.raw(`select s.name as name, s.city, d.name as donut from shops s join shop_donut_m2m sd on s.id=sd.shop_id join donuts d on sd.donut_id = d.id where s.id = ${req.params.shop_id}`),
    knex.raw(`select e.first_name, e.last_name, s.name from employees e join shops s on e.shop_id = s.id where s.id=${req.params.shop_id}`)])
        .then((shops) => {
            //console.log(shops[0].rows);
            res.render('shopshow', {
                shopDetails: shops[0].rows,
                empDetails: shops[1].rows
            });
        });
});

module.exports = router;