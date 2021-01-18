Feature: 收入确认-IR (IR00010)


  Scenario Outline: 优路企业确认项详情 (IR00010)
    Given API "/api/ir/org/item/view/info"
    And Param
    """
    itemId: ${itemId}
    """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |