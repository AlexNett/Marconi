var xhttps = new XMLHttpRequest();
xhttps.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		
		var response = xhttps.responseText;
		var objectResponse = JSON.parse(response);
		
		var table = document.getElementById("dump1");
		
		while (table.firstChild) {
			table.removeChild(table.firstChild);
		}
		
		var row = document.createElement("tr");
		
		var th = document.createElement("th");
		var node = document.createTextNode("id");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Nome");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Cognome");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("E-Mail");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Classe");
		th.appendChild(node);
		row.appendChild(th);
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			
			//id
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].idstudente);
			td.appendChild(node);
			row.appendChild(td);
			
			//nome
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].nome);
			td.appendChild(node);
			row.appendChild(td);
			
			//cognome
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].cognome);
			td.appendChild(node);
			row.appendChild(td);
			
			//email
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].email);
			td.appendChild(node);
			row.appendChild(td);
			
			//classe
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].classe_idclasse);
			td.appendChild(node);
			row.appendChild(td);
			
			table.appendChild(row);
		}
	}
};

function ReloadDump(){
	xhttps.open("GET", "../model/DUMP_sessioneStudenti.php", true);
	xhttps.send();
}

ReloadDump();

document.getElementById("pageHide").style.display = 'none';
function hide(){
	document.getElementById("pageHide").style.display = 'block';
}

var xhttps2 = new XMLHttpRequest();
xhttps2.onreadystatechange = function() {
	ReloadDump();
}