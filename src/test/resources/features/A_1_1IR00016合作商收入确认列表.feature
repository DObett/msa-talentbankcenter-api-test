Feature: 收入确认-IR (IR00016)


  Scenario Outline: 合作商收入确认列表 (IR00016)
    Given API "/api/ir/pnr/item/view/list"
    And Param
	 """
        pageIndex:
        pageSize:
        orderKey:
        orderVal:
        orderNo:
        companyName:
        projectId:
        schoolId:
        orderCreatedatestart:
        orderCreatedateend:
        orderType:
        itemdtlAimdatestart:
        itemdtlAimdateend:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data | userAgent |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |