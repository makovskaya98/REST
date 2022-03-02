@isTest
global with sharing class MockCurrencyAmount implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('https://www.nbrb.by/api/exrates/rates/usd?parammode=2', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"Cur_ID":431,"Date":"2021-12-02T00:00:00","Cur_Abbreviation":"USD","Cur_Scale":1,"Cur_Name":"Доллар США","Cur_OfficialRate":2.5397}');
        res.setStatusCode(200);
        return res;
    }
}