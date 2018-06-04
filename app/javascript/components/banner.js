import swal from 'sweetalert';
import Typed from 'typed.js';
import tippy from 'tippy.js';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('sweet-alert-demo');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "SUCK MY COCK",
        text: "On your knees please.",
        icon: "success"
      });
    });
  };
};

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "Learn to code"],
    typeSpeed: 50,
    loop: true
  });
};

function showToolTip() {
  tippy('.btn', {
    arrow: true,
    size: 'large',
    inertia: true
  });
};

export { showToolTip };
export { bindSweetAlertButtonDemo };
export { loadDynamicBannerText };
