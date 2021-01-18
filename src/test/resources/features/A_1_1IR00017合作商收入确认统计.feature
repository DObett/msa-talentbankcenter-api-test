Feature: 收入确认-IR (IR00017)


  Scenario Outline: 合作商收入确认统计 (IR00017)
    Given API "/api/ir/pnr/item/view/stat"
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