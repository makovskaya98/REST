/**
* @Author : Makovskaya Kristina
* @Date : 30/11/2021
* @description : This class contains methods for converting currency.
*/
public with sharing class CurrencyConverterService {
    public static String END_POINT = 'https://www.nbrb.by/api/exrates/rates';
    /**
     * This method accesses a third party web server https://www.nbrb.by/api/exrates/rates?ondate=2016-7-6&periodicity=0.
     * Returns a json file of the official exchange rate of the Belarusian ruble in relation to foreign currencies.
     * @param dateRate selected date
     * @return List<Object>
     */
    public static List<Object> getCurrencyRateForDate(String dateRate) {
        if (dateRate == null) return null;
        List<Object> results = new List<Object>();
        String endPoint = END_POINT + '?ondate=' + dateRate + '&periodicity=0';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        request.setTimeout(120000);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            try {
                results = (List<Object>) JSON.deserializeUntyped(response.getBody());
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
        return results;
    }
    /**
     * This method accesses a third party web server https://www.nbrb.by/api/exrates/rates?periodicity=0.
     * Returns a json file of the official exchange rate of the Belarusian ruble in relation to foreign currencies.
     * @return List<Object>
     */
    public static List<Object> getCurrency() {
        List<Object> results = new List<Object>();
        String endPoint = END_POINT + '?periodicity=0';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        request.setTimeout(120000);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            try {
                System.debug(response.getBody());
                results = (List<Object>) JSON.deserializeUntyped(response.getBody());
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
        return results;
    }
    /**
     * This method accesses a third party web server https://www.nbrb.by/api/exrates/rates/USD?parammode=2.
     * Returns a json file of the official exchange rate of the Belarusian ruble in relation to 1 US dollar for today.
     * @param curAbbreviation
     * @return
     */
    public static Map<String, Object> getCurrencyAmount(String curAbbreviation) {
        Map<String, Object> results = new Map<String, Object>();
        String endPoint = END_POINT + '/' + curAbbreviation + '?parammode=2';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        request.setTimeout(120000);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            try {
                results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
        return results;
    }
}