Feature: 收入确认-IR (IR00027)


  Scenario Outline: 小微学员收入确认详情 (IR00027)
    Given API "/api/ir/tra/view/info"
    And Param
	 """
    traitemId: ${traitemId}
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"

    Examples:
      | JsonResult  |   value |
      |  result     | 000000  |