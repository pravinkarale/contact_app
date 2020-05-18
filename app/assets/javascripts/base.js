$(document).ready(function(){
	$("select#language_select").on('change', function(){
		var lang = $(this).val()
		languageChangeAjaxCall(lang)
	})

	$("form#new_contact").on('submit', function(e){
    e.preventDefault();
    sendMessage()
  })
})

function sendMessage(){
	$.post("/api/contacts", $('#new_contact').serialize(), function(data) {
    if (data['status'] == 'failure'){
      $('span.response_message').removeClass('success')
      $('span.response_message').not(".failure").addClass('failure')
      $('span.response_message').text(data['message'])
    }
    else{
      $('span.response_message').text('');
      $('span.response_message').removeClass('failure')
      $('span.response_message').not(".success").addClass('success')
      $('span.response_message').text(data['message'])
      $("#contact_first_name, #contact_last_name, #contact_email, #contact_phone, #contact_message").val("");
    }
  });
}

function languageChangeAjaxCall(lang){
	$.ajax({
		url: "/contacts/new",
		data: {locale: lang}
	})
}
