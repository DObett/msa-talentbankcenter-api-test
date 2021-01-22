Feature: 验证码登录
      // http://umsacheck.niceloo.com
  Scenario Outline: 验证码登录
    Given API "/api/uc/login"
	 And Param
    """
          userLoginname : ${userName}
          userLoginpwd : ${passWord}
          userMobile   :
          userFlag : I

    """
    When GET
    Then STATUS "200"
    Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
    Then JSONPATH_GET_MONGO
      | data.token | token |
      | data.userId | userId |
    Examples:
      | jsonPath | value  |
      | result   | 000000 |

#
#  captcha :
#  captchaToken : ${captchaToken}
#  captchaValue : ${captchaValue}
