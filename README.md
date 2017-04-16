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
![alt text](file:///Users/jasonandrada/Desktop/screenshots/model.png)
### type alias
type alias is how you assign a variable to a datatype. For example, if you know that you'll be using a lot of Integers in the same way, say as Seconds, you can say `type alias Seconds = Int`, and any time you reference `Seconds` you'll be talking about integers. In the above screenshot, you'll see we've used type alias to set up a prototype for our model, and we've defined exactly what each part of our model will expect.

## Update
![alt text](file:///Users/jasonandrada/Desktop/screenshots/update.png)
Update is what Elm calls setState, and is where all the magic happens.
The first thing you'll notice is the big ol' `type Msg` declaration at the top of the screenshot. That's how our app knows what to change. Because any time we make a change to our app, any change we make is sent as a `Msg` to our model, which is then updated to reflect any changes.
The update function is listening for any type of change, which we've bound to elements in our HTML (more on that later).

# The View
![alt text](file:///Users/jasonandrada/Desktop/screenshots/render.png)
This is react's render function. And it's quite an adventure to parse through on your first pass. As of right now, there's no clearcut way to do CSS, you can do fun stuff like above. For a front-end framework, it has a surprisingly low amount of CSS support. Each div is defined using two pairs of brackets; one for all of the attributes, the other for the content and child elements. And unfortunately, without an external package, all of your CSS has to be done inline, using a _different_ external package. The attribute brackets is where you bind your _onClick_ events, or _onInput_ events, or any other events you may want. Just bear in mid, _onClick_ and _onInput_ don't come standard in `Elm Core`, they have to be installed using a package called `elm-html`

## Subscriptions
This is definitely something that is a mind bender. Subscriptions are listeners for external events. Something kind of like onClick, only they're listening for specific actions. Event listeners have to be installed through other `elm` packages. 
