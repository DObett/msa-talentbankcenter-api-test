Feature: 人才库-TB (TB0018)
人才库-TB API

 Scenario Outline: 行业修改 (TB0018)
	 Given API "/api/tb/manage/industry/edit"
	 Given RANDOM_DATA
	 And  CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 industryId : ${industryId}
	 industryName : ${DescChinese}
	 industryUsablestatus : N
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
