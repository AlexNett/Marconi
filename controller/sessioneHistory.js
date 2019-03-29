var xhttpt = new XMLHttpRequest();
xhttpt.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		
		var response = xhttpt.responseText;
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
		var node = document.createTextNode("Data inizio");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Data fine");
		th.appendChild(node);
		row.appendChild(th);
		
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			
			//id
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].idsessione);
			td.appendChild(node);
			row.appendChild(td);
			
			//data inizio
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].datainizio);
			td.appendChild(node);
			row.appendChild(td);
			
			//data fine
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].datafine);
			td.appendChild(node);
			row.appendChild(td);
			
			table.appendChild(row);
		}
	}
};

function ReloadDump(){
	xhttpt.open("GET", "../model/DUMP_sessioneHistory.php", true);
	xhttpt.send();
}

ReloadDump();

document.getElementById("pageHide").style.display = 'none';
function hide(){
	document.getElementById("pageHide").style.display = 'block';
}

var xhttpt2 = new XMLHttpRequest();
xhttpt2.onreadystatechange = function() {
	ReloadDump();
}