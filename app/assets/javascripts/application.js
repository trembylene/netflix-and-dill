//= require jquery
//= require rails-ujs
//= require_tree .
//= require bootstrap-datepicker

$(document).ready(function(){
  $('.datepicker').datepicker({
    todayHighlight: true,
    format: 'yyyy-mm-dd',
    autoclose: true,
    orientation: "bottom"
  });
});

$( document ).ready(function() {
  calculateTotal();
});

function calculateTotal() {
  const range = $("#booking_end_date").datepicker('getDate') - $("#booking_start_date").datepicker('getDate');
  document.getElementById('days').innerHTML = `<strong>${parseInt(range / 86400000)}</strong>`;
  const price = document.getElementById('booking_cost').value;
  document.getElementById('cost').innerHTML = `<strong>${(range / 86400000) * price}</strong>`;
};
