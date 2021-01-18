Feature: 收入确认-IR (IR00014)


  Scenario Outline: 个人税金统计 (IR00014)
    Given API "/api/ir/item/view/taxstat"
    And Param
	 """
     projectId:
     schoolId:
     orderType:
     itemdtlAimdatestart:
     itemdtlAimdateend:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |