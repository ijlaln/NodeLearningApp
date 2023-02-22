using {MySecondLearningApp.db as db} from '../db/data-model';


annotate CatalogService.CustomerContract with @odata.draft.enabled;


service CatalogService @(path : '/catalog')
{

  entity CustomerContract
      as select * from db.CustomerContract;
      
    entity SalesOrders
      as select * from db.SalesOrders
      actions {
        action boost() returns SalesOrders;
        action CalculateTotalPrice() returns SalesOrders;
      };

 entity SalesOrderItems
      as select * from db.SalesOrderItems;

};