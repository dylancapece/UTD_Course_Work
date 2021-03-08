package datastructandalgo;

class Node
{
private String name;
Node link;
private boolean isLetterNode;
Node(String name, Node link, boolean isLetterNode)
{
this.name = name;
this.link = link;
this.isLetterNode = isLetterNode;
}
public String getName()
{
return name;
}
public void setName(String name)
{
this.name = name;
}
public Node getLink()
{
return link;
}
public void setLink(Node link)
{
this.link = link;
}
public boolean isLetterNode()
{
return isLetterNode;
}
public void setLetterNode(boolean isLetterNode)
{
this.isLetterNode = isLetterNode;
}
}



