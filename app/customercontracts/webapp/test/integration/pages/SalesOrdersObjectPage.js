sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sap.fe.mysecondapp.customercontracts',
            componentId: 'SalesOrdersObjectPage',
            entitySet: 'SalesOrders'
        },
        CustomPageDefinitions
    );
});