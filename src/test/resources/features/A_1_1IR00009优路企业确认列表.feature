Feature: 收入确认-IR (IR00009)


  Scenario Outline: 优路企业确认列表 (IR00009)
    Given API "/api/ir/org/item/view/list"
    And Param
	 """
    pageIndex: "0"
    pageSize: "10"
    orderNo:
    orgName:
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