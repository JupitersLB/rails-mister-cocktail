//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
// import { upvoteCocktailCubes } from '../components/counter';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
  loadDynamicBannerText();
  // upvoteCocktailCubes();
  $(function() {
    const cocktailCards = document.querySelectorAll('.card-category');

    let count;
    cocktailCards.forEach((card) => {
      const cube = card.querySelector(`.fa-cubes`);
      cube.addEventListener('click', (event) => {
        event.preventDefault();
        count = parseInt(cube.dataset.counter, 10);
        count += 1;
        cube.dataset.counter = count;
        cube.innerHTML = count;
        console.log("trying ajax...")
        $.ajax({
          url: `cocktails/${card.id}/cubes`,
          method: "PATCH",
          data: { cocktail_id: card.id, new_count: count }
        });
      });
    });
  });
});
