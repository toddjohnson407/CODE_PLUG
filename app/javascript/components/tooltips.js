import tippy from 'tippy.js';

const avatar1 = document.querySelector('.avatar-1');
const tooltipContent1 = document.querySelector('.tooltip-1');
tippy(avatar1, {
  animation: 'shift-away',
  arrow: true,
  html: tooltipContent1,
  inertia: true,
})

const avatar2 = document.querySelector('.avatar-2');
const tooltipContent2 = document.querySelector('.tooltip-2');
tippy(avatar2, {
  animation: 'shift-away',
  arrow: true,
  html: tooltipContent2,
  inertia: true
})

const avatar3 = document.querySelector('.avatar-3');
const tooltipContent3 = document.querySelector('.tooltip-3');
tippy(avatar3, {
  animation: 'shift-away',
  arrow: true,
  html: tooltipContent3,
  inertia: true
})
