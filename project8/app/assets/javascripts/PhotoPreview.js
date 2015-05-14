function PhotoPreview(searchBarId, resultsContainerId) {
	var url = "http://localhost:3000/photos/show_thumbnails";
	
	var resultsContainer = document.getElementById(resultsContainerId);

	var searchBar = document.getElementById(searchBarId);
	var onChangeFunction = function() {
		var searchString = searchBar.value
		getPreviewHtml(searchString);
	};
	searchBar.onchange = onChangeFunction;
	onChangeFunction();
	


	function getPreviewHtml(searchStr) {
		console.log("Creating request")
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = xhrHandler;
		xhr.open("GET", url + "?searchStr=" + encodeURIComponent(searchStr));
		xhr.send();
		console.log("Send request")
	}

	function xhrHandler() {
		if (this.readyState != 4) {
			return;
		}
		console.log("Request received")
		resultsContainer.innerHTML = this.responseText;
	}
}