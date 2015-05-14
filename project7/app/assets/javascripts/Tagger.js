function Tagger(container, behavior) {
	var isMouseDown = false;

	var tag = document.createElement('DIV');
	tag.className = 'tag-create';
	container.appendChild(tag);

	var mouseX = container.offsetLeft;
	var mouseY = container.offsetTop;

	var left = mouseX;
	var width = 0;
	var top = mouseY;
	var height = 0;

	var drawTagBox = function() {
		tag.style.top = top + 'px';
		tag.style.left = left + 'px';
		tag.style.width = width + 'px';
		tag.style.height = height + 'px';
	}

	var onMouseDown = function(evt) {
		isMouseDown = true;

		mouseX = withinXBounds(evt.pageX)
		mouseY = withinYBounds(evt.pageY)

		top = mouseY - container.offsetTop;
		left = mouseX - container.offsetLeft;
		width = 0;
		height = 0;
		drawTagBox();

		tag.style.visibility = "visible";
		
		behavior.onMouseDown();
	};

	var onMouseMove = function(evt) {
		if (!isMouseDown) {
			return;
		}

		var pageX = withinXBounds(evt.pageX);
		width = Math.abs(pageX - mouseX);
		left = Math.min(pageX - container.offsetLeft, mouseX - container.offsetLeft);

		var pageY = withinYBounds(evt.pageY);
		height = Math.abs(pageY - mouseY);
		top = Math.min(pageY - container.offsetTop, mouseY - container.offsetTop);

		drawTagBox()
	}

	var onMouseUp = function(evt) {
		isMouseDown = false;

		if (tag.offsetWidth > 10 && tag.offsetHeight > 10) {
			behavior.onMouseUp(top, height, left, width);
		} else {
			tag.style.visibility = 'hidden';
		}
		
	}

	function withinXBounds(xPos) {
		var xPos1 = Math.max(xPos, container.offsetLeft);
		var xPos2 = Math.min(xPos1, container.offsetLeft + container.offsetWidth);
		return xPos2
	}

	function withinYBounds(yPos) {
		var yPos1 = Math.max(yPos, container.offsetTop);
		var yPos2 = Math.min(yPos1, container.offsetTop + container.offsetHeight);
		return yPos2
	}

	container.onmousedown = onMouseDown;
	container.onmousemove = onMouseMove;
	container.onmouseup = onMouseUp;
}

function TagCreationBehavior(tagForm) {
	// Prevent clicks on the tagForm from bubbling up to the Tagger container
	tagForm.onmousedown = function(evt) {evt.stopPropagation();};
	tagForm.onmouseup = function(evt) {evt.stopPropagation();};

	function onMouseDown() {
		tagForm.style.visibility = "hidden";
	}

	function onMouseUp(top, height, left, width) {
		setTagFormValue('top_px', top);
		setTagFormValue('height_px', height);
		setTagFormValue('left_px', left);
		setTagFormValue('width_px', width);
		tagForm.style.visibility = "visible";
		tagForm.style.left = (left + width + 10) + 'px';
		tagForm.style.top = (top + 10) + 'px';
	}

	function setTagFormValue(field, value) {
		getTagFormInput(field).value = value;
	}

	function getTagFormInput(field) {
		var childNodes = tagForm.getElementsByTagName('form')[0].childNodes;
		for (var i = 0; i < childNodes.length; i++) {
			if (childNodes[i].id == field) {
				return childNodes[i]
			}
		}
		console.log("Found no form input field for: " + field)
	}

	this.onMouseDown = onMouseDown;
	this.onMouseUp = onMouseUp;
}

function setupTagCreation(containerId, tagFormId) {
	var tagForm = document.getElementById(tagFormId);
	var behavior = new TagCreationBehavior(tagForm);

	var container = document.getElementById(containerId);
	new Tagger(container, behavior);
}

function TagDisplay(containerId, top, left, height, width, label, markerId) {
	var container = document.getElementById(containerId);
	var marker = document.getElementById(markerId);

	var tag = document.createElement('DIV');
	tag.className = 'tag-display';
	tag.style.top = top + 'px';
	tag.style.left = left + 'px';
	tag.style.height = height + 'px';
	tag.style.width = width + 'px';

	var tagLabel = document.createElement('DIV');
	tagLabel.className = 'tag-display-label';
	tagLabel.style.visibility = 'hidden';
	tagLabel.innerHTML = label;
	tagLabel.style.top = (top + 10) + 'px';
	tagLabel.style.left = (left + width + 10) + 'px';

	container.appendChild(tag);
	container.appendChild(tagLabel);

	var onMouseOver = function(evt) {
		tag.className = 'tag-display-selected';
		tagLabel.style.visibility = 'visible';
	};

	var onMouseOut = function(evt) {
		tag.className = 'tag-display';
		tagLabel.style.visibility = 'hidden';
	}

	tag.onmouseover = onMouseOver;
	tag.onmouseout = onMouseOut;
	marker.onmouseover = onMouseOver;
	marker.onmouseout = onMouseOut;
}
