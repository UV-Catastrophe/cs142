
function tableScanInit() {
	var queryButton = document.getElementById('query-button');
	var colnameInput = document.getElementById('colname-input');
	var tablenameInput = document.getElementById('tablename-input');
	var queryResults = document.getElementById('query-results');

	var tableScans = {
		'table1': new TableScan('table1'),
		'table2': new TableScan('table2'),
		'goofy': new TableScan('goofy')
	};

	var getQueryResult = function(tablename, colname) {
		var tableScan = tableScans[tablename];
		if (tableScan === undefined) {
			return 'No table found for name ' + tablename + '.';
		}

		var colSum = tableScan.sumColumn(colname);
		return 'Column ' + colname + ' in table ' + tablename + ' sums to ' + colSum + '.';
	};

	queryButton.onclick = function() {
		var tablename = tablenameInput.value;
		var colname = colnameInput.value;
		queryResults.innerHTML = getQueryResult(tablename, colname);
	}
}
