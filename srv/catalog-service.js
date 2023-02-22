const cds = require('@sap/cds');
const debug = require('debug')('srv:catalog-service');

module.exports = cds.service.impl(async function () {


    const { SalesOrders } = this.entities;

    this.after('READ', SalesOrders, (each) => {
        if (each.amount > 500) {
            each.criticality = 3;
            if (each.comments === null)
                each.comments = '';
            else
                each.comments += ' ';
            each.comments += 'Exceptional!';
            debug(each.comments, { "country": each.country, "amount": each.amount });
        } else if (each.amount < 150) {
            each.criticality = 1;
        } else {
            each.criticality = 2;
        }
    });

    this.on('boost', SalesOrders, async req => {
        try {
            const ID = req.params[0];
            const tx = cds.tx(req);
            await tx.update(SalesOrders)
                .with({ amount: { '+=': 250 }, comments: 'Boosted!' })
                .where({ ID: { '=': ID } })
                ;
            debug('Boosted ID:', ID);
            const cs = await cds.connect.to('CatalogService');
            let results = await cs.read(SELECT.from(SalesOrders, ID));
            return results;
        } catch (err) {
            req.reject(err);
        }
    });


    this.on('CalculateTotalPrice', SalesOrders, async (req) => {
        const { salesOrderID } = req.params[1];
        const { SalesOrders, SalesOrderItems } = this.entities;
        const trx = cds.transaction(req);

        // Retrieve the sales order by ID
        const salesOrder = await trx.run(SELECT.one(SalesOrders).where({ salesOrderID: salesOrderID }));

        // Retrieve the sales order items for the sales order
        console.log("SalesOrderItems", SalesOrderItems)
        const SOItems = await cds.transaction(req).run(SELECT.from(SalesOrderItems).where({ salesOrder_salesOrderID: salesOrderID }));

        //const SOItems = await cds.run(SELECT.from(SalesOrderItems).where({ salesOrder: { salesOrderID: salesOrderID } }));

        // Calculate the total price of the sales order
        const amount = SOItems.reduce((total, item) => {
            const itemPrice = item.UnitPrice * item.Quantity;
            return total + itemPrice;
        }, 0);

        // Return the updated sales order
        return UPDATE(SalesOrders, salesOrderID).with({ amount });
    });

});