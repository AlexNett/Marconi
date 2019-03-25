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
		var node = document.createTextNode("QR");
		th.appendChild(node);
		row.appendChild(th);
		
		table.appendChild(row);
		
		for (var key in objectResponse) {
			var row = document.createElement("tr");
			
			//id
			var td = document.createElement("td");
			var node = document.createTextNode(objectResponse[key].idmacchina);
			td.appendChild(node);
			row.appendChild(td);
			
			//qr
			var td = document.createElement("td");
			var img = document.createElement("img");
			img.src = "data:image/png;base64,"+objectResponse[key].qr;
			td.appendChild(img);
			row.appendChild(td);
			
			//remove
			var td = document.createElement("td");
			td.onclick = Remove;
			td.data = objectResponse[key].idmacchina;
			var icon = document.createElement("i");
			icon.className = "fas fa-user-minus";
			td.appendChild(icon);
			row.appendChild(td);
			
			table.appendChild(row);
		}
	}
};

function ReloadDump(){
	xhttp.open("GET", "../model/DUMP_torni.php", true);
	xhttp.send();
}

ReloadDump();

function Preview(files){
	
	var file;		// The file inserted in input.
	var _0bArray;	// The file, but as an array of bytes...

	file = files[0];
	
	var readerByte = new FileReader();
	readerByte.onload = function(){
		var arrayBuffer = this.result;
		_0bArray = new Uint8Array(arrayBuffer);
		
		document.getElementById("filename").innerHTML = file.name;
		document.getElementById("filetype").innerHTML = file.type;
		document.getElementById("filesize").innerHTML = _0bArray.length/1000 + "KB\n";
		
		var readerUrl = new FileReader();
		readerUrl.onload = function(){
			document.getElementById("preview").src = this.result;
		}
		var fileNew = new Blob([_0bArray], {type: file.type});
		readerUrl.readAsDataURL(fileNew);
			
	}
	readerByte.readAsArrayBuffer(file);
}

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
	xhttp2.open("POST", "../controller/REMOVE_torni.php", true);
	xhttp2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp2.setRequestHeader("Accept","application/json");
	xhttp2.send("id="+ this.data +"");
}

