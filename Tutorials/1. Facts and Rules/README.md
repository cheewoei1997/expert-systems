## Facts and Rules
### Dealing with Facts
Assert your first fact by typing the code below into the CLIPS editor.
`(assert (foo))`

Below are some commands to control CLIPS.
`(exit)`    Shuts down CLIPS.
`(clear)`   Removes all rules and facts from memory.
`(reset)`   Removes facts information from memory.
`(run)`     Starts executing a CLIPS program.

CLIPS operates by maintaining facts. Examples of facts are such as: 
```
(colour green)
(parent_of John Susan)
```

Facts are created by using the assert function.
```
CLIPS> (assert (colour green))
<Fact-1> 
```

`<Fact-0>` states that the fact has been registered at index 0. 
The `(facts)` command will display all facts registered.
```
CLIPS> (facts) 
f-1     (colour green) 
For a total of 1 fact.
```

Facts may also be retracted (removed) from the fact database by using the `retract` command.  
Set 2 facts first.
```
CLIPS> (assert (colour green))
<Fact-1>
CLIPS> (assert (colour red))
<Fact-2>
```

Retract the first fact at index 0 and display all facts.
```
CLIPS> (retract 1)
CLIPS> (facts)
f-2     (colour red)
For a total of 1 fact.
```

### Your first rule
1. [First Rule](../master/1.%20Facts%20and%20Rules/firstrule.clp) firstrule.clp  
Create a rule with the name `duck`, stating that if there exists a fact where `(animal-is duck)`, `(assert (sound-is quack))` will run.

2. [More Rules](../master/1.%20Facts%20and%20Rules/morerules.clp) morerules.clp  
Add another rule to confirm whether or not it is a duck.

3. [Printing Stuff](../master/1.%20Facts%20and%20Rules/printoutput.clp) printoutput.clp  
Print "its' a duck" when the fact `(animal-is duck)` exists.

## Exercise
The decision tree represents a small section of the diagnosis of a car’s failure to start. Each rounded box is a recommended remedy. Each rectangular box is piece of evidence, which might be represented by a fact such as `(lights-working no)` or `(petrol yes)`. Each connecting path to a remedy represents a rule, for example ‘IF starter is turning AND there is no petrol THEN buy some petrol’.

Build an expert system for the decision tree. Access it [here](../master/1.%20Facts%20and%20Rules/carfailsystem.clp).

Load up the rules and check them by running 
```
CLIPS> (reset)
CLIPS> (load carfailsystem.clp)
CLIPS> (rules)
CLIPS> (facts)
```

You can now assert whatever rules you want to traverse the tree.