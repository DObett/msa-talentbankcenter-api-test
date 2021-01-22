Feature: 人才库-TB (TB0017)
人才库-TB API

 Scenario Outline: 行业详情 (TB0017)
	 Given API "/api/tb/manage/industry/info"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 industryId : ${industryId}
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
