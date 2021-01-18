Feature: 收入确认-IR (IR00004)


Scenario Outline: 统计信息项目 (IR00004)
	Given API "/api/ir/stat/view/project"
	And CookieX
	| TOKEN | ${token} |
	And Param
	 """
     startDate: 2020-2
     endDate: 2020-2
     schoolId: ""
	 """


	When GET
	Then STATUS "200"
	Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	Examples:
	| jsonPath | value  |
	| result   | 000000 |
