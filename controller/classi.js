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
		var node = document.createTextNode("Classe");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("Sezione");
		th.appendChild(node);
		row.appendChild(th);
		
		var th = document.createElement("th");
		var node = document.createTextNode("AnnoScolastico");
		th.appendChild(node);
		row.appendChild(th);
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			row.data = objectResponse[key].idclasse;
			
			//Classe
			var td = document.createElement("td");
			td.ondblclick = Edit;
			td.data = "classe"
			var node = document.createTextNode(objectResponse[key].classe);
			td.appendChild(node);
			row.appendChild(td);
			
			//Sezione
			var td = document.createElement("td");
			td.ondblclick = Edit;
			td.data = "sezione";
			var node = document.createTextNode(objectResponse[key].sezione);
			td.appendChild(node);
			row.appendChild(td);
			
			//AnnoScolastico
			var td = document.createElement("td");
			td.data = objectResponse[key].idannoscolastico;
			var node = document.createTextNode(objectResponse[key].annoInizio + " - " + objectResponse[key].annoFine);
			td.appendChild(node);
			row.appendChild(td);
			
			//edit
			var td = document.createElement("td");
			td.onclick = Modal;
			td.data = objectResponse[key].idclasse;
			var icon = document.createElement("i");
			icon.className = "fas fa-user-edit";
			td.appendChild(icon);
			row.appendChild(td);
			
			//remove
			var td = document.createElement("td");
			td.onclick = Remove;
			td.data = objectResponse[key].idclasse;
			var icon = document.createElement("i");
			icon.className = "fas fa-user-minus";
			td.appendChild(icon);
			row.appendChild(td);
			
			table.appendChild(row);
		}
	}
};

function ReloadDump(){
	xhttp.open("GET", "../model/DUMP_classi.php", true);
	xhttp.send();
}

ReloadDump();

var xhttp2 = new XMLHttpRequest();
xhttp2.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Delete Done", false);
	}
}
function Remove(){
	this.parentElement.innerHTML = "";
	xhttp2.open("POST", "../controller/REMOVE_classi.php", true);
	xhttp2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp2.setRequestHeader("Accept","application/json");
	xhttp2.send("id="+ this.data +"");
	Notify("Deleting [id="+ this.data +"]", false);
}

// THIS IS THE PERSONALIZATION FOR THE "dbclickEdit.js" FILE,
// EditDB() can be personalized.
var xhttp3 = new XMLHttpRequest();
xhttp3.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Editing Done", false);
	}
}
function EditDB(){
	xhttp3.open("POST", "../controller/EDIT_classi.php", true);
	xhttp3.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp3.setRequestHeader("Accept","application/json");
	xhttp3.send("id="+ this.parentElement.parentElement.data +"&camp="+this.parentElement.data+"&edit="+this.value+"");
	Notify("Editing [id="+ this.parentElement.parentElement.data +"&camp="+this.parentElement.data+"&edit="+this.value+"]", false);
}

function EditDBFull(){
		document.getElementById("Modal").remove();
		
		var camps = this.parentElement.childNodes;
		
		xhttp4.open("POST", "../controller/EDIT_FULL_classi.php", true);
		xhttp4.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhttp4.setRequestHeader("Accept","application/json");
		var classe = (camps[1].value != "") ? camps[1].value : camps[1].placeholder;
		var sezione = (camps[3].value != "") ? camps[3].value : camps[3].placeholder;
		var annoscolastico = camps[5].value;
		xhttp4.send("id="+this.parentElement.data+"&classe="+classe+"&sezione="+sezione+"&annoscolastico="+annoscolastico+"");
		Notify("Full Editing [id="+this.parentElement.data+"&classe="+classe+"&sezione="+sezione+"&annoscolastico="+annoscolastico+"]", false);
		show();
}

var xhttp6 = new XMLHttpRequest();
xhttp6.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Anno Scolastico fetched");
	
	var response = xhttp6.responseText;
	var objectResponsee = JSON.parse(response);
	
	var select = document.getElementById("AnnoScolasticoCB");
	select.id = "";
	
	for (var key in objectResponsee) {
		
		var option = document.createElement("option")
		var node = document.createTextNode(objectResponsee[key].annoInizio + " - " + objectResponsee[key].annoFine);
		option.value = objectResponsee[key].idannoscolastico;
		option.appendChild(node);
		select.appendChild( option );
	}
	
	select.value = select.data;
	
	}
}
var xhttp4 = new XMLHttpRequest();
xhttp4.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Full Editing Done");
	}
	ReloadDump();
}
function Modal(){
	
	hide();
	
	var camps = this.parentElement.childNodes;
	
	var br = document.createElement("br");
	
	var divo = document.createElement("div");
	divo.id = "Modal";
	
	var div = document.createElement("div");
	div.id = "ModalInner";
	div.data = this.parentElement.data;
	divo.appendChild(div);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Classe:") );
	var input = document.createElement("input");
	input.data = "classe";
	input.placeholder = camps[0].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Sezione:") );
	var input = document.createElement("input");
	input.data = "sezione";
	input.placeholder = camps[1].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Anno scolastico:") );
	var select = document.createElement("select");
	select.id = "AnnoScolasticoCB";
	select.data = camps[2].data;
	xhttp6.open("GET", "../model/DUMP_annoScolastico.php", true);
	xhttp6.send();
	label.style.display = "none";
	select.style.display = "none";
	div.appendChild(label);
	div.appendChild(select);
	div.appendChild(br);
	
	var btnn = document.createElement("button");
	btnn.appendChild( document.createTextNode("Annulla") );
	btnn.onclick = function(){
		document.getElementById("Modal").remove();
		show();
	};
	btnn.className = "btnn";
	btnn.id = "annulla";
	div.appendChild(btnn);
	div.appendChild(br);
	
	var btnn = document.createElement("button");
	btnn.appendChild( document.createTextNode("Advanced") );
	btnn.onclick = function(){
		var camps = this.parentElement.childNodes;
		for(i = 0;i < camps.length; i++){
			camps[i].style.display = "";
		}
		this.remove();
	};
	btnn.style.left = "17%";
	btnn.className = "btnn";
	div.appendChild(btnn);
	div.appendChild(br);
	
	var btnn = document.createElement("button");
	btnn.appendChild( document.createTextNode("Modifica") );
	btnn.onclick = EditDBFull;
	btnn.style.left = "57%";
	btnn.className = "btnn";
	div.appendChild(btnn);
	div.appendChild(br);
	
	document.querySelector("header").appendChild(divo);
}

xhttp6.open("GET", "../model/DUMP_annoScolastico.php", true);
xhttp6.send();
