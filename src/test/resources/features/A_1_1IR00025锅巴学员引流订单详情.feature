Feature: 收入确认-IR (IR00025)


  Scenario Outline: 锅巴学员引流订单详情 (IR00025)
    Given API "/api/ir/gb/item/view/trgivinfo"
    And Param
	 """
       itemId: ${itemId}
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"

    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |