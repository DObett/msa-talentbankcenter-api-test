Feature: 收入确认-IR (IR00030)


  Scenario Outline: 小微税金统计 (IR00030)
    Given API "/api/ir/tra/view/taxstat"
    And Param
	 """
        itemdtlAimdatestart:
        itemdtlAimdateend:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"

    Examples:
      | JsonResult  |   value |
      |  result     | 000000  |