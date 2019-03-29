function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function Notify(msg, error){
	
	var p = document.createElement("p");
	var txt = document.createTextNode(msg);
	p.appendChild(txt);
	
	p.classList.add("notify");
	p.style.left = "35px";
	if(error) {p.style.backgroundColor = "red";}
	
	var high = document.getElementsByClassName("notify");
	
	p.style.top = window.innerHeight - 35 - ((high.length + 1) * 35) + "px";
	
	document.querySelector("body").appendChild(p);
	
	await sleep(5000);
	
	high[0].remove();
	
	var high = document.getElementsByClassName("notify");
	for(i = 0; i < high.length; i++){
		var h = high[i].style.top;
		high[i].style.top = (Number(h.substring(0, h.length - 2)) + 35) + "px";
	}
}