// I was surprised at the amount of Independant party Candidates in the Database so I decided I wanted to check // why so many Independant people were running for election. Is it because they're unemployed?

// I did this query to first of all find out exactly how many candidates ran for the Independant party in the
// 2016 General Election:

MATCH (a:Candidate)
where a.Party = 'Independent'
RETURN a.Candidate, count(a)

// This query matched the Candidate to the 'Party' property that equalled to the string 'Independant' and
// returned the COUNT (amount) of Candidates in the Independant party.
// The result was 157 people.

// And then I executed this query to find out how many Candidates (in the entire database) were 'Unemployed':

MATCH (a:Candidate)
WHERE a.Occupation = 'Unemployed'
RETURN a

// This query matched the Candidate to the 'Occupation' property that equalled to the string 'Unemployed' and
// returned the Candidates that were Unemployed.
// The result was 2 people.

// Surprisingly, only 2 people in the entire database were unemployed but both, as I had assumed, are from the // Independant party.

// I assumed people had to be an important figure in their community to be able to run such as a Teacher or a TD // but it turns out people can also run if they are Unemployed which gives a better chance for people with ideas // to become elected even if they aren't exactly well-known.