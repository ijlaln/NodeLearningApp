sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/fe/mysecondapp/customercontracts/test/integration/FirstJourney',
		'sap/fe/mysecondapp/customercontracts/test/integration/pages/CustomerContractList',
		'sap/fe/mysecondapp/customercontracts/test/integration/pages/CustomerContractObjectPage',
		'sap/fe/mysecondapp/customercontracts/test/integration/pages/SalesOrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomerContractList, CustomerContractObjectPage, SalesOrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/fe/mysecondapp/customercontracts') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomerContractList: CustomerContractList,
					onTheCustomerContractObjectPage: CustomerContractObjectPage,
					onTheSalesOrdersObjectPage: SalesOrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);