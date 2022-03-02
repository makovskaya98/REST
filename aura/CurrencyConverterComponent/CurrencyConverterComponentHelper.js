({
    getForeignCurrency: function (component, event, helper) {
        var action = component.get('c.getCurrency');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.foreignCurrency', response.getReturnValue());
                component.set('v.curAbbreviation', response.getReturnValue()[0].Cur_Abbreviation);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    getData: function (component, date) {
        var action = component.get('c.getExchangeRate');
        action.setParams({dateExchangeRate: date});
        component.set('v.columns', [
            {label: 'Cur ID', fieldName: 'Cur_ID', type: 'text'},
            {label: 'Cur Abbreviation', fieldName: 'Cur_Abbreviation', type: 'text'},
            {label: 'Cur Name', fieldName: 'Cur_Name', type: 'text'},
            {label: 'Cur OfficialRate', fieldName: 'Cur_OfficialRate', type: 'text'}
        ]);
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {

                component.set('v.data', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    getConvertAmount: function (component, event, helper, amount, curAbbreviation) {
        var action = component.get('c.convertAmount');
        action.setParams({curAbbreviation: curAbbreviation});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                let amountCurrency = (response.getReturnValue().Cur_OfficialRate * amount).toFixed(3);
                component.set('v.convertedAmountBelRub', amountCurrency);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    getConvertForeignCurrency: function (component, event, helper, amount, convertCurrencyFrom, convertCurrencyTo) {
        var action = component.get('c.convertForeignAmount');
        action.setParams({convertCurrencyFrom: convertCurrencyFrom, convertCurrencyTo: convertCurrencyTo});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                let amountCurrency = (((response.getReturnValue()[0].Cur_OfficialRate).toFixed(3) / (response.getReturnValue()[1].Cur_OfficialRate).toFixed(3)) * amount).toFixed(3);
                component.set('v.convertedAmountForCur', amountCurrency);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    }
});