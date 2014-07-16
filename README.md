# Debugging Sinatra Warmup

## The Bug

We just received an email from an unhappy client:

```
I keep getting emails from users saying that they can't create accounts!
What is going on??? Can you check this out for me?
```

The note isn't very helpful. We have tried to reach out to the client but they aren't responding.
Can you look into this?


#### The problem is that if a user submits the form without the check box checked the program blows up. 
#### If you don't check a check box then no "params" are sent to the server
#### to solve you can redirect to the form and show an error
#### ...or you can have an uncheck box send a false responce???


#### more about debugging= http://pryrepl.org/
