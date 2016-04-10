// I wanted to do a 'MAX' query to find out the Max population in the Constituencies

// (something like this)
// MATCH (n:Constituency)
// RETURN max(n.Population)


// but I realise I can't as I have put this property in as a String so I was getting all of the
// populations back as a result so I opted for a String-based query instead:


MATCH (a:Candidate)
WHERE a.Name =~ ' Claire.*'
OPTIONAL MATCH (a)-[r:Result]->(b:Elected{Result:'Elected'})
return b

// I wanted to find out if a girl I went to school with got elected in the 2016 general election.
// Her name was Claire Kerrane.
// Now the problem with this was that Claire had some whitespace before her name when I input her name.
// So instead I said I would find out how to use a regular expression to find her that way.
// The result came out as Null as I also tried the same OPTIONAL match as in Query 2 to find out if she
// was elected and she obviously wasn't due to the 'Null' Result.
// I found out you could use the backtick character (`) to deal with white space but whatever I tried
// would not work so I unfortunately had to result in actually inputting the space in the name property
// of the query