// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

jQuery(document).ready(function() {

	$('#institute_id').change(function() {
		$('#institute_id').parents('form').submit();
	});

	$('#form-updator').hide();

	$('#js-button').click(function() {
		$('#form-updator').slideToggle('slow');
	});


	$('.new-link, .edit-link').bind("ajax:complete", function(et, e) {
		$("#form-updator").html(e.responseText);
		$("#form-updator").show();
	});

});