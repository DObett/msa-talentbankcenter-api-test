Feature: 人才库-TB (TB0008)
人才库-TB API

 Scenario Outline: 学历审核列表 (TB0008)
	 Given API "/api/tb/approve/edu/list"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 pageIndex : 0
	 pageSize : 1
	 approveStatus :
	 approveApplyermobile :
	 eduLevel :
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Then JSONPATH_GET_MONGO
		 | data.data[0].approveId | approveId |
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
