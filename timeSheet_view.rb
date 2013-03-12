class timeSheetView
	keyword(:loginUsername)	{browser.text_field(:name, 'login-username')}
	keyword(:loginPassword) {browser.text_field(:name, 'login-password')}
	keyword(:loginCheckBox)	{browser.checkbox(:id, 'rememberMe')}
	keyword(:loginBut)		{browser.button(:name, 'loginBut')}

	keyword(:managerName)	{browser.select_list(:name, 'manager')}
	keyword(:internName)	{browser.text_field(:name, 'intern_name')}
	keyword(:internEmail)	{browser.text_field(:name, 'cc')}
	keyword(:date)			{browser.text_field(:name, 'weekof')}


	keyword(:MondayTimeIn) {browser.select_list(:name, "MondayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "MondayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "MondayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "MondayTimeOut")}
	keyword(:MondayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 5).text}

	keyword(:TuesdayTimeIn) {browser.select_list(:name, "TuesdayTimeIn")}
	keyword(:TuesdayTimeIn) {browser.select_list(:name, "TuesdayLunchIn")}
	keyword(:TuesdayTimeIn) {browser.select_list(:name, "TuesdayLunchOut")}
	keyword(:TuesdayTimeIn) {browser.select_list(:name, "TuesdayTimeOut")}
	keyword(:TuesdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 11).text}

	keyword(:WednesdayTimeIn) {browser.select_list(:name, "WednesdayTimeIn")}
	keyword(:WednesdayTimeIn) {browser.select_list(:name, "WednesdayLunchIn")}
	keyword(:WednesdayTimeIn) {browser.select_list(:name, "WednesdayLunchOut")}
	keyword(:WednesdayTimeIn) {browser.select_list(:name, "WednesdayTimeOut")}
	keyword(:WednesdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 17).text}

	keyword(:ThursdayTimeIn) {browser.select_list(:name, "ThursdayTimeIn")}
	keyword(:ThursdayTimeIn) {browser.select_list(:name, "ThursdayLunchIn")}
	keyword(:ThursdayTimeIn) {browser.select_list(:name, "ThursdayLunchOut")}
	keyword(:ThursdayTimeIn) {browser.select_list(:name, "ThursdayTimeOut")}
	keyword(:ThursdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 23).text}

	keyword(:FridayTimeIn) {browser.select_list(:name, "FridayTimeIn")}
	keyword(:FridayTimeIn) {browser.select_list(:name, "FridayLunchIn")}
	keyword(:FridayTimeIn) {browser.select_list(:name, "FridayLunchOut")}
	keyword(:FridayTimeIn) {browser.select_list(:name, "FridayTimeOut")}
	keyword(:FridayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 29).text}

	keyword(:SaturdayTimeIn) {browser.select_list(:name, "SaturdayTimeIn")}
	keyword(:SaturdayTimeIn) {browser.select_list(:name, "SaturdayLunchIn")}
	keyword(:SaturdayTimeIn) {browser.select_list(:name, "SaturdayLunchOut")}
	keyword(:SaturdayTimeIn) {browser.select_list(:name, "SaturdayTimeOut")}
	keyword(:SaturdayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 35).text}

	keyword(:SundayTimeIn) {browser.select_list(:name, "SundayTimeIn")}
	keyword(:SundayTimeIn) {browser.select_list(:name, "SundayLunchIn")}
	keyword(:SundayTimeIn) {browser.select_list(:name, "SundayLunchOut")}
	keyword(:SundayTimeIn) {browser.select_list(:name, "SundayTimeOut")}
	keyword(:SundayTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 41).text}

	keyword(:WeekTotal)  {browser.table(:index, 0).tbody(:index, 0).cell(:index, 46).text}

	keyword(:submitButton) {browser.button(:name, 'submitBut2')}
	keyword(:submitConfirm) {browser.button(:name, 'modalConfirm')}
	keyword(:submitNegate) {browser.button(:name, 'cancelSub')}
end