Feature: 人才库-TB (TB0025)
人才库-TB API

 Scenario Outline: 职位显示状态修改 (TB0025)
	 Given API "/api/tb/manage/job/displaystatus/edit"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 jobId : ${jobId}
	 jobDisplaystatus : N
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
