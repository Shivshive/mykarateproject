Feature: browser automation 1

  Background: 
    * configure driver = { type: 'chromedriver'}

  @sanity
  Scenario: try to login to github
    Given driver 'https://github.com/login'
    And input('input#login_field', 'dummy')
    And input('input#password', 'world')
    When submit().click("input[name='commit']")
    Then match html('.flash-error') contains 'Incorrect username or password.'

  @sanity
  Scenario: Do a google search
    Given driver 'https://google.com'
    And input("input[name='q']", 'karate dsl')
    When submit().click("input[name='btnI']")
    Then waitForUrl('https://github.com/karatelabs/karate')
  
  @ignore
  Scenario: print hello
    * print 'Hello My Cucumber Case'
