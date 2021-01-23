Feature: 收入确认-IR (IR00002)


 Scenario Outline: 优路学员确认项详情 (IR00002)
	 Given API "/api/ir/item/view/info"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
itemId : ${itemId1}
startDate :
endDate :
	 """
	 When GET
	 Then STATUS "200"

	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |


	Scenario Outline: 优路学员确认项详情 (IR00002)
		Given API "/api/ir/item/view/info"
		And CookieX
			| TOKEN | ${token} |
		And Param
	 """
itemId : ITEM20201229010001142812
startDate : 123
endDate :
	 """
		When GET
		Then STATUS "200"

		Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
		Examples:
			| jsonPath | value  |
			| result   | GB2001 |
