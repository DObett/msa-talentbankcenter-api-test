Feature: 人才库-TB (TB0021)
人才库-TB API

 Scenario Outline: 职位添加 (TB0021)
	 Given API "/api/tb/manage/job/add"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 corpId : CORP20200311020000000002
	 jobName : 测试工程师
	 jobYears : B
	 ctId : CERT20200328020000000001
	 jobEdulevel : 5
	 jobSalary : C
	 jobDuties : 职责就是发现bug
	 jobQualification : 资格就是没有资格
	 jobBasicwelfare : A
	 jobSpecialwelfare : 每天可以享受免费加班
	 jobPeoplecount : 1
	 jobAreacode : 110000
	 jobDisplaystatus : N
	 jobcorpMail :
	 jobAddress : 请百度一下
	 jobRoomnumber : 110
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Then JSONPATH_GET_MONGO
	 | data.jobId| jobId |
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
