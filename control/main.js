$(function(){
	var table = $("<table></table>");
	
	
	table.append("<tr><td>Ciao!</td><td>Test!</td></tr>");
	table.append("<tr><td>F!</td><td>F!</td></tr>");
	
	$("#test").append(table);
	
	
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "../model/data.php",
	success: function(data) { 
		data.forEach(function(x){
			console.log(x);
		})
	},
	error: function(error) {
		alert(error);
	}});
	
});