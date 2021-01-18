Feature:收入确认-IR (IR00006)


 Scenario Outline: 统计信息月份 (IR00006)
	 Given API "/api/ir/stat/view/month"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 startDate: 2020-01
	 endDate: 2020-01
	 schoolId:
	 projectId:
	 """


	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
