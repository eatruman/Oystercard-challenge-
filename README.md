#oyster_card_challenge
User story 1-3 work and are tested. User story 4 does return an order confirmation but doesn't send out a text with a time frame. The Twillio app information and code is in a file but I couldn't figure out how to use it in a method. I also couldn't figure out how to do set environment variables so my ID and phone numbers are altered to "XXXX" instead for privacy.
Thinks I would improve:
-figure out how to make the twillio messaging work within my code
-raise an error if something someone ordered wasn't on the menu
-in my "add(item)" method I couldn't access the menu hash from the other class and I am not sure why, so I had to include the same hash inside of the method.

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
 
**Displays a hash menu of items with their prices** 

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

**Can add items to an array**
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
**Can print the order array to see chosen items and prices, can also use the "total" method to calculate a total for the order**
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
**The code for adding an hour onto current time works when I sent the messages to myself, I can run the send_sms program from the command line but am 
unsure how to add it to my confirm_order method**
