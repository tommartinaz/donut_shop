
exports.up = function(knex, Promise) {
    return knex.schema.createTable('shops', (data) => {
        data.increments();
        data.text('name').notNullable;
        data.text('city');
    })
    .createTable('donuts', (data) => {
        data.increments();
        data.text('name').notNullable;
        data.text('topping');
        data.integer('price');
    })
    .createTable('shop_donut_m2m', (data) => {
        data.increments();
        data.integer('shop_id').references('id').inTable('shops');
        data.integer('donut_id').references('id').inTable('donuts');
    })
    .createTable('employees', (data) => {
        data.increments();
        data.string('first_name').notNullable;
        data.string('last_name').notNullable;
        data.integer('fav_donut').references('id').inTable('donuts');
        data.integer('shop_id').references('id').inTable('shops');
    })
  
};

exports.down = function(knex, Promise) {
  
};
