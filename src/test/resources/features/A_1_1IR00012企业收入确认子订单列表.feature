Feature: 收入确认-IR (IR00012)


  Scenario Outline: 企业收入确认子订单列表 (IR00012)
    Given API "/api/ir/org/member/list"
    And Param
	 """
     itemId: ${itemId}
     pageIndex:
     pageSize:
     orderKey:
     orderVal:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |