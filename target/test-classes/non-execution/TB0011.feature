Feature: 人才库-TB (TB0011)
人才库-TB API

 Scenario Outline: 人才管理查询列表 (TB0011)
	 Given API "/api/tb/resume/manage/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex : 0
	 pageSize : 1
	 ctId :
	 resumeMobile :
	 workareaCode :
	 resumeEdulevel :
	 resumeName :
	 createStartdate :
	 createEnddate :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Then JSONPATH_GET_MONGO
	 | data.data[0].resumeId | resumeId |
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
