$(function(){
	var table = $("<table></table>");
	
	
	table.append("<tr><td>Ciao!</td><td>Test!</td></tr>");
	table.append("<tr><td>F!</td><td>F!</td></tr>");
	
	$("#test").append(table);
	
	
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "../model/currentSession.php",
	success: function(data) { 
		console.log(data);
	},
	error: function(error) {
		alert(error);
	}});
	
});