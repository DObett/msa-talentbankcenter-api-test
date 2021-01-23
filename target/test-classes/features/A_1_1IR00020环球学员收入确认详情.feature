Feature: 收入确认-IR (IR00020)


  Scenario Outline: 环球学员收入确认详情 (IR00020)
    Given API "/api/ir/hq/item/view/info"
    And Param
	 """
       itemId: ${itemId2}
       startDate:
       endDate:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |