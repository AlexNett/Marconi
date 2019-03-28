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
	if(e.keyCode === 27){
		this.value = this.placeholder;
		this.blur();
	}
}

function Edit(){
	
	var camps = this.parentElement.childNodes;
	if(this.querySelector("input") != null ) { return; }
	var input = document.createElement("input")
	input.placeholder = this.innerHTML;
	input.onchange = EditDB;
	input.onblur = Revert;
	input.onkeydown = Enter;
	this.innerHTML = "";
	this.appendChild(input);
	this.querySelector("input").focus();
}