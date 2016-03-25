# Irish Constituencies Neo4j Database
###### Claire Finn, G00310769

## Introduction
Give a summary here of what your project is about.

## Database
## Creating all nodes in my Neo4J Database:

1. In order to get all of the constituencies into Neo4J easier, I didn't have to type out the 40 of them, I just copied and pasted the information for all of the curent Constituencies in the Republic of Ireland straight from Wikipedia and pasted them into an Excel document.
2. I then typed this function into excel into the first row:
="create(n:Constituency{Id: "&A2&", Population:"&C2&", Seats:"&D2&", Description:"&E2&"}),"
3. This function creates a database called Constituencies with the properties 'Id' on Column A Row 2 (A2) 'Population' on Column B Row 2 (B2) of the Excel sheet, 'Seats' on Column C Row 2 (C2) of the Excel sheet and 'Description' on Column D Row 2 (D2) of the Excel sheet.
which turned the row into a cypher query:
 create(n:Constituency{Id: '0', Population:'145659', Seats:'5', Description:'The county of Kilkenny and the county of Carlow, except the part thereof which is comprised in the constituency of Wicklow.'}),
4. Then, I dragged down this function (which was placed into the first column of the document) which as a result automatically created functions for all of the other 39 Constituencies, giving them Id, Population, Seats and Description information according to each constituency.
5. I had to then do a few little adjustments.
6. First, I took out 'create' from the 2nd row all the way down to the last row so that I wasn't creating new databases everytime so the other queries looked like this (remembering that the first row had an Id of 0):

(n1:Constituency{Id: '1', Population:'120483', Seats:'4', Description:'The county of Monaghan and the county of Cavan, except the part thereof which is comprised in the constituency of Sligo-Leitrim.'}),

(n2:Constituency{Id: '2', Population:'111336', Seats:'4', Description:'The county of Clare, except the part thereof which is comprised in the constituency of Limerick City.'}),

Continuing like that (See 'create-constituencies.cypher for a list of all 40 Constitencies in Cypher)

7. I then copied and pasted these queries into Neo4J which created my new database called 'Constituencies'.
## Queries
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query one title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query two title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query three title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. https://www.youtube.com/watch?v=LTdOgvpsR3c
3. https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland
