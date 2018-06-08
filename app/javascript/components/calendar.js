const days = document.querySelectorAll('li');


days.forEach((day) => {
  day.addEventListener('click', (event) => {
    days.forEach((activeDay) => {
      if (activeDay.classList.contains('active-day')) {
        activeDay.classList.remove('active-day');
      }
    })
    event.currentTarget.classList.add('active-day');
    
    // se tiver activa selecionar div do dia
     // document.getElementsByClassName('active-day')
     console.log("EVT", event.currentTarget);
     // console.log(event.dataset.target)

     const current_li = event.currentTarget;
     const target_id = current_li.dataset.target
     console.log("target div id:", target_id);

    const selected_div = document.getElementById(target_id)
	console.log("selected div:", selected_div);


     //selected_div.innerHTML = "99999999"//schedules.target_id;
     console.log("selected div inner text:", selected_div.innerHTML);
     
     const divs_to_hide = document.querySelectorAll('.availability');
     divs_to_hide.forEach((elem) => {
     	if (elem.classList.contains('active-availability')) {
        	elem.classList.remove('active-availability');
      	}
     })
     selected_div.classList.add('active-availability');

  })  
})

export { days };