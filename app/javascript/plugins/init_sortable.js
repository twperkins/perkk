// src/plugins/init_sortable.js
import Sortable from 'sortablejs';

const initSortable = () => {
  const results = document.querySelector('#results');
  const results2down = document.querySelector('#results2down');

  // Sortable.create(results);
  // Sortable.create(results2down);


  new Sortable(results, {
    group: 'shared', // set both lists to same group
    animation: 150
  });

  new Sortable(results2down, {
    group: 'shared',
    animation: 150
  });


};

export { initSortable };
