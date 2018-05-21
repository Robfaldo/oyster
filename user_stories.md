Card (includes customer)
Station 
Trip 

In order to protect my money from theft or less
As a customer
I want a maximum limit (of £90) on my card

Obect: card
Message: max_limit
Return: GBP 90 

In order to get through the barriers,
As a customer
I need to touch in and out.

|Object|Message|Return Value|
|:--|:--|:--|
|Card|touch-in|true|

expect(subject.touch_in).to be true
