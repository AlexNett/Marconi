$(function(){
	
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "../model/currentLogged.php",
	success: function(data) { 
		
		
		$("#name").text(data.nome);
		$("#surname").text(data.cognome);
		$("#email").text(data.email);
		
		
	},
	error: function(error) {
		
	}});
	
});