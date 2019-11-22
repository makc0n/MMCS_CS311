%{
// Ёти объ€влени€ добавл€ютс€ в класс GPPGParser, представл€ющий собой парсер, генерируемый системой gppg
    public Parser(AbstractScanner<int, LexLocation> scanner) : base(scanner) { }
%}

%output = SimpleYacc.cs

%namespace SimpleParser

%token BEGIN END CYCLE INUM RNUM ID ASSIGN SEMICOLON FOR DO TO WHILE IF THEN ELSE REPEAT VAR UNTIL RIGHT_BRACKET LEFT_BRACKET WRITE PLUS MINUS DIVISION MULT COMMA

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
		| repeat
		| write
		| var
		;

ident 	: ID
		| ID COMMA ident
		;

	
assign 	: ident ASSIGN expr 
		;

var		: VAR ident
		;

act		: PLUS
		| MINUS
		| MULT
		| DIVISION
		;

expr	: ident 
		| INUM 
		| LEFT_BRACKET expr RIGHT_BRACKET
		| expr PLUS expr
		| expr MINUS expr
		| expr MULT expr
		| expr DIVISION expr
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
repeat	:REPEAT stlist UNTIL expr
		;
write	: WRITE LEFT_BRACKET expr RIGHT_BRACKET
		;
	
%%
