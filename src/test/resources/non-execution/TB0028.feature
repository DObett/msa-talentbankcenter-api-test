Feature: 人才库-TB (TB0028)
人才库-TB API

 Scenario Outline: 投递管理列表 (TB0028)
	 Given API "/api/tb/manage/jobsend/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex :   0
	 pageSize :   1
	 orderKey :
	 orderVal :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
