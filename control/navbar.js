	$.ajax({
		type: "GET",
		dataType: "json",
		url: "../model/navbarGenerator.php",
	success: function(data) { 
		
		$("#header").append("<table><tr>");
		data.forEach(function(value){
				var td = $("<td class='link'><a href='"+ value +".html'>" + value + "</a></td>");
				$("#header").append(td);
		});
		$("#header").append("</tr></table>");
		
	},
	error: function(error) {
		
	}});