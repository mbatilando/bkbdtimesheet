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

	keyword(:MondayTimeIn) {browser.select_list(:name, "TuesdayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "TuesdayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "TuesdayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "TuesdayTimeOut")}

	keyword(:MondayTimeIn) {browser.select_list(:name, "WednesdayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "WednesdayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "WednesdayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "WednesdayTimeOut")}

	keyword(:MondayTimeIn) {browser.select_list(:name, "ThursdayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "ThursdayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "ThursdayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "ThursdayTimeOut")}

	keyword(:MondayTimeIn) {browser.select_list(:name, "FridayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "FridayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "FridayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "FridayTimeOut")}

	keyword(:MondayTimeIn) {browser.select_list(:name, "SaturdayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "SaturdayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "SaturdayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "SaturdayTimeOut")}

	keyword(:MondayTimeIn) {browser.select_list(:name, "SundayTimeIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "SundayLunchIn")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "SundayLunchOut")}
	keyword(:MondayTimeIn) {browser.select_list(:name, "SundayTimeOut")}
end