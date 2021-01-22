Feature: 收入确认-IR (IR00026)


  Scenario Outline: 小微学员收入确认列表 (IR00026)
    Given API "/api/ir/tra/view/list"
    And Param
	 """
    pageIndex: "0"
    pageSize: "10"
    orderNo:
    startDate:
    endDate:
	 """
    When GET
    Then STATUS "200"

    Then JSONPATH_ASSERT "<JsonResult>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data.data.traitemId[0]| traitemId |
    Examples:
      | JsonResult  |   value |
      |  result     | 000000 |