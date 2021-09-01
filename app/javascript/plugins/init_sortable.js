// src/plugins/init_sortable.js
import Sortable from 'sortablejs';

const initSortable = () => {
  // const list = document.querySelector('#results');
  // Sortable.create(list);

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
