//= require jquery
//= require rails-ujs
//= require_tree .
//= require bootstrap-datepicker

var setupUI = function() {
  var el = $('.datepicker');

  // check if element exists if not stop running the script
  if (!el.length) return;

  el.datepicker({
    todayHighlight: true,
    format: 'yyyy-mm-dd',
    autoclose: true,
    orientation: "bottom"
  });
  calculateTotal();
};

function calculateTotal() {
  let range = $("#booking_end_date").datepicker('getDate') - $("#booking_start_date").datepicker('getDate');
  range = Math.max(0, range);

  document.getElementById('days').innerHTML = `<strong>${parseInt(range / 86400000)}</strong>`;
  let price = document.getElementById('booking_cost').value;
  document.getElementById('cost').innerHTML = `<strong>${(range / 86400000) * price}</strong>`;
};

$(document).ready(setupUI);
