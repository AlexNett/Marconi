$(function(){

$.ajax({
	type: "GET",
	url: "../model/administratorLevel.php",
success: function(data) { 
	
	console.log(data);
	console.log($("#allow").val());
	
if(data != $("#allow").val()) {
	window.location= "Home.html";
}
$("#allow").remove();
	
},
error: function(error) {
	window.location= "Home.html" 
}});



});