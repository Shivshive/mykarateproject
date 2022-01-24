Feature: amazon test case

    Background:
        * configure driver = { type: 'chromedriver' }

    @amazon
    Scenario: amazon home page search ipad
        Given driver 'https://www.amazon.in'
        And waitForUrl('https://www.amazon.in')
        And waitFor('input[id=twotabsearchtextbox]')
        And input('input[id=twotabsearchtextbox]', 'ipad')
        And click('input[id=nav-search-submit-button]')
        * waitUntil("document.readyState == 'complete'")
        Then waitFor('div.s-main-slot.s-result-list.s-search-results > div a .s-image:nth-child(1)')
        # * def images = locate('div.s-main-slot.s-result-list.s-search-results > div a .s-image:nth-child(1)')
        # * if (!images.present) karate.fail('results not present')

    @amazon
    Scenario: amazon home page search iphone
        Given driver 'https://www.amazon.in'
        And waitForUrl('https://www.amazon.in')
        And waitFor('input[id=twotabsearchtextbox]')
        And input('input[id=twotabsearchtextbox]', 'iphone')
        And click('input[id=nav-search-submit-button]')
        * waitUntil("document.readyState == 'complete'")
        Then waitFor('div.s-main-slot.s-result-list.s-search-results > div a .s-image:nth-child(1)')
        # * def images = locate('div.s-main-slot.s-result-list.s-search-results > div a .s-image:nth-child(1)')
        # * if (!images.present) karate.fail('results not present')
