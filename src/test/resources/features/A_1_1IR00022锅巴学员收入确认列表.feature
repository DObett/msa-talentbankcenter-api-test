Feature: 收入确认-IR (IR00022)


  Scenario Outline: 锅巴学员收入确认列表 (IR00022)
    Given API "/api/ir/gb/item/view/list"
    And Param
	 """
    pageIndex: "0"
    pageSize: "10"
    orderNo:
    userId:
    itemdtlAimdatestart:
    itemdtlAimdateend:
    projectId:
    schoolId:
    orderType:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data.data.itemId[0]| itemId |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |