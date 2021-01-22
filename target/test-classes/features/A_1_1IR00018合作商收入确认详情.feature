Feature: 收入确认-IR (IR00018)


  Scenario Outline: 合作商收入确认详情 (IR00018)
    Given API "/api/ir/pnr/item/view/info"
    And Param
	 """
        itemId: PNRITEM20210105010000003978
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |