//= require rails-ujs
//= require_tree .

//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .

$("input.datepicker").each(function(input) {
 $(this).datepicker({
   dateFormat: "yy-mm-dd",
   altField: $(this).next()
 })
