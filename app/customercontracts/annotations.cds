using CatalogService as service from '../../srv/catalog-service';



annotate service.CustomerContract with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'contractID',
            Value : contractID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'contractStartDate',
            Value : contractStartDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'contractEndDate',
            Value : contractEndDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'contractDescription',
            Value : contractDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'contractStatus',
            Value : contractStatus,
        },
    ]
);
annotate service.CustomerContract with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'contractID',
                Value : contractID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'contractStartDate',
                Value : contractStartDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'contractEndDate',
                Value : contractEndDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'contractDescription',
                Value : contractDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'contractStatus',
                Value : contractStatus,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Sales Orders',
            ID : 'SalesOrders',
            Target : 'salesOrders/@UI.LineItem#SalesOrders',
        },
    ]
);
annotate service.SalesOrders with @(
    UI.LineItem #SalesOrders : [
        {
            $Type : 'UI.DataField',
            Value : salesOrderID,
            Label : 'salesOrderID',
        },{
            $Type : 'UI.DataField',
            Value : region,
            Label : 'region',
        },{
            $Type : 'UI.DataField',
            Value : org,
            Label : 'org',
        },{
            $Type : 'UI.DataField',
            Value : amount,
            Label : 'amount',
        },{
            $Type : 'UI.DataField',
            Value : comments,
            Label : 'comments',
        },{
            $Type : 'UI.DataField',
            Value : country,
            Label : 'country',
        },{
            $Type : 'UI.DataField',
            Value : criticality,
            Label : 'criticality',
        },]
);
annotate service.SalesOrders with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Sales Order Information',
            ID : 'SalesOrderInformation',
            Target : '@UI.FieldGroup#SalesOrderInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Sales Order Items',
            ID : 'SalesOrderItems',
            Target : 'salesOrderItems/@UI.LineItem#SalesOrderItems',
        },
    ],
    UI.FieldGroup #SalesOrderInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : amount,
                Label : 'amount',
            },{
                $Type : 'UI.DataField',
                Value : comments,
                Label : 'comments',
            },{
                $Type : 'UI.DataField',
                Value : country,
                Label : 'country',
            },{
                $Type : 'UI.DataField',
                Value : criticality,
                Label : 'criticality',
            },{
                $Type : 'UI.DataField',
                Value : org,
                Label : 'org',
            },{
                $Type : 'UI.DataField',
                Value : region,
                Label : 'region',
            },{
                $Type : 'UI.DataField',
                Value : salesOrderID,
                Label : 'salesOrderID',
            },],
    }
);
annotate service.SalesOrderItems with @(
    UI.LineItem #SalesOrderItems : [
        {
            $Type : 'UI.DataField',
            Value : Currency,
            Label : 'Currency',
        },{
            $Type : 'UI.DataField',
            Value : ItemID,
            Label : 'ItemID',
        },{
            $Type : 'UI.DataField',
            Value : ProductID,
            Label : 'ProductID',
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : 'Quantity',
        },{
            $Type : 'UI.DataField',
            Value : QuantityUoM,
            Label : 'QuantityUoM',
        },{
            $Type : 'UI.DataField',
            Value : UnitPrice,
            Label : 'UnitPrice',
        },]
);
annotate service.SalesOrderItems with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Sales Order Items',
            ID : 'SalesOrderItems',
            Target : '@UI.FieldGroup#SalesOrderItems',
        },
    ],
    UI.FieldGroup #SalesOrderItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Currency,
                Label : 'Currency',
            },{
                $Type : 'UI.DataField',
                Value : ItemID,
                Label : 'ItemID',
            },{
                $Type : 'UI.DataField',
                Value : ProductID,
                Label : 'ProductID',
            },{
                $Type : 'UI.DataField',
                Value : Quantity,
                Label : 'Quantity',
            },{
                $Type : 'UI.DataField',
                Value : QuantityUoM,
                Label : 'QuantityUoM',
            },{
                $Type : 'UI.DataField',
                Value : UnitPrice,
                Label : 'UnitPrice',
            },],
    }
);
annotate service.SalesOrders with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : customerContract_contractID,
    }
);
annotate service.SalesOrders with @(
    UI.PresentationVariant #SalesOrders : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#SalesOrders',
        ],
    }
);
annotate service.SalesOrders with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.CalculateTotalPrice',
            Label : 'CalculateTotalPrice',
        },]
);
annotate service.SalesOrderItems with @(
    UI.Identification : []
);
