/**
 * @Author : Makovskaya Kristina
 * @Date : 30/11/2021
 * @description : This class contains methods for working with currency conversion.
 */
public with sharing class CurrencyConverterController {
    /**
     * This method calls the CurrencyConverterService class and returns a list of arrays of Rate objects.
     * @param dateExchangeRate
     * @return List<Object>
     */
    @AuraEnabled
    public static List<Object> getExchangeRate(String dateExchangeRate) {
        return CurrencyConverterService.getCurrencyRateForDate(dateExchangeRate);
    }
    /**
     * This method calls the CurrencyConverterService class and returns a list of arrays of Rate objects.
     * @return List<Object>
     */
    @AuraEnabled
    public static List<Object> getCurrency() {
        return CurrencyConverterService.getCurrency();
    }
    /**
     * This method calls the CurrencyConverterService class and returns a Map<String, Object> of arrays of Rate objects.
     * @param curAbbreviation
     * @return Map<String, Object>
     */
    @AuraEnabled
    public static Map<String, Object> convertAmount(String curAbbreviation) {
        return CurrencyConverterService.getCurrencyAmount(curAbbreviation);
    }
    /**
     * This method calls the CurrencyConverterService class and returns a list of arrays of Rate objects.
     * @param curAbbreviation
     * @param curAbbreviation2
     * @return List<Object>
     */
    @AuraEnabled
    public static List<Object> convertForeignAmount(String convertCurrencyFrom, String convertCurrencyTo) {
        return new List<Object>{
            CurrencyConverterService.getCurrencyAmount(convertCurrencyFrom),
            CurrencyConverterService.getCurrencyAmount(convertCurrencyTo)
        };
    }
}