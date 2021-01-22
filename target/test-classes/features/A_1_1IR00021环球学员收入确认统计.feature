Feature: 收入确认-IR (IR00021)


  Scenario Outline: 环球学员收入确认统计 (IR00021)
    Given API "/api/ir/hq/item/view/stat"
    And Param
	 """
     projectId:
     schoolId:
     orderType:
     itemdtlAimdatestart: 2020-01
     itemdtlAimdateend: 2020-01
     orderCreatedatestart:
     orderCreatedateend:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |