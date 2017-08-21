$( document ).ready(function() {
  
  if (!(page.controller() === 'jams' && page.action() === 'show')) { return; }
  
  var jamDiv = document.getElementById("jam-tunes");
  var jamTunes = JSON.parse(jamDiv.dataset.tunes);
  jamTunes.forEach(function(tune, index) {
    console.log(tune.name);
  });
  

}); // on document ready
