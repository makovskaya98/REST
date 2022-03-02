@IsTest
global with sharing class CurrencyConverterControllerTest {
    @isTest static void testCallout() {
        Test.setMock(HttpCalloutMock.class, new MockCurrencyRateForDate());
        List<Object> res = CurrencyConverterService.getCurrencyRateForDate('2021-02-02');
        System.debug(res);
    }
    @isTest static void testCallout2() {
        Test.setMock(HttpCalloutMock.class, new MockCurrency());
        List<Object> res = CurrencyConverterService.getCurrency();
        System.assert(!res.isEmpty());
    }
    @isTest static void testCallout3() {
        Test.setMock(HttpCalloutMock.class, new MockCurrencyAmount());
        Map<String, Object> res = CurrencyConverterService.getCurrencyAmount('usd');
        System.assert(!res.isEmpty());
    }
}