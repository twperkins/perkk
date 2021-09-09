// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import "controllers";

import { initMapbox } from '../plugins/init_mapbox';
import { initSortable } from '../plugins/init_sortable'; // <-- add this
import { initStarRating } from '../plugins/init_star_rating';
import { runAnimations } from '../plugins/run_animations';
// import { initSweetalert } from '../plugins/run_animations';




document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initSortable();
  initStarRating();
  runAnimations();
  // initSweetalert();
})

// // this is for the home page to scroll through cards (Stef)

// https://github.com/kenwheeler/slick - check this before trying to implement the feature

// or do do an array in JS

// import 'slick-carousel'
// import 'slick-carousel/slick/slick.css'
// import 'slick-carousel/slick/slick-theme.css'

// $(".perk-gallery").slick({

//   // normal options...
//   infinite: false,

//   // the magic
//   responsive: [{

//     breakpoint: 1024,
//     settings: {
//       slidesToShow: 2,
//       infinite: true
//     }

//   }, {

//     breakpoint: 600,
//     settings: {
//       slidesToShow: 2,
//       dots: true
//     }

//   }]
// });
