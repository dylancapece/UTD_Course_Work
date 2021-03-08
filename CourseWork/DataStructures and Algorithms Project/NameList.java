package datastructandalgo;

public class NameList 
{
private Node header;
public NameList()
{
header = null;
}
public void add(String name)
{
Node newNode = new Node(name,null,false);
if(checkForLetter(name.substring(0,1))){
addNode(newNode);
}
else
{
Node newLetterNode = new Node(name.substring(0, 1),null,true);
addNode(newLetterNode);
addNode(newNode);
}
}
public void remove(String name)
{
if(header == null)
{
System.out.println("Error!! List is empty");
return;
}
Node previous = header;
Node current = header.link;
while(current!=null)
{
if(name.compareTo(current.getName())==0)
{
previous.link = current.link;
break;
}
else
{
previous = current;
current = current.link;
}
}
previous = header;
current = header.link;
Node temp = null;
while(current!=null)
{
if(previous.isLetterNode() && current.isLetterNode())
{
if(temp == null)
{
header = current;
return;
}
else
{
temp.link = current;
return;
}
}
else if(current.isLetterNode() && current.link == null)
{
previous.link = null;
return;
}
else
{
temp = previous;
previous = current;
current = current.link;
}
  
}
}
public void removeLetter(String letter)
{
char ch = letter.toCharArray()[0];
if(header == null)
{
System.out.println("Error!! List is empty");
return;
}
if(letter.compareTo(header.getName())==0)
{
Node newHeader = header.link;
while(newHeader!=null)
{
if(ch == newHeader.getName().charAt(0))
{
newHeader = newHeader.link;
}
else
{
header = newHeader;
return;
}
}
}
Node previous = header;
Node current = header.link;
while(current!=null)
{
if(ch == current.getName().charAt(0))
{
previous.link = current.link;
current = current.link;
}
else
{
previous = current;
current = current.link;
}
}
}
public String find(String name)
{
Node current = header;
String foundString = "Name not found";
while(current!=null)
{
if(name.compareTo(current.getName())==0)
{
foundString = "Name found: "+name;
break;
}
else
{
current = current.link;
}
}
return foundString;
}
private void addNode(Node node)
{
if(header == null)
{
header = node;
return;
}
if(node.getName().compareTo(header.getName())<0)
{
node.link = header;
header = node;
return;
}
Node current = header.link;
Node previous = header;
while(current!=null)
{
if(node.getName().compareTo(current.getName())<0)
{
node.link = current;
previous.link = node;
return;
}
else
{
previous = current;
current = current.link;
}
}
previous.link = node;
  
}
private boolean checkForLetter(String str)
{
if(header == null)
return false;
boolean letterPresent = false;
Node current = header;
while(current!=null)
{
if(current.isLetterNode() && str.compareTo(current.getName())==0)
{
letterPresent = true;
break;
}
else
{
current = current.link;
}
}
return letterPresent;
}
public String toString()
{
  
if(header == null)
System.out.println("List is empty");
  
Node current = header;
while(current!=null){
if(current.isLetterNode())
System.out.println(current.getName());
else
System.out.println(" "+current.getName());
  
current = current.link;
}
return null;
  
}
}
