Feature: 人才库-TB (TB0014)
人才库-TB API

 Scenario Outline: 基础配置删除 (TB0014)
	 Given API "/api/tb/config/delete"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 configId : CONFIG20200413020000000001
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | data.code   | 3000 |
