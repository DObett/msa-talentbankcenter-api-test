Feature: 收入确认-IR (IR00023)


  Scenario Outline: 锅巴学员收入确认详情 (IR00023)
    Given API "/api/ir/gb/item/view/info"
    And Param
	 """
       itemId: ${itemId}
       startDate:
       endDate:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"

    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |