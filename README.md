# Irish Constituencies Neo4j Database
###### Claire Finn, G00310769

## Introduction
Give a summary here of what your project is about.

## Database
## Creating all nodes in my Neo4J Database:
##Constituency Nodes
1. In order to get all of the constituencies into Neo4J easier, I didn't have to type out the 40 of them, I just copied and pasted the information for all of the curent Constituencies in the Republic of Ireland straight from Wikipedia and pasted them into an Excel document.
2. I then typed this function into excel into the first row:

="create(n:Constituency{Id: "&A2&", Population:"&C2&", Seats:"&D2&", Description:"&E2&"}),"

3. This function creates a database called Constituencies with the properties 'Id' on Column A Row 2 (A2) 'Population' on Column B Row 2 (B2) of the Excel sheet, 'Seats' on Column C Row 2 (C2) of the Excel sheet and 'Description' on Column D Row 2 (D2) of the Excel sheet which turned the row into a cypher query:

create(n:Constituency{Id: '0', Population:'145659', Seats:'5', Description:'The county of Kilkenny and the county of Carlow, except the part thereof which is comprised in the constituency of Wicklow.'}),

4. Then, I dragged down this function in Excel to the end of the column of information (which was placed into the first column of the document) which as a result automatically created functions for all of the other 39 Constituencies, giving them Id, Population, Seats and Description information according to each constituency.
5. I had to then do a few little adjustments.
6. First, I took out 'create' from the 2nd row all the way down to the last row so that I wasn't creating new databases everytime so the other queries looked like this (remembering that the first row had an Id of 0):

(n1:Constituency{Id: '1', Population:'120483', Seats:'4', Description:'The county of Monaghan and the county of Cavan, except the part thereof which is comprised in the constituency of Sligo-Leitrim.'}),

(n2:Constituency{Id: '2', Population:'111336', Seats:'4', Description:'The county of Clare, except the part thereof which is comprised in the constituency of Limerick City.'}),

Continuing like that (See 'create-constituencies.cypher for a list of all 40 Constitencies in Cypher)

7. I then copied and pasted these queries into Neo4J which created my new database called 'Constituencies'.

##Candidate nodes
I gave each candidate that ran in the general election of 2016 an id, and gave them other properties such as Name, Age, Party, Sex, Biography and Occupation using this function:
create(n:Candidate{Id: '0', Name:'Bobby Aylward', Sex:'Male', Age:'60', Occupation: 'TD', Party:'Fianna Fáil', Biography:'He was a member of Kilkenny County Council from 1992 until his election to the Dáil in 2007. He lost his seat at the 2011 general election but regained it at a by-election in May 2015. He also works as a farmer.'}),

(n1:Candidate{Id: '1', Name:'John McGuinness', Sex:'4', Age:'60', Occupation: 'TD', Party:'Fianna Fáil', Biography:'He has been a sitting TD since 1997 and served as Minister of State at the Department of Enterprise, Trade and Employment with special responsibility for Trade and Commerce. He is currently the chairman of the Public Accounts Committee. TheJournal.ie I'}),

(n2:Candidate{Id: '2', Name:'Jennifer Murnane O Connor', Sex:'Female', Age:'49', Occupation: 'Full-time councillor', Party:'Fianna Fáil', Biography:'She has been a Carlow county councillor since 2002. She ran unsuccessfully in the 2011 general election and Seanad election. She is the chairperson of the Housing, Recreation & Amenity & Community SPC in Carlow.'}),

etc until I had all candidates in.
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
2. https://www.youtube.com/watch?v=LTdOgvpsR3c , The video that helped me to get my information from the excel sheet to Neo4J
3. https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland , The Wikipedia page where I copied the information for each of the 40 Constituencies in the Republic of Ireland according to the 2016 General Election
4. http://www.thejournal.ie/election-2016/ I got information for all of the parties that ran for the Candidate nodes here
