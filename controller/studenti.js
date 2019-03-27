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
		var node = document.createTextNode("Id");
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
			td.ondblclick = Edit;
			td.data = objectResponse[key].idstudente
			var node = document.createTextNode(objectResponse[key].idstudente);
			td.appendChild(node);
			row.appendChild(td);
			
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
	xhttp.open("GET", "../model/DUMP_studenti.php", true);
	xhttp.send();
}

ReloadDump();

function show(){
	document.getElementById("pageHide").style.display = 'none';
}
show();
function hide(){
	document.getElementById("pageHide").style.display = 'block';
}

var xhttp2 = new XMLHttpRequest();
xhttp2.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Delete Done");
	}
}

function Remove(){
	this.parentElement.innerHTML = "";
	xhttp2.open("POST", "../controller/REMOVE_studenti.php", true);
	xhttp2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp2.setRequestHeader("Accept","application/json");
	xhttp2.send("id="+ this.data +"");
	Notify("Deleting [id="+ this.data +"]");
}


var xhttp3 = new XMLHttpRequest();
xhttp3.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	Notify("Editing Done");
	}
}
function EditDB(){
	xhttp3.open("POST", "../controller/EDIT_studenti.php", true);
	xhttp3.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp3.setRequestHeader("Accept","application/json");
	xhttp3.send("id="+ this.parentElement.parentElement.childNodes[0].data +"&camp="+this.parentElement.data+"&edit="+this.value+"");
	Notify("Editing [id="+ this.parentElement.parentElement.childNodes[0].data +"&camp="+this.parentElement.data+"&edit="+this.value+"]");
}

function Revert(){
	if( this.parentElement.querySelector("input").value == "" ){
			this.parentElement.innerHTML = this.parentElement.querySelector("input").placeholder;
		} else {
			this.parentElement.innerHTML = this.parentElement.querySelector("input").value;
		}
}

function Enter(e){
	if(e.keyCode == 13){
		this.blur();
	}
}

function Edit(){
	
	var camps = this.parentElement.childNodes;
	if( camps[0] == this ) { return; }
	if( camps[camps.length - 1] == this ) { return; }
	if(this.querySelector("input") != null ) { return; }
	var input = document.createElement("input")
	input.placeholder = this.innerHTML;
	input.onchange = EditDB;
	input.onblur = Revert;
	input.onkeypress = Enter;
	this.innerHTML = "";
	this.appendChild(input);
	this.querySelector("input").focus();
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function Notify(msg){
	
	var p = document.createElement("p");
	var txt = document.createTextNode(msg);
	p.appendChild(txt);
	
	p.classList.add("notify");
	p.style.left = "35px";
	
	var high = document.getElementsByClassName("notify");
	
	p.style.top = window.innerHeight - 35 - ((high.length + 1) * 35) + "px";
	
	document.querySelector("header").appendChild(p);
	
	await sleep(5000);
	
	high[0].remove();
	
	var high = document.getElementsByClassName("notify");
	for(i = 0; i < high.length; i++){
		var h = high[i].style.top;
		high[i].style.top = (Number(h.substring(0, h.length - 2)) + 35) + "px";
	}
}


function Modal(){
	
	hide();
	
	var camps = this.parentElement.childNodes;
	
	var br = document.createElement("br");
	
	var div = document.createElement("div");
	div.id = "Modal";
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Nome:") );
	var input = document.createElement("input");
	input.placeholder = camps[1].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Cognome:") );
	var input = document.createElement("input");
	input.placeholder = camps[2].innerHTML;
	div.appendChild(label);
	div.appendChild(input);
	div.appendChild(br);
	
	var label = document.createElement("p");
	label.appendChild( document.createTextNode("Email:") );
	var input = document.createElement("input");
	input.placeholder = camps[3].innerHTML;
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
	btnn.appendChild( document.createTextNode("Modifica") );
	btnn.onclick = function(){
		document.getElementById("Modal").remove();
		show();
	};
	btnn.style.left = "57%";
	btnn.className = "btnn";
	div.appendChild(btnn);
	div.appendChild(br);
	
	document.querySelector("header").appendChild(div);
	
}
