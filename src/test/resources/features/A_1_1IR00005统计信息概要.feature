Feature: 收入确认-IR (IR00005)


 Scenario Outline: 统计信息概要 (IR00005)
	 Given API "/api/ir/stat/view/info"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 startDate: 2020-01
	 endDate: 2020-01
	 """
	 When GET
	 Then STATUS "200"

	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |

