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
		
		var th = document.createElement("th");
		var node = document.createTextNode("Ruolo");
		th.appendChild(node);
		row.appendChild(th);
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			row.data = objectResponse[key].iddocente;
			
			//nome
			var td = document.createElement("td");
			td.ondblclick = Edit;
			td.data = "nome"
			var node = document.createTextNode(objectResponse[key].nome);
			td.appendChild(node);
			row.appendChild(td);
			
			//cognome
			var td = document.createElement("td");
			td.ondblclick = Edit;
			td.data = "cognome";
			var node = document.createTextNode(objectResponse[key].cognome);
			td.appendChild(node);
			row.appendChild(td);
			
			//email
			var td = document.createElement("td");
			td.ondblclick = Edit;
			td.data = "email";
			var node = document.createTextNode(objectResponse[key].email);
			td.appendChild(node);
			row.appendChild(td);
			
			//ruolo
			var td = document.createElement("td");
			td.data = objectResponse[key].ruolo_idruolo;
			var node = document.createTextNode(objectResponse[key].descrizione);
			td.appendChild(node);
			row.appendChild(td);
			
			//edit
			var td = document.createElement("td");
			td.onclick = Modal;
			td.data = objectResponse[key].iddocente;
			var icon = document.createElement("i");
			icon.className = "fas fa-user-edit";
			td.appendChild(icon);
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

var xhttp2 = new XMLHttpRequest();
xhttp2.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Delete Done", false);
	}
}

function Remove(){
	this.parentElement.innerHTML = "";
	xhttp2.open("POST", "../controller/REMOVE_docenti.php", true);
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
	xhttp3.open("POST", "../controller/EDIT_docenti.php", true);
	xhttp3.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp3.setRequestHeader("Accept","application/json");
	xhttp3.send("id="+ this.parentElement.parentElement.data +"&camp="+this.parentElement.data+"&edit="+this.value+"");
	Notify("Editing [id="+ this.parentElement.parentElement.data +"&camp="+this.parentElement.data+"&edit="+this.value+"]", false);
}

function EditDBFull(){
		document.getElementById("Modal").remove();
		
		var camps = this.parentElement.childNodes;
		
		xhttp4.open("POST", "../controller/EDIT_FULL_docenti.php", true);
		xhttp4.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhttp4.setRequestHeader("Accept","application/json");
		var nome = (camps[1].value != "") ? camps[1].value : camps[1].placeholder;
		var cognome = (camps[3].value != "") ? camps[3].value : camps[3].placeholder;
		var email = (camps[5].value != "") ? camps[5].value : camps[5].placeholder;
		var ruolo = camps[7].value;
		xhttp4.send("id="+this.parentElement.data+"&nome="+nome+"&cognome="+cognome+"&email="+email+"&ruolo="+ruolo+"");
		Notify("Full Editing [id="+this.parentElement.data+"&nome="+nome+"&cognome="+cognome+"&email="+email+"&ruolo="+ruolo+"]", false);
		show();
		
		if(camps[9].value != "") {
			
		var camps = this.parentElement.childNodes;
		xhttp5.open("POST", "../controller/resetPasswordDocente.php", true);
		xhttp5.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhttp5.setRequestHeader("Accept","application/json");
		xhttp5.send("pass="+camps[9].value+"&id="+this.parentElement.data+"");
		Notify("Resetting Password...", false);
		document.getElementById("Modal").remove();
		show();
		}
}


var xhttp6 = new XMLHttpRequest();
xhttp6.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Ruoli fetched");
	
	var response = xhttp6.responseText;
	var objectResponsee = JSON.parse(response);
	
	var select = document.getElementById("RuoliCB");
	
	for (var key in objectResponsee) {
		
		var option = document.createElement("option")
		var node = document.createTextNode(objectResponsee[key].descrizione);
		option.value = objectResponsee[key].idruolo;
		option.appendChild(node);
		select.appendChild( option );
	}
	
	select.value = select.data;
	
	}
}
var xhttp5 = new XMLHttpRequest();
xhttp5.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Password Resetted");
	}
	ReloadDump();
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
	label.appendChild( document.createTextNode("Nome:") );
	var input = document.createElement("input");
	input.data = "nome";
	input.placeholder = camps[0].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Cognome:") );
	var input = document.createElement("input");
	input.data = "cognome";
	input.placeholder = camps[1].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Email:") );
	var input = document.createElement("input");
	input.data = "email";
	input.placeholder = camps[2].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Ruolo:") );
	var select = document.createElement("select");
	select.id = "RuoliCB";
	select.data = camps[3].data;
	xhttp6.open("GET", "../model/DUMP_ruoli.php", true);
	xhttp6.send();
	label.style.display = "none";
	select.style.display = "none";
	div.appendChild(label);
	div.appendChild(select);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Password:") );
	var input = document.createElement("input");
	input.type = "password";
	input.placeholder = "Password";
	label.style.display = "none";
	input.style.display = "none";
	div.appendChild(label);
	div.appendChild(input);
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
