Feature: 人才库-TB (TB0030)
人才库-TB API

 Scenario Outline: 企业拨打记录统计导出 (TB0030)
	 Given API "/api/tb/manage/accesslog/export"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 corpId : CORP20200311020000000002
	 resumeName :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
