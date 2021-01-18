Feature: 收支明细新增 (FD0001)

@get
Scenario Outline: 正常参数校验
  Given  API "/api/fd/ierecord/add"
  And CookieX
   | TOKEN   |${cookie_token}  |
  And Param
  """
  caccountId: ${caccountId}
  ierecordType: ${ierecordType}
  ierecordDate: ${ierecordDate}
  ierecordAmount: ${ierecordAmount}
  schoolId: ${schoolId}
  ierecordArrivalstatus: ${ierecordArrivalstatus}
  """
  When  GET
  When  GET_STRESS
 | USERS_NUM   |${USERS_NUM}  |
 | PAUSE_TIME   |${PAUSE_TIME}  |
 | RESPONSE_TIME   |${RESPONSE_TIME}  |
 | SUCCESS_PERCENT   |${SUCCESS_PERCENT}  |
  Then  STATUS "200"
  Then  JSONPATH_ASSERT "<jsonPath>" contains "<included>"
  Then  JSONPATH_GET_MONGO
   | data    | returnParam    |
  Then  ASSERT_MYSQL_SQL
  """
  dbName: opensource
  assertTables:
  - sql:
#       - sql: SELECT c.courseId,u.usersourceStatus AS courseGetstatus,cl.collectStatus,a.appointmentStatus FROM OsCourse c LEFT JOIN OsUsersource u ON u.sourceId = c.courseId AND u.sourceType='C' AND u.userId='USER20200310010000000001' LEFT JOIN OsCollect cl ON cl.sourceId = c.courseId AND cl.sourceType='C' AND cl.userId='USER20200310010000000001' LEFT JOIN OsAppointment a ON c.courseId = a.sourceId AND a.sourceType='C' AND a.userId='USER20200310010000000001' AND a.appointmentSystemtype='' WHERE c.courseId='COURSE20191204010000000609'  AND c.courseDelstatus ='N' AND c.courseAvlstatus ='Y' AND (c.courseExpiredtime = '' or c.courseExpiredtime >'2020-10-13 16:16:47') LIMIT 0,1
  """
  Examples:
   | jsonPath  | included  |
   | result    | 00        |


