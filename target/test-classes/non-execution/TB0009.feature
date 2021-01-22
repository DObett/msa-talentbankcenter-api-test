Feature: 人才库-TB (TB0009)
人才库-TB API

 Scenario Outline: 学历审核详情 (TB0009)
	 Given API "/api/tb/approve/edu/info"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 approveId : ${approveId}
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
