Feature: 收入确认-IR (IR00028)


  Scenario Outline: 小微统计 (IR00028)
    Given API "/api/ir/tra/view/stat"
    And Param
	 """
    startDate:
    endDate:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"

    Examples:
      | JsonResult  |   value |
      |  result     | 000000  |