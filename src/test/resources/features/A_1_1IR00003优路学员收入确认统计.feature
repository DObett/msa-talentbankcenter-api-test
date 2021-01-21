Feature: 收入确认-IR (IR00003)


 Scenario Outline: 优路学员收入确认统计 (IR00003)
	 Given API "/api/ir/item/view/stat"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 projectId:
	 schoolId:
	 orderCreatedatestart :
	 orderCreatedateend :
	 orderType :
	 itemdtlAimdatestart : "2019-01"
	 itemdtlAimdateend : "2019-03"
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |



	Scenario Outline: 优路学员收入确认统计 (IR00003)
		Given API "/api/ir/item/view/stat"
		And CookieX
			| TOKEN | ${token} |
		And Param
	 """
	 projectId:
	 schoolId:
	 orderCreatedatestart : ss
	 orderCreatedateend : ss
	 orderType : ss
	 itemdtlAimdatestart : "2019-01"
	 itemdtlAimdateend : "2019-03"
	 """
		When GET
		Then STATUS "200"
		Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
		Examples:
			| jsonPath | value  |
			| result   | GB2001 |
