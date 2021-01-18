Feature: 收入确认-IR (IR00029)


  Scenario Outline: 合作商税金统计 (IR00029)
    Given API "/api/ir/pnr/item/view/taxstat"
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

    Examples:
      | JsonResult  |   value |
      |  result     | 000000  |