using {
  Country,
  sap.common.CodeList as CodeList,
  cuid,
  Currency,
  managed,
  sap,
} from '@sap/cds/common';

namespace MySecondLearningApp.db;

entity CustomerContract : managed {
  key contractID          : String(10);
      contractStartDate   : Date;
      contractEndDate     : Date;
      contractDescription : String(500);
      contractStatus      : String enum {
        IP = 'In Process';
        R  = 'Released';
        X  = 'Cancelled';
        C  = 'Completed'
      };
      salesOrders         : Composition of many SalesOrders
                              on salesOrders.customerContract = $self;
}

entity SalesOrders : managed {
  key salesOrderID     : String(100);
      customerContract : Association to one CustomerContract;
      region           : String(100);
      country          : String(100);
      org              : String(4);
      amount           : Integer;
      comments         : String(100);
      criticality      : Integer;
      salesOrderItems  : Composition of many SalesOrderItems
                           on salesOrderItems.salesOrder = $self;
};


entity SalesOrderItems : managed {

  key ItemID      : String(10);
  key salesOrder  : Association to one SalesOrders;
      ProductID   : String(30);
      Quantity    : Decimal;
      QuantityUoM : String(30);
      UnitPrice   : Decimal;
      Currency    : String(100);

}
