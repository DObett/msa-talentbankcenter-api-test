Feature: 人才库-TB (TB0022)
人才库-TB API

 Scenario Outline: 职位详情 (TB0022)
	 Given API "/api/tb/manage/job/info"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 jobId : JOB20200824020000000002
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | msg   | 暂无数据，不支持导出 |
