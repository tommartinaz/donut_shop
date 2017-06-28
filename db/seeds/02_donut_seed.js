
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('donuts').del()
    .then(function () {
      // Inserts seed entries
      return knex('donuts').insert([
        {name: 'Glazed', topping: 'sprinkles', price: 2},
        {name: 'Bear Claw', price: 2},
        {name: 'Chocolate', topping: 'chocolate', price: 2},
        {name: 'Eclair', price: 2},
        {name: 'Jelly filled', topping: 'powdered sugar', price: 2},
      ]);
    });
};
