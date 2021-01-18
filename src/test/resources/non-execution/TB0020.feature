Feature: 人才库-TB (TB0020)
人才库-TB API

 Scenario Outline: 行业可用状态修改 (TB0020)
	 Given API "/api/tb/manage/industry/usablestatus/edit"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 industryId : ${industryId}
	 industryUsablestatus : N
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
