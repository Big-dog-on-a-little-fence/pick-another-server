//  assets/javascripts/jam.js
var Jam = {
  randomTune : function(tunes) {
    var min = 0;
    var max = tunes.length - 1;
    var random_index = Math.floor(Math.random() * (max - min + 1)) + min;
    return tunes[random_index];
  },
  generateTune : function(tunes) {
    document.getElementById("gen-tune").onclick = function(){
      var random_tune = this.randomTune(tunes);
      document.getElementsByClassName("gen-tune").innerHTML = "Name: " + random_tune.name + "  Key: " + random_tune.key;
    }
    
  }
}

