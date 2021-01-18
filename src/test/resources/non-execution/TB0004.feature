Feature: 人才库-TB (TB0004)
人才库-TB API

 Scenario Outline: 基础配置保存证书类型 (TB0004)
	 Given API "/api/tb/certtype/config/save"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 ctId :
	 projectId : PROJECT20191126010000000213
	 ctName : testCtName
	 ctPicpath : test
	 ctUploadable : N
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Then JSONPATH_GET_MONGO
	 | data.ctId | ctId |
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
