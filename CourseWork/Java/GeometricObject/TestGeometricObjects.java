package ch13;

import java.math.BigInteger;
import java.util.Calendar;
import java.util.Comparator;
import java.util.GregorianCalendar;

public class TestGeometricObjects {

	public static void main(String[] args){

		Calendar c = new GregorianCalendar();
		System.out.println(c.get(Calendar.YEAR));
		Object o = new Object();
		GeometricObject g1 = new Rectangle(7, 7);
		GeometricObject g2 = new Rectangle(5, 5);
		
//		System.out.println(g1.compare(g1, new Circle(1)));

		
		
//		Rectangle g1 = new Rectangle(5, 5);
//		g1.setColor("red");
//		Circle g2 = new Circle(5);
		
	//	System.out.println(g1.getArea());
		
//  GeometricObject g = max(g1, g2, new GeometricObject());
		    
	   // System.out.println("The area of the larger object is " + 
	   //   g.getArea());
	  
		
//		Rectangle rec1 = new Rectangle(1,2);
//		Rectangle rec2 = new Rectangle(2,2);
//		Rectangle rec3 = new Rectangle(4,2);
//		Rectangle rec4 = new Rectangle(1,1);
//	

		
//		Circle c1 = new Circle(4);
//		Circle c2 = new Circle(2);
		ComparableCircle c1 = new ComparableCircle(4);
		ComparableCircle c2 = new ComparableCircle(2);
		
		ComparableRectangle rec1 = new ComparableRectangle(1,2);
		ComparableRectangle rec2 = new ComparableRectangle(2,2);
		ComparableRectangle rec3 = new ComparableRectangle(4,2);
		ComparableRectangle rec4 = new ComparableRectangle(1,1);
	
		ComparableRectangle[] rects = new ComparableRectangle[4];
		rects[0] = rec1;
		rects[1] = rec2;
		rects[2] = rec3;
		rects[3] = rec4;

		
//		GeometricObject[] geo = new GeometricObject[4];
//		geo[0] = rec1;
//		geo[1] = rec2;
//		geo[2] = c1;
//		geo[3] = c2;

		
		System.out.println("Before Sort : " );
		printArray(rects);
		
		java.util.Arrays.sort(rects);
//		System.out.println("After Sort : " );
		printArray(rects);
	
	
	}

	private static void printArray(GeometricObject[] rects) {
		
		for (int i = 0; i< rects.length ; i++){
			 if(i != 0) System.out.print(" , ");
			 System.out.print(rects[i] ) ;
		}
		 System.out.println("") ;
	}
	
	  public static GeometricObject max(GeometricObject g1, GeometricObject g2, Comparator<GeometricObject> c) {
		    if (c.compare(g1, g2) > 0)
		      return g1;
		    else
		      return g2;
		  }
	  
	  
	  
	
}
