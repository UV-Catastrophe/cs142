
function Calendar(containerId) {
	var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
	var dayNames = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"];

	var createDayHeaderRow = function() {
		var dayHeader = document.createElement("TR");
		dayHeader.className = "day-header";
		for (var i = 0; i < dayNames.length; i++) {
			var dayName = document.createElement("TH");
			dayName.innerHTML = dayNames[i];
			dayHeader.appendChild(dayName);
		};
		return dayHeader;
	};

	var createCalendarTable = function() {
		var calendarTable = document.createElement("TABLE");
		calendarTable.className = "calendar-table";
		return calendarTable;
	};

	var createMonthSkipButton = function(date, skipBy, label) {
		var skipButton = document.createElement("BUTTON");
		skipButton.innerHTML = label;
		var skipDate = new Date(date);
		skipDate.setMonth(skipDate.getMonth() + skipBy);

		skipButton.onclick = function() {render(skipDate)};
		return skipButton;
	};

	var createPrevButton = function(date) {
		return createMonthSkipButton(date, -1, '&lt;');
	};

	var createNextButton = function(date) {
		return createMonthSkipButton(date, 1, '&gt;');
	};

	var createMonthTitleBar = function(date) {
		var titleRow = document.createElement("TR");
		titleRow.className = 'month-title';

		var prevContainer = document.createElement("TD");
		prevContainer.appendChild(createPrevButton(date));

		var nextContainer = document.createElement("TD");
		nextContainer.appendChild(createNextButton(date));

		var titleContainer = document.createElement("TD");
		titleContainer.innerHTML = monthNames[date.getMonth()] + ' ' + date.getFullYear();
		titleContainer.setAttribute("colspan","5");

		titleRow.appendChild(prevContainer);
		titleRow.appendChild(titleContainer);
		titleRow.appendChild(nextContainer);
		return titleRow;
	};

	var setToBeginningOfWeek = function(date) {
		while(date.getDay() > 0) {
			date.setDate(date.getDate() - 1);
		}
	};

	var container = document.getElementById(containerId);
	var dayHeaderRow = createDayHeaderRow();
	var calendarTable = createCalendarTable();
	
	function render(seedDate) {
		var seedMonth = seedDate.getMonth();
		var currDate = new Date(seedDate);

		container.innerHTML = '';
		calendarTable.innerHTML = '';
		
		container.appendChild(calendarTable);

		var createWeekRow = function() {
			var weekRow = document.createElement("TR");
			do {
				var weekDay = document.createElement("TD");
				var dayClass = (currDate.getMonth() == seedMonth) ? "bright" : "faded";
				weekDay.className = dayClass + " day-container";
				weekDay.innerHTML = currDate.getDate();
				weekRow.appendChild(weekDay);
				currDate.setDate(currDate.getDate() + 1);

			} while(currDate.getDay() > 0);
			return weekRow;
		};

		calendarTable.appendChild(createMonthTitleBar(seedDate));
		calendarTable.appendChild(dayHeaderRow);

		currDate.setDate(1);
		setToBeginningOfWeek(currDate);

		do {
			calendarTable.appendChild(createWeekRow());
		} while (currDate.getMonth() == seedMonth);
	}

	this.render = render;
}
