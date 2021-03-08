package ch13;

public class Circle extends GeometricObject {

	public final static double PI = 3.14;
	private double radius; 

	public Circle() {
		this.radius = 1;
	}

	public Circle(double newRadius) {
		//this.radius = newRadius;
		this.setRadius(newRadius);
	}
	
	public Circle(double newRadius, String color) {
		this.radius = newRadius;
		super.setColor(color);
	}


	public double getRadius() {
		return radius;
	}

	public void setRadius(double newRadius) {
		this.radius = (newRadius >= 1) ? newRadius : 1;
		
		/*
		 * if(newRadius >= 1)  radius = newRadius;
		 * else radius = 1;
		 * 
		 */
	}

	public double getArea() {
		return radius * radius * Math.PI;
	}
	
	  /** Return diameter */
	  public double getDiameter() {
	    return 2 * radius;
	  }
	  
	  @Override	
	  public double getPerimeter() {
	    return 2 * radius * Math.PI;
	  }

	  /* Print the circle info */
	  @Override
	  public String toString() {
//	    return "The circle " +  super.toString() +
//	      " and the radius is " + this.radius;
		  return String.valueOf(this.getArea());
	  }


	
}