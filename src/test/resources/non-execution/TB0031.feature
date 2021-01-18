Feature: 人才库-TB (TB0031)
人才库-TB API

 Scenario Outline: 企业详细联系记录-列表 (TB0031)
	 Given API "/api/tb/manage/accesslog/detail/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex : 0
	 pageSize : 1
	 corpId : CORP20200311020000000002
	 resumeId : RESUME20200327020000000004
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
