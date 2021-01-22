Feature: 收入确认-IR (IR00008)


  Scenario Outline: 订单信息 (IR00008)
    Given API "/api/ir/evidence/orderinfo"
    And Param
	 """
     orderId: ${orderId}
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000  |


  Scenario Outline: 订单信息 (IR00008)
    Given API "/api/ir/evidence/orderinfo"
    And Param
	 """
     orderId: ${orderId
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | GB2001  |