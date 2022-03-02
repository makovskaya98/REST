({
    init: function (component, event, helper) {
        helper.getForeignCurrency(component, event, helper);
    },
    getTable: function (component, event, helper) {
        let date = component.get('v.date');
        helper.getData(component, date);
    },
    convertCurrency: function (component, event, helper) {
        let amount = component.get('v.amountBelRub');
        let curAbbreviation = component.get('v.curAbbreviation');
        helper.getConvertAmount(component, event, helper, amount, curAbbreviation);
    },
    convertForeignCurrency: function (component, event, helper) {
        let amount = component.get('v.amountForCurr');
        let convertCurrencyFrom = component.get('v.convertCurrencyFrom');
        let convertCurrencyTo = component.get('v.convertCurrencyTo');
        helper.getConvertForeignCurrency(component, event, helper, amount, convertCurrencyFrom, convertCurrencyTo);
    }
});