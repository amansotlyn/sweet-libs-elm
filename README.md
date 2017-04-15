# Sweet Libs: Elm Sampler
## by Amanda Munch, Kaitlyn Mohr, and Jason Andrada


![alt text](Users/jasonandrada/Desktop/screenshots/imports.png)

# What is Elm?
* Elm is a functional programming language that enforces best practices.
* Predominantly a front-end framework that specializes in quick and easy rendering
* This started as a Haskell off-shoot, much like Clojure
* From this, we get Redux

#How does Elm work?
Elm runs on a 3-stage render process, something akin to React State:
1. Model
2. Update
3. View

## The Model
The model is how your app will start on pageload. You can set your model to be whatever you want. For our sampler, we've chosen to set models as _records_, which are effectively the same as JavaScript objects. You can also set your model to be a string, or an integer, or whatever you like. This is what you'll be updating to render changes to your app.
![alt text](Users/jasonandrada/Desktop/screenshots/model.png)
### type alias
type alias is how you assign a variable to a datatype. For example, if you know that you'll be using a lot of Integers in the same way, say as Seconds, you can say `type alias Seconds = Int`, and any time you reference Seconds you'll be talking about integers. In the above screenshot, you'll see we've used type alias to set up a prototype for our model, and we've defined exactly what each part of our model will expect.

## Update
Update is what Elm calls setState, and is where all the magic happens.
![alt text](Users/jasonandrada/screenshots/update.png)
