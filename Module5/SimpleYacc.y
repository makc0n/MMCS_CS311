%{
// Ёти объ€влени€ добавл€ютс€ в класс GPPGParser, представл€ющий собой парсер, генерируемый системой gppg
    public Parser(AbstractScanner<int, LexLocation> scanner) : base(scanner) { }
%}

%output = SimpleYacc.cs

%namespace SimpleParser

%token BEGIN END CYCLE INUM RNUM ID ASSIGN SEMICOLON FOR DO TO WHILE IF THEN ELSE

%%

progr   : block
		;

stlist	: statement 
		| stlist SEMICOLON statement 
		;

statement: assign
		| block  
		| cycle 
		| for
		| if
		| while

		;

ident 	: ID 
		;
	
assign 	: ident ASSIGN expr 
		;

expr	: ident  
		| INUM 
		;

block	: BEGIN stlist END 
		;

cycle	: CYCLE expr statement 
		;

for		: FOR assign TO expr DO stlist
		;

if		: IF expr THEN stlist ELSE stlist
		;
while	: WHILE expr DO statement
		;
	
%%
