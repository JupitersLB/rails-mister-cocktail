import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerForm = document.getElementById('banner-typed-text');
  const ingredientsArray = JSON.parse(bannerForm.dataset.ingredients)
  new Typed('#banner-typed-text', {
    strings: ingredientsArray,
    attr: 'placeholder',
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
