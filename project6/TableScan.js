
function TableScan(tableId) {
	var tableBody = document.getElementById(tableId).getElementsByTagName('tbody')[0];
	var rows = tableBody.getElementsByTagName('tr');
	var colHeaders = rows[0].getElementsByTagName('td');

	var findColumn = function(str) {
		for (i = 0; i < colHeaders.length; i++) {
			if (colHeaders[i].innerHTML === str) {
				return i;
			}
		}
		return -1;
	};

	var getColValue = function(row, index) {
		rowContainers = row.getElementsByTagName('td');
		if (index >= rowContainers.length || index < 0) {
			return 0;
		}
		var content = rowContainers[index].innerHTML;
		return convertToNumber(content);
	};

	var convertToNumber = function(string) {
		var attempt = Number(string);
		if (isNaN(attempt)) {
			return 0;
		}
		return attempt;
	};

	this.sumColumn = function(colName) {
		var colIndex = findColumn(colName);
		if (colIndex < 0) {
			return 0;
		}

		var colSum = 0;
		for (i = 1; i < rows.length; i++) {
			colSum += getColValue(rows[i], colIndex);
		}
		return colSum;
	};
}
