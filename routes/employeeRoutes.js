var express = require('express');
var router = express.Router();
var knex = require('../db/knex');

router.get('/', (req, res) => {
    knex.raw(`select e.*, d.name from employees e join donuts d on e.fav_donut = d.id order by e.last_name`)
        .then(function (emps) {
            //console.log(emps.rows[0]);
            res.render('employees', {
                emplist: emps.rows
            })
        })
});


router.get('/:id/edit', (req, res) => {
    knex.raw(`select * from employees where id = ${req.params.id}`)
        .then((emps) => {
            //console.log(emps.rows);
            res.render('editemployees', {
                employee: emps.rows[0]
            })
        })
})

router.post('/:id', (req, res) => {
    console.log('heard it')
    knex.raw(`update employees set (first_name, last_name, fav_donut) = ('${req.body.first_name}', '${req.body.last_name}', ${req.body.fav_donut}) where id = ${req.params.id}`)
        .then(knex.raw(`select e.*, d.name from employees e join donuts d on e.fav_donut = d.id order by e.last_name`)
            .then((emps) => {
                console.log(emps.rows);
                res.redirect('/employees')
            })
        );
})



module.exports = router;