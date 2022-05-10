# Template generated code from trgen 0.16.4
JAR = C:/Users/Kenne/Downloads/antlr4-4.10.1-complete.jar
CLASSPATH = $(JAR)\;.
.SUFFIXES: .g4 .java .class
.java.class:
	javac -cp $(CLASSPATH) $*.java
ANTLRGRAMMARS ?= $(wildcard *.g4)
GENERATED = Java8Lexer.java Java8Parser.java 
SOURCES = $(GENERATED) \
    Program.java \
    ErrorListener.java
default: classes
classes: $(GENERATED) $(SOURCES:.java=.class)
clean:
	rm -f *.class
	rm -f *.interp
	rm -f *.tokens
	rm -f $(GENERATED)
run:
	trwdog java -classpath $(CLASSPATH) Program $(RUNARGS)
Java8Lexer.java : Java8Lexer.g4
	java -jar $(JAR) -encoding utf-8  $<
Java8Parser.java : Java8Parser.g4
	java -jar $(JAR) -encoding utf-8  $<

test:
	bash test.sh
