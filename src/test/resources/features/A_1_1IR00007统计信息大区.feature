Feature: 收入确认-IR (IR00007)


 Scenario Outline: 统计信息大区 (IR00007)
	 Given API "/api/ir/stat/view/area"
	 And Param
	 """
     startDate: 2020-01
     endDate: 2020-01
     projectId:
	 """
	 When GET
	 Then STATUS "200"

	 Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
	 Then JSONPATH_GET_MONGO
		 | data | userAgent |
	 Examples:
		 | JsonResult  |   value |
		 |  result     | 000000 |




	Scenario Outline: 统计信息大区 (IR00007)
		Given API "/api/ir/stat/view/area"
		And Param
	 """
     startDate: 2020-01
     endDate: 2020-01
     projectId: ssss
	 """
		When GET
		Then STATUS "200"

		Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
		Then JSONPATH_GET_MONGO
			| data | userAgent |
		Examples:
			| JsonResult  |   value |
			|  result     | 000000 |