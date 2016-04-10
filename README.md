### Irish Constituencies Neo4j Database
### Claire Finn, G00310769

## Introduction

I wanted to insert all of the people who ran for the 2016 general election in Ireland as nodes in a database and I also wanted to insert all 40 Constituencies. I then wanted to make a relationship between the Constituencies and the Candidates. I then did 3 interesting queries on my database which you will find explained in detail in the 'Scripts' folder.

## Database

## Creating all nodes in my Neo4J Database:

## Constituency Nodes

In order to get all of the constituencies into Neo4J easier, I didn't have to type out the 40 of them, I just copied and pasted the information for all of the curent Constituencies in the Republic of Ireland straight from Wikipedia and pasted them into an Excel document.

I then typed this function into excel into the first row:

="create(n:Constituency{Id: "&A2&", Population:"&C2&", Seats:"&D2&", Description:"&E2&"}),"

This function creates a node in the database called Constituencies with the properties 'Id' on Column A Row 2 (A2) 'Population' on Column B Row 2 (B2) of the Excel sheet, 'Seats' on Column C Row 2 (C2) of the Excel sheet and 'Description' on Column D Row 2 (D2) of the Excel sheet which turned the row into a cypher query:

create(n:Constituency{Id: '0', Population:'145659', Seats:'5', Description:'The county of Kilkenny and the county of Carlow, except the part thereof which is comprised in the constituency of Wicklow.'}),

Then, I dragged down this function in Excel to the end of the column of information (which was placed into the first column of the document) which as a result automatically created functions for all of the other 39 Constituencies, giving them Id, Population, Seats and Description information according to each constituency.

I had to then do a few little adjustments.
First, I took out 'create' from the 2nd row all the way down to the last row so that I wasn't creating new nodes everytime so the other queries looked like this (remembering that the first row had an Id of 0):

(n1:Constituency{Id: '1', Population:'120483', Seats:'4', Description:'The county of Monaghan and the county of Cavan, except the part thereof which is comprised in the constituency of Sligo-Leitrim.'}),

(n2:Constituency{Id: '2', Population:'111336', Seats:'4', Description:'The county of Clare, except the part thereof which is comprised in the constituency of Limerick City.'}),

Continuing like that (See 'create-constituencies.cypher for a list of all 40 Constitencies in Cypher)

I then copied and pasted these queries into Neo4J which created my new database called 'Constituencies'.

## Candidate nodes

I gave each candidate that ran in the general election of 2016 an id, and gave them other properties such as Name, Age, Party, Sex, Biography and Occupation using this function: create(n:Candidate{Id: '0', Name:'Bobby Aylward', Sex:'Male', Age:'60', Occupation: 'TD', Party:'Fianna Fáil', Biography:'He was a member of Kilkenny County Council from 1992 until his election to the Dáil in 2007. He lost his seat at the 2011 general election but regained it at a by-election in May 2015. He also works as a farmer.'}),

(n1:Candidate{Id: '1', Name:'John McGuinness', Sex:'4', Age:'60', Occupation: 'TD', Party:'Fianna Fáil', Biography:'He has been a sitting TD since 1997 and served as Minister of State at the Department of Enterprise, Trade and Employment with special responsibility for Trade and Commerce. He is currently the chairman of the Public Accounts Committee. TheJournal.ie I'}),

(n2:Candidate{Id: '2', Name:'Jennifer Murnane O Connor', Sex:'Female', Age:'49', Occupation: 'Full-time councillor', Party:'Fianna Fáil', Biography:'She has been a Carlow county councillor since 2002. She ran unsuccessfully in the 2011 general election and Seanad election. She is the chairperson of the Housing, Recreation & Amenity & Community SPC in Carlow.'}),

etc until I had all candidates in.

When I made a mistake such as getting ids wrong after I had already commited those changes to the Neo4J database I had a back-up word file containing all of the cypher code as I was going along so I deleted all nodes in the database using this function:

``` cypher
MATCH (n)

DETACH DELETE n
```
And then copied and pasted the work I had previously done with the error fixes from the word file.

### Queries
My first query deals with finding out how many people from the Independant party are Unemployed.

My second query deals with deals with creating 2 nodes 'Elected' and 'Not_Elected' and creating a relationship between the Candidates and these 2 nodes depending on if they were elected or not and then finding out how many males vs. how many females ran in the 2016 general election and then counting how many males and females were elected from each party in the election.

My third query deals with using a regular expression to find out if a girl (aged 23) that I went to school with was elected. She was, in my opinion, somebody well-suited to the job so my query was to find out if people are elected due to their character or is it just simply a loss due to the popularity of older politicians.


### Query 1
## How many people in the Independant party are Unemployed

I was surprised at the amount of Independant party Candidates in the Database so I decided I wanted to check why so many Independant people were running for election. Is it because they're unemployed?

I did this query to first of all find out exactly how many candidates ran for the Independant party in the 2016 General Election:

```Cypher
MATCH (a:Candidate)
where a.Party = 'Independent'
RETURN a.Candidate, count(a)
```

This query matched the Candidate to the 'Party' property that equalled to the string 'Independant' and returned the COUNT (amount) of Candidates in the Independant party. The result was 157 people.

And then I executed this query to find out how many Candidates (in the entire database) were 'Unemployed':

``` cypher
MATCH (a:Candidate)
WHERE a.Occupation = 'Unemployed'
RETURN a
```

This query matched the Candidate to the 'Occupation' property that equalled to the string 'Unemployed' and returned the Candidates that were Unemployed. The result was 2 people.

Surprisingly, only 2 people in the entire database were unemployed but both, as I had assumed, are from the Independant party.

I assumed people had to be an important figure in their community to be able to run such as a Teacher // or a TD but it turns out people can also run if they are Unemployed which gives a better chance for people with ideas to become elected even if they aren't exactly well-known.


### Query 2
### Male vs. Females elected, not elected count

For my second query I wanted to find out how many Males vs. how many Females got elected in the 2016 General Election.
I did this by first setting up 2 nodes: 'Elected' and 'Not_Elected' and both of these nodes had two properties: 

Result:'Elected'/Result'Not Elected', Status:'Successful'/Status:'Unsuccessful'

Then I created relationships between the Candidates and nodes depending on whether the Candidate was elected or not:

Example of one Candidate 'Michael Lowry' being created a 'Result' Relationship linking him to the 'Elected' Node's 'Result' property:


'Elected'
``` cypher
MATCH (a:Candidate),(b:Elected)
WHERE a.Name = 'Michael Lowry' AND b.Result = 'Elected'
CREATE (a)-[r:Result]->(b)
RETURN r
```

Example of one Candidate 'Marie Casserly' being created a 'Result' Relationship linking her to the
'Not_Elected' nodes 'Result' property:

'Not Elected'
``` cypher
MATCH (a:Candidate),(b:Not_Elected)
WHERE a.Name = 'Marie Casserly' AND b.Result = 'Not Elected'
CREATE (a)-[r:Result]->(b)
RETURN r
```

Then I decided to Match the 'Female' and 'Party' property of the Candidate node to the 'Result' relationship to see how many Females were either Elected or Not Elected in the Independant party:

``` cypher
MATCH (a:Candidate {Party: 'Independent', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r
```

I also matched the 'Male' and 'Party' property of the Candidate node to the 'Result' relationship to see how many Males were either Elected or Not Elected in the Independant party:

``` cypher
MATCH (a:Candidate {Party: 'Independent', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r
```

I did this for all of the other parties too:

``` cypher
MATCH (a:Candidate {Party: 'AAA-PBP', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'AAA-PBP', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Labour', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Labour', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Sinn Fein', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Sinn Fein', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Fine Gael', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Fine Gael', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Fianna Fáil', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

MATCH (a:Candidate {Party: 'Fianna Fáil', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r
```

Then I decided to do a 'Count' of the amount of Females vs. The amount of Males that got Elected in // each Party by using the same OPTIONAL MATCH but this time adding in the 'Result' property of the
Elected node to distinguish it:

This time I used an 'OPTIONAL' match as Match wasn't giving me the expected results:
``` cypher
MATCH (a:Candidate {Party: 'Independent', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'}) //Match to the Elected node's 'result' property
RETURN count(b)
```
The result was: 3

``` cypher
MATCH (a:Candidate {Party: 'Independent', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```

The result was: 16


``` cypher
MATCH (a:Candidate {Party: 'AAA-PBP', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
``` 
The result was: 2

``` cypher
MATCH (a:Candidate {Party: 'AAA-PBP', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```

The result was: 4

``` cypher
MATCH (a:Candidate {Party: 'Labour', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 2

``` cypher
MATCH (a:Candidate {Party: 'Labour', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 5

``` cypher
MATCH (a:Candidate {Party: 'Sinn Fein', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 6

``` cypher
MATCH (a:Candidate {Party: 'Sinn Fein', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 17

``` cypher
MATCH (a:Candidate {Party: 'Fine Gael', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 11

``` cypher
MATCH (a:Candidate {Party: 'Fine Gael', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 36

``` cypher
MATCH (a:Candidate {Party: 'Fianna Fáil', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```

The result was: 6

``` cypher
MATCH (a:Candidate {Party: 'Fianna Fáil', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)
```
The result was: 36

In conclusion I saw that more males than Females were being elected in each party.

### Query 3
### Is the election process fair?

I wanted to do a 'MAX' query to find out the Max population in the Constituencies

(something like this)
``` cypher
MATCH (n:Constituency)
RETURN max(n.Population)
```

but I realise I can't as I have put this property in as a String so I was getting all of the populations back as a result so I opted for a String-based query instead:

``` cypher
MATCH (a:Candidate)
WHERE a.Name =~ ' Claire.*'
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
return b
```

I wanted to find out if a girl I went to school with got elected in the 2016 general election.
Her name was Claire Kerrane.
Now the problem with this was that Claire had some whitespace before her name when I input her name.
So instead I said I would find out how to use a regular expression to find her that way.
The result came out as Null as I also tried the same OPTIONAL match as in Query 2 to find out if she was elected and she obviously wasn't due to the 'Null' Result.
I found out you could use the backtick character (`) to deal with white space but whatever I tried would not work so I unfortunately had to result in actually inputting the space in the name property of the query

The reason why I chose this query was because I wanted to see if the election was based on the character of the person. I knew Claire Kerrane as a well-adjusted, sensible and and articulate person so based on whether she was elected or not I came to the conclusion that a person can be well-suited for the job but may unfairly lose out due to votes or popularity of older politicians. Claire was only 23 so, even though she wasn't elected this time around, she may still have time to compete.


### References

Neo4J website, the website of the Neo4j database.
https://www.youtube.com/watch?v=LTdOgvpsR3c , The video that helped me to get my information from the excel sheet to Neo4J
https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland , The Wikipedia page where I copied the information for each of the 40 Constituencies in the Republic of Ireland according to the 2016 General Election
http://www.thejournal.ie/election-2016/ I got information for all of the parties that ran for the Candidate nodes here
G00314495, G00318025: The ideas for my interesting queries were initially discussed with two of my classmates but then we obviously expanded those ideas to add extra stuff and branched off ourselves.
