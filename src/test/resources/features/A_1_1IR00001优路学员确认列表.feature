Feature: 收入确认-IR (IR00001)


    Scenario Outline: 优路学员确认列表 (IR00001)
	 Given API "/api/ir/item/view/list"
	 And CookieX
		 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex :
	 pageSize :
	 orderNo :
	 userId :
	 projectId :
	 schoolId :
	 orderType :
	 itemdtlAimdatestart :
	 itemdtlAimdateend :


	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_GET_MONGO
		 | data.data.itemId[0]| itemId |
		 | data.data.orderId[0]| orderId|

	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value |
	 |data.data[0].classes[0].className| 2020执业中药师四科联报贺岁无忧班 |
	 |  result  | 000000|


	Scenario Outline: 优路学员确认列表 (IR00001)

		Given API "/api/ir/item/view/list"
		And CookieX
			| TOKEN | ${token} |
		And Param
	 """
	 pageIndex :
	 pageSize :
	 orderNo :
	 userId :
	 projectId :
	 schoolId :
	 orderType :
	 itemdtlAimdatestart : 123
	 itemdtlAimdateend : 123


	 """
		When GET
		Then STATUS "200"

		Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
		Examples:
			| jsonPath | value |
			|  result  | GB1001|

