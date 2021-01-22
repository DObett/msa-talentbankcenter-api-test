Feature: 人才库-TB (TB0012)
人才库-TB API

 Scenario Outline: 证书类型列表 (TB0012)
	 Given API "/api/tb/certtype/select/all/list"
	 And CookieX
	 | TOKEN | ${token} |
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
