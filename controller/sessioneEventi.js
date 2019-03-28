var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		
		var response = xhttp.responseText;
		var objectResponse = JSON.parse(response);
		
		var table = document.getElementById("dump");
		
		while (table.firstChild) {
			table.removeChild(table.firstChild);
		}
		
		var row = document.createElement("tr");
		
		var th = document.createElement("th");
		var node = document.createTextNode("id");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Data");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Tipo evento");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Oggetto");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Gruppo");
		th.appendChild(node);
		row.appendChild(th);
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			
			//id
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].idevento);
			td.appendChild(node);
			row.appendChild(td);
			
			//data
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].data);
			td.appendChild(node);
			row.appendChild(td);
			
			//tipo evento
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].tipoevento_idtipoevento);
			td.appendChild(node);
			row.appendChild(td);
			
			//oggetto
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].oggetto_idoggetto);
			td.appendChild(node);
			row.appendChild(td);
			
			//gruppo
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].gruppo_idgruppo);
			td.appendChild(node);
			row.appendChild(td);
			
			table.appendChild(row);
		}
	}
};

function ReloadDump(){
	xhttp.open("GET", "../model/DUMP_sessioneEventi.php", true);
	xhttp.send();
}

ReloadDump();

document.getElementById("pageHide").style.display = 'none';
function hide(){
	document.getElementById("pageHide").style.display = 'block';
}

var xhttp2 = new XMLHttpRequest();
xhttp2.onreadystatechange = function() {
	ReloadDump();
}