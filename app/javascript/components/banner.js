import swal from 'sweetalert';
import Typed from 'typed.js';
import tippy from 'tippy.js';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('sweet-alert-demo');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Welcome to CODE:PLUG",
        text: "Learn to code.",
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

document.app = {
  loadDynamicBannerText,
  showToolTip,
  bindSweetAlertButtonDemo,
};

export { showToolTip };
export { bindSweetAlertButtonDemo };
export { loadDynamicBannerText };
