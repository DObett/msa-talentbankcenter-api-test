Feature: 人才库-TB (TB0016)
人才库-TB API

 Scenario Outline: 行业添加 (TB0016)
	 Given API "/api/tb/manage/industry/add"
	 Given RANDOM_DATA
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 industryName : ApiTestName${DescChinese}
	 industryUsablestatus : N
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Then JSONPATH_GET_MONGO
	 | data.industryId| industryId |
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
