const scroll = () => {
  const searchBar = document.querySelector('.search-bar');
  const chevron = document.querySelector('.fa-chevron-circle-up');
  chevron.addEventListener('click', function (e) {
    e.preventDefault();
    searchBar.scrollIntoView({
      behavior: 'smooth'
    });
  });
}

export default scroll
