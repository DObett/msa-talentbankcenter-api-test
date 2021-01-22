Feature: 人才库-TB (TB0013)
人才库-TB API

 Scenario Outline: 简历信息 (TB0013)
	 Given API "/api/tb/resume/manage/info"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 resumeId : ${resumeId}
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
