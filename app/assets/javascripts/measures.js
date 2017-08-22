
function translateAllMeasuresToNumerals(key) {
  var chord_scale = resetScale(key);
  var measures = document.getElementsByClassName("measure");
  for(var i = 0; i < measures.length; i++)   {
     translateMeasureToNumeral(chord_scale, measures.item(i));
  }
}

function translateMeasureToNumeral(chord_scale, input_measure) {
  var measure = input_measure.innerHTML;
  var numeral_measure = "";
  var chords = measure.split(' ');
  chords.forEach(function(chord, index) {
    var numeral = translateChordToNumeral(chord_scale, chord);
    numeral_measure += ' '+numeral;
  });
  console.log(numeral_measure);
  input_measure.innerHTML = numeral_measure;
}