Feature: 人才库-TB (TB0015)
人才库-TB API

 Scenario Outline: 证书类型到项目列表 (TB0015)
	 Given API "/api/tb/project/tree"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 brandId :
	 projectAvlstatus : Y
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
