Feature: 人才库-TB (TB0027)
人才库-TB API

 Scenario Outline: 职位审核 (TB0027)
	 Given API "/api/tb/manage/job/approve"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 jobId : ${jobId}
	 jobApprovestatus : P
	 jobApprovedesc : testbes
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
