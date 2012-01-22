#!/usr/bin/env m4 
dnl -*- compile-command: "m4 --define=REPLACEME=Rascal --define=CAT=yes try.m4" -*-
dnl the first line ends up in the output if you ./try.m4
dnl The second line tells emacs how we want to run this command with M-x compile
dnl SEE ALSO: http://mbreen.com/m4.html

dnl This file should be considered public domain. -Kurt Schwehr 2012-Jan-21

NOTE: why would be use m4 rather than python?  Outside of GNU
autoconf, I really think we should not be using m4.  Please use python
with the string ".format" method instead.

# This is a comment in m4 that goes through
dnl is do not print to the end of the line
dnl
define(AUTHOR, Kurt Schwehr)
`AUTHOR' is AUTHOR and there is a newline in there???

define(TITLE, M4 language by example)dnl
This TITLE has no newline dnl

`#' is not a comment hash.  Macros will still work... TITLE

dnl The next line comes from the --define command line
This REPLACEME is comes from outside the file

define(MacroWithNewline, `line with
newline after the first with')dnl
Use MacroWithNewline here.

define(PARENS, ())dnl
brackets: PARENS
undefine(`PARENS')dnl MUST quote the value
PARENS

define(LPAREN,`(')dnl
define(RPAREN,`)')dnl
LPAREN bracketed RPAREN  dnl -> ( bracketed )
define(`LEFT',`[')dnl
LEFTSQUARE
define(`LEFT',`{')dnl
LEFTCURL

define(`plus', `+')dnl
plusplus # oops!
plus()plus # works!

define(`oper', `plus')
oper()oper # oops!
oper`'oper # best 

define(`oper',`plus`'')dnl safest
oper()plus

ifelse(`provides
multiline
comments')dnl

CAT
ifdef(`CAT',We have a cat)
ifdef(`HORSE',We have a horse) # No. We do not have a horse

define(a,1)dnl
define(b,1)dnl
define(c,3)dnl
define(d,4)dnl
a b
ifelse(a,b,c,d)

define(`b',2)dnl
a b
ifelse(a,b,c,d)

We have math
1+1 => eval(1+1)
2**8 => eval(2**8)
incr(41)
bools:
0 || 1 => eval(0||1)
0 && 1 => eval(0&&1)

len(`string length')
substr(`my string',1,3) counts start at 0 and includes the character at position [3] (4th)

dnl You can call external programs
syscmd(`ls -l')
