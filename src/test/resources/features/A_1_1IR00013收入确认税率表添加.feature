Feature: 收入确认-IR (IR00013)


  Scenario Outline: 收入确认税率表添加 (IR00013)
    Given API "/api/ir/taxrate/add"
    And Param
	 """
     taxrateStartmonth:
     taxrateEndmonth:
     taxrateAmount:
     taxrateType:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     |  GB2001  |