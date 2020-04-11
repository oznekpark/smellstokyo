  var swiper = new Swiper('.swiper-container', {
    loop: true,
    autoHeight: true,
    slidesPerView: 3,
    // spaceBetween: 10,
    slidesPerGroup: 1,
    loopFillGroupWithBlank: true,
    centeredSlides: true,
    // pagination: {
    //   el: '.swiper-pagination',
    //   clickable: true,
    //   dynamicBullets: true
    // },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    scrollbar: {
      el: '.swiper-scrollbar',
      hide: true,
      draggable: true
    },
    // breakpoints: {
    //   767: {
    //     slidesPerView: 1,
    //     spaceBetween: 0
    //   }
    // }
  });