Feature: 人才库-TB (TB0024)
人才库-TB API

 Scenario Outline: 职位列表 (TB0024)
	 Given API "/api/tb/manage/job/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex : 0
	 pageSize : 1
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
