# Unbelievable Books

### _Epicodus Project in Ruby on Rails, December 4, 2017_

### By Kelsey Langlois & L. Devin MacKrell

## Description

_This is a mock website for an online book store. It has basic user authentication, so that only logged in users may review products, and only administrators can create, edit, and delete products._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails s
  ```
* Open ```localhost:3000``` in your web browser
* **To give an account admin privileges:**
  * In the project root run ```rails c```
  * Then run:
    ```ruby
    User.find_by(email: "[account email address]").update(admin: true)
    ```
  * The account will now have admin access to the app.

## Specifications

* Products  
  * Name
  * Description
  * List_Price
  * Quantity
  * Discount
  * Featured
  * Author
* Users
  * Name
  * email
  * Password/ Password Confirmation
* Accounts
  * account_id
  * user_id
* Order Items
  * order_id
  * product_id
  * quantity
  * reserved_price
* Orders
  * account_id
  * price_total
  * status
  * Raincheck
* Reviews
  * account_id
  * product_id
  * content

To Do:

* Admin
  * X CRUD for products
  * X feature product(s)
  * X Price change (edit)
  * X Discount (edit product)
    * X Time discount is in effect
    * X Discount for preferred customers
  * Shipping and taxes (APIs)
  * Out of Stock order block
    * X Block on add to cart
    * Still need check when placing order
  * Customer reviews on purchased products

* User
  * X Shopping cart (add & remove, view)
  * cleared cart upon purchase
  * X display cart total (quantity & total cost). Navbar
  * X List discounted items on site
  * Pay online (API)
  * X Sign up/ create account
  * Order history
  * X Tag products "raincheck" --> viewable in cart
  * X Ability to move raincheck items into order proper
  * X View quantity (less than ten of product)
  * Reviews (view & add)
  * X Access cart via account login
  * Confirmation email upon completed order (Mailing)
    * Confirmation email once order shipped

* User API
  * Pay for purchases online (Stripe API)
  * Calculate cost of order in non-dollar currency (Currency Layer API)
  * Random API of our choice

* Admin API   
  * Sales tax added and calculated for shopping cart (Avalara's Tax Rate API)
  * USPS's shipping rate for a product (rate calculator API. XML not JSON. Can also use Stripe API)

<!--
* Unauthenticated users may:
  * View all products
  * View product details
  * View product reviews
* Authenticated users may do all of the above as well as:
  * Create reviews
  * Edit and delete their own reviews
* Authenticated admins may do all of the above as well as:
  * Create, edit, and delete products.
  * Delete user reviews. -->

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) or [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap
* Devise
* Paperclip

### License

Copyright (c) 2017 **Kelsey Langlois & L. Devin MacKrell**

*This software is licensed under the MIT license.*
