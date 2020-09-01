$(upvoteCocktailCubes() {
  const cocktailCards = document.querySelectorAll('.card-category');

  let count;
  cocktailCards.forEach((card) => {
    const cube = card.querySelector('.fa-cubes');
    const cocktailCount = card.querySelector('.cocktail-count');
    cube.addEventListener('click', (event) => {
      event.preventDefault();
      count = parseInt(cube.dataset.counter, 10);
      count += 1;
      cube.dataset.counter = count;
      cocktailCount.innerHTML = `<i class="fas fa-cubes fa-2x" aria-hidden="true"></i> ${count}`;
      $.ajax({
        url: `cocktails/${card.id}/cubes`,
        method: "PATCH",
        data: { cocktail_id: card.id, new_count: count }
      });
    });
  })
});

export { upvoteCocktailCubes };
