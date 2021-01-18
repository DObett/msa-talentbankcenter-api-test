Feature: 人才库-TB (TB0019)
人才库-TB API

 Scenario Outline: 行业列表 (TB0019)
	 Given API "/api/tb/manage/industry/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex : 0
	 pageSize : 1
	 orderKey :
	 orderVal :
	 industryName :
	 industryDelstatus :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
