// For my second query I wanted to find out how many Males vs. how many Females got elected in the 2016
// General Election.

//I did this by first setting up 2 nodes: 'Elected' and 'Not_Elected' and both of these nodes had two
// properties: Result:'Elected'/Result'Not Elected', Status:'Successful'/Status:'Unsuccessful'

//Then I created relationships between the Candidates and nodes depending on whether the Candidate was
// elected or not:

//Example of one Candidate 'Michael Lowry' being created a 'Result' Relationship linking him to the
// 'Elected' Node's 'Result' property:


//'Elected'
MATCH (a:Candidate),(b:Elected)
WHERE a.Name = 'Michael Lowry' AND b.Result = 'Elected'
CREATE (a)-[r:Result]->(b)
RETURN r

//Example of one Candidate 'Marie Casserly' being created a 'Result' Relationship linking her to the
// 'Not_Elected' nodes 'Result' property:

// 'Not Elected'
MATCH (a:Candidate),(b:Not_Elected)
WHERE a.Name = 'Marie Casserly' AND b.Result = 'Not Elected'
CREATE (a)-[r:Result]->(b)
RETURN r

// Then I decided to Match the 'Female' and 'Party' property of the Candidate node to the 'Result'
// relationship to see how many Females were either Elected or Not Elected in the Independant party:

MATCH (a:Candidate {Party: 'Independent', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

// I also matched the 'Male' and 'Party' property of the Candidate node to the 'Result' relationship to // see how many Males were either Elected or Not Elected in the Independant party:

MATCH (a:Candidate {Party: 'Independent', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->()
RETURN r

// I did this for all of the other parties too:

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

// Then I decided to do a 'Count' of the amount of Females vs. The amount of Males that got Elected in // each Party by using the same OPTIONAL MATCH but this time adding in the 'Result' property of the
// Elected node to distinguish it:

//This time I used an 'OPTIONAL' match as Match wasn't giving me the expected results:
MATCH (a:Candidate {Party: 'Independent', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'}) //Match to the Elected node's 'result' property
RETURN count(b)

// The result was: 3

MATCH (a:Candidate {Party: 'Independent', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 16



MATCH (a:Candidate {Party: 'AAA-PBP', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 2

MATCH (a:Candidate {Party: 'AAA-PBP', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 4

MATCH (a:Candidate {Party: 'Labour', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 2

MATCH (a:Candidate {Party: 'Labour', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 5

MATCH (a:Candidate {Party: 'Sinn Fein', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 6

MATCH (a:Candidate {Party: 'Sinn Fein', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 17

MATCH (a:Candidate {Party: 'Fine Gael', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 11

MATCH (a:Candidate {Party: 'Fine Gael', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 36

MATCH (a:Candidate {Party: 'Fianna Fáil', Sex:'Female' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 6


MATCH (a:Candidate {Party: 'Fianna Fáil', Sex:'Male' })
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
RETURN count(b)

// The result was: 36


//In conclusion I saw that more males than Females were being elected in each party.