
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('shops').del()
    .then(function () {
      // Inserts seed entries
      return knex('shops').insert([
        {name: 'BOSA', city: 'Phoenix'},
        {name: 'Krispy Kream', city: 'Phoenix'},
        {name: 'Dunkin Donuts', city: 'San Tan Valley'},
        {name: 'Dunkin Donuts', city: 'Boston'},
        {name: 'BOSA', city: 'Lander'},
      ]);
    });
};
