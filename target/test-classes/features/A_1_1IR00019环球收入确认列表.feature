Feature: 收入确认-IR (IR00019)


  Scenario Outline: 环球收入确认列表 (IR00019)
    Given API "/api/ir/hq/item/view/list"
    And Param
	 """

        pageIndex:
        pageSize:
        orderNo:
        userId:
        projectId:
        schoolId:
        orderType:
        itemdtlAimdatestart:
        itemdtlAimdateend:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data.data.itemId[0]| itemId |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |