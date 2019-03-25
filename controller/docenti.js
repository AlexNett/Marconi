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
		var node = document.createTextNode("Nome");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Cognome");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Email");
		th.appendChild(node);
		row.appendChild(th);
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			
			//id
			var td = document.createElement("td");
			td.onclick = Edit;
			td.data = objectResponse[key].iddocente
			var node = document.createTextNode(objectResponse[key].iddocente);
			td.appendChild(node);
			row.appendChild(td);
			
			//nome
			var td = document.createElement("td");
			td.onclick = Edit;
			td.data = "nome"
			var node = document.createTextNode(objectResponse[key].nome);
			td.appendChild(node);
			row.appendChild(td);
			
			//cognome
			var td = document.createElement("td");
			td.onclick = Edit;
			td.data = "cognome";
			var node = document.createTextNode(objectResponse[key].cognome);
			td.appendChild(node);
			row.appendChild(td);
			
			//email
			var td = document.createElement("td");
			td.onclick = Edit;
			td.data = "email";
			var node = document.createTextNode(objectResponse[key].email);
			td.appendChild(node);
			row.appendChild(td);
			
			//remove
			var td = document.createElement("td");
			td.onclick = Remove;
			td.data = objectResponse[key].iddocente;
			var icon = document.createElement("i");
			icon.className = "fas fa-user-minus";
			td.appendChild(icon);
			row.appendChild(td);
			
			table.appendChild(row);
		}
	}
};

function ReloadDump(){
	xhttp.open("GET", "../model/DUMP_docenti.php", true);
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

function Remove(){
	this.parentElement.style.opacity = "0.2";
	xhttp2.open("POST", "../controller/REMOVE_docenti.php", true);
	xhttp2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp2.setRequestHeader("Accept","application/json");
	xhttp2.send("id="+ this.data +"");
}


var xhttp3 = new XMLHttpRequest();
function EditDB(){
	alert("ciao");
	xhttp3.open("POST", "../controller/EDIT_docenti.php", true);
	xhttp3.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp3.setRequestHeader("Accept","application/json");
	xhttp3.send("id="+ this.parentElement.parentElement.childNodes[0].data +"&camp="+this.parentElement.data+"&edit="+this.value+"");
}

function Edit(){
	
	var camps = this.parentElement.childNodes;
	for(i = 1; i < camps.length - 1; i++){
		if( camps[i].querySelector("input") == null ){ continue; }
		if( camps[i].querySelector("input").value == "" ){
			camps[i].innerHTML = camps[i].querySelector("input").placeholder;
		} else {
			camps[i].innerHTML = camps[i].querySelector("input").value;
		}
	}	
	
	if( camps[0] == this ) { return; }
	if( camps[camps.length - 1] == this ) { return; }
	if(this.querySelector("input") != null ) { return; }
	var input = document.createElement("input")
	input.placeholder = this.innerHTML;
	input.onchange = EditDB
	this.innerHTML = "";
	this.appendChild(input);
	this.querySelector("input").focus();
}
