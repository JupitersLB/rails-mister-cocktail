$(upvoteCocktailCubes() {
  const cocktailCards = document.querySelectorAll('.card-category');

  let count;
  cocktailCards.forEach((card) => {
    card.addEventListener('click', (event) => {
      const cube = card.querySelector(`.fa-cubes`);
      count = parseInt(cube.dataset.counter, 10);
      count += 1;
      cube.dataset.counter = count;
      cube.innerHTML = count;
    });
  });
});

export { upvoteCocktailCubes };
