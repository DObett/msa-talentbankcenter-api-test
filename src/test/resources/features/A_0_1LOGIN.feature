Feature: 图形验证码

  Scenario Outline: 图形验证码
    Given API "/api/sc/captcha/token"
	 And Param
    """
    captchaScene :
    captchaType:

    """
    When GET
    Then STATUS "200"
    Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
    Then JSONPATH_GET_MONGO
#    |data|captcha_data|
      | data.captchaToken | captchaToken |
      | data.captchaValue | captchaValue |
    Examples:
      | jsonPath | value  |
      | result   | 000000 |


