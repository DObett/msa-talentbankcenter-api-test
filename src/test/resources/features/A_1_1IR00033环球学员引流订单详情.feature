Feature: 收入确认-IR (IR00033)


  Scenario Outline: 环球学员引流订单详情 (IR00033)
    Given API "/api/ir/hq/item/view/trgivinfo"
    And Param
	 """
      itemId: ${itemId2}
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"

    Examples:
      | JsonResult | value  |
      | result     | 000000 |