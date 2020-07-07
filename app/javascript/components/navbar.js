const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.my-navbar');
  const banner = document.querySelector('.banner');
  if (navbar && banner) {
    window.addEventListener('scroll', () => {
      if (banner && window.scrollY <= banner.offsetHeight) {
        navbar.classList.add('navbar-transparent');
        navbar.classList.remove('navbar-dark');
      } else {
        navbar.classList.add('navbar-dark');
        navbar.classList.remove('navbar-transparent')
      }
    });
  } else {
    navbar.classList.add('navbar-dark');
  }
}

export { initUpdateNavbarOnScroll };
