Feature: 收入确认-IR (IR00011)


  Scenario Outline: 优路企业收入确认统计 (IR00011)
    Given API "/api/ir/org/item/view/stat"
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