Feature: 人才库-TB (TB0010)
人才库-TB API

 Scenario Outline: 人才审核日志列表 (TB0010)
	 Given API "/api/tb/approvelog/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex :
	 pageSize :
	 approveType :
	 approveApplyermobile :
	 approveCheckername :
	 approveStartdate :
	 approveEnddate :
	 approveResult :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
