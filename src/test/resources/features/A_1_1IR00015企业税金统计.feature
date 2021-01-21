Feature: 收入确认-IR (IR00015)


  Scenario Outline: 企业税金统计 (IR00015)
    Given API "/api/ir/org/item/view/taxstat"
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


  Scenario Outline: 企业税金统计 (IR00015)
    Given API "/api/ir/org/item/view/taxstat"
    And Param
	 """
     projectId:
     schoolId: s
     orderType: ss
     itemdtlAimdatestart: ss
     itemdtlAimdateend:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | GB1001 |