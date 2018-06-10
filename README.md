# Minecraft Server Command Relay

The idea of the Minecraft Server Command Relay is to make playing with older versions of minecraft easier. For example, say you want to play on Minecraft Beta 1.7.3.

This is great however one irritating part of this is that you might realise that:

1. The minecraft command system wasn't as great back then.
2. The minecraft items were given numerical IDs not string IDs.
3. There is no creative mode.

Ultimately it is nigh on impossible to actually have a good user experience unless you are willing to play in survival mode.

This is the exact reason that we initially made this system.

It works as follows:


You open 2 ports:
`40010` and `40011` (these ports are configurable).

You run the following command:
`ruby 'server.rb' | java -jar minecraft-server.jar `

This will run the Ruby and Minecraft servers. The Minecraft server will run on port `40010` and the Ruby server will run on port `40011`.

Web clients can now connect to the Ruby html server, and commands can be pipelined into minecraft from these web clients. We can do this by initiating a `HTTP EVAL` request. E.G. In javascript:

```js
request = new XMLHttpRequest
request.open("EVAL","")
request.send("say Hello World")
```

This command can be wrapped in a function which can be called from the HTML web page hosted by the ruby server:

![webpage](https://github.com/sancarn/Minecraft-Server-CommandRelay/blob/master/FirstWebpage.png?raw=true)

Above you can see our first hodge-podge iteration of a web server client. You can search for items with `Ctrl+F` and it works for any user (entered in the name box). There is also a console, found in the top right, where users can execute custom minecraft command scripts.

Of course the end goal of this webpage would be to have a full creative-style menu where users can give items with left click, and get stacks with shift-click, and search for specific items etc. but this currently has not been implemented. 
