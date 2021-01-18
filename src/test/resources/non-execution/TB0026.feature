Feature: 人才库-TB (TB0026)
人才库-TB API

 Scenario Outline: 行业职位列表 (TB0026)
	 Given API "/api/tb/manage/industry/job/list"
	 And CookieX
	 | TOKEN | ${token} |
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
