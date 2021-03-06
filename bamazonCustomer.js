const mysql = require("mysql");
const inquirer = require("inquirer");

//database connect
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'bamazon',
  port: 3306
});

//object for customer
var bamazonCustomer = {

  //connect method to create connection with database
  createConnection: function(){
    connection.connect(function(err) {
      if (err) throw (err);
      console.log('Connected to bamazon!');

      //immediately run this function on connection
      //show products
      bamazonCustomer.displayProducts();
    });
  },

    displayProducts: function() {
      connection.query('SELECT * from products', function(err, res) {
        if (err) throw (err);
        console.log("Products available: ")
        for (let i = 0; i < res.length; i++) {
          console.log(res[i].item_id + ' - ' + res[i].product_name +
            ". Price: $" + res[i].price)
        };
        bamazonCustomer.firstPrompt();
      });
    },

  //use inquirer to prompt customer
  firstPrompt: function() {
    inquirer.prompt([{
      name: 'itemID',
      message: "Provide Item ID number"
    }, {
      name: 'quantity',
      message: 'How many would you like to buy?'
    }]).then(function(answers){

      var itemID = answers.itemID;
      var requestedQty = parseInt(answers.quantity);

      //Select item chosen from database
      connection.query('SELECT * FROM products WHERE item_id = ${itemID}',
        function(err, res) {
          //assign variables to new quantity based on updated available stock
          var newQuantity = parseInt(res[0].stock_quantity) - requestedQty;

          //check if there is enough to order item again
          if(newQuantity <=0) {
            var customerTotal = res[0].price * requestedQty;
            var productSales = res[0].product_sales + CustomerTotal;
            console.log('Confirmed purchase - Total is: $${CustomerTotal}');

            //update database quantities
            connection.query('UPDATE products set stock_quantity = ${newQuantity}, product_sales = ${productSales} WHERE item_id = ${itemID}', function(err, res){
              if (err) throw (err);
              console.log('Item quantity updated!')
            })
          } else {
            console.log('Not enough! Insufficient amount. Only ${res[0].stock_quantity} in stock')
          }
        }).then(bamazonCustomer.displayProducts());
    });
  }
};
