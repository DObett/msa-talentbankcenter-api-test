Feature: 人才库-TB (TB0029)
人才库-TB API

 Scenario Outline: 企业联系记录列表 (TB0029)
	 Given API "/api/tb/manage/accesslog/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex : 0
	 pageSize : 1
	 corpId :
	 resumeName :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
