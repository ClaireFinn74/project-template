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

//The reason why I chose this query was because I wanted to see if the election was based on the
// character of the person. I knew Claire Kerrane as a well-adjusted, sensible and and articulate person
// so based on whether she was elected or not I came to the conclusion that a person can be well-suited
// for the job but may unfairly lose out due to votes or popularity of older politicians. Claire was only
// 23 so, even though she wasn't elected this time around, she may still have time to compete.