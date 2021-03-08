package datastructandalgo;
import java.util.*;
public class Main
{
  
public static void main(String args[])
{
  
NameList namelist = new NameList();
  
namelist.add("Dan");
namelist.add("Ben");
namelist.add("Adam");
namelist.add("Den");
namelist.add("Lan");
namelist.toString();
  
System.out.println("---------------");
namelist.removeLetter("L");
namelist.toString();
NameList index = null;
System.out.println(index .find("Adam"));
namelist.remove("Adam");
System.out.println(index.find("Adam"));
}

}
