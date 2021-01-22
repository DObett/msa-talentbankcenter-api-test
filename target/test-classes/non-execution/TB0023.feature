Feature: 人才库-TB (TB0023)
人才库-TB API

 Scenario Outline: 职位修改 (TB0023)
	 Given API "/api/tb/manage/job/edit"
	 And CookieX
	 | TOKEN | ${token} |
	 And Param
	 """
	 jobId : ${jobId}
	 corpId : CORP20200311020000000002
	 jobName : 测试开发工程师
	 jobYears : B
	 ctId : CERT20200328020000000001
	 jobEdulevel : 5
	 jobSalary : C
	 jobDuties : 职责就是自己写bug，自己发现bug，自己修复bug
	 jobQualification : 能吃、能睡、能玩
	 jobBasicwelfare : A
	 jobSpecialwelfare : 拍马屁不收费
	 jobPeoplecount : 10
	 jobAreacode : 110000
	 jobDisplaystatus : N
	 jobcorpMail :
	 jobAddress : 请百度一下
	 jobRoomnumber : 111
	 """
	 When GET
	 Then STATUS "200"
	 Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
	 Examples:
	 | jsonPath | value  |
	 | result   | 000000 |
