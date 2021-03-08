package ch13;

import java.util.Comparator;
import java.util.Scanner;

public abstract class GeometricObject{// implements Comparator<GeometricObject> {
	
	 private String color = "white";
	  private boolean filled;
	  private java.util.Date dateCreated;

	  /** Construct a default geometric object */
	  protected GeometricObject() {
	    dateCreated = new java.util.Date();
	  }

	  /** Construct a geometric object with color and filled value */
	  protected GeometricObject(String color, boolean filled) {
		  Scanner s = new Scanner(System.in);
	    dateCreated = new java.util.Date();
	    this.color = color;
	    this.filled = filled;
	  }

	  /** Return color */
	  public String getColor() {
	    return color;
	  }

	  /** Set a new color */
	  public void setColor(String color) {
	    this.color = color;
	  }

	  /** Return filled. Since filled is boolean,
	   *  the get method is named isFilled */
	  public boolean isFilled() {
	    return filled;
	  }

	  /** Set a new filled */
	  public void setFilled(boolean filled) {
	    this.filled = filled;
	  }

	  /** Get dateCreated */
	  public java.util.Date getDateCreated() {
	    return dateCreated;
	  }

	  @Override
	  public String toString() {
	    return "created on " + dateCreated + "\ncolor: " + color +
	      " and filled: " + filled;
	  }

	  
	  public abstract double getArea();

	  public  double getPerimeter(){
		  return 0;
	  }





//	@Override
//	public int compare(GeometricObject o1, GeometricObject o2) {
//		if(o1.getArea() > o2.getArea()) 
//			return 1;
//		else if (o1.getArea() == o2.getArea())
//			return 0;
//		else 
//			return -1;
//	}
	  
	  
	
	  
}
