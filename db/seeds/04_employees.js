
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('employees').del()
    .then(function () {
      // Inserts seed entries
      return knex('employees').insert([
        {first_name: 'Race', last_name: 'Carpenter', fav_donut: 3},
        {first_name: 'Tom', last_name: 'Martin', fav_donut: 4},
        {first_name: 'Stephen', last_name: 'Eversole', fav_donut: 1},
        {first_name: 'Vinni', last_name: 'O', fav_donut: 5},
        {first_name: 'Shu Sia', last_name: 'Lukito', fav_donut: 2},
        {first_name: 'Emit', last_name: 'Dutcher', fav_donut: 1},
        {first_name: 'David', last_name: 'Kruse', fav_donut: 3},
      ]);
    });
};
