float angle = 0;
float r = 200;
float lon;
float lat;
float mag;
float theta;
float phi;
float x;
float y;
float z;
float h;
float maxh;
float angleb;

PImage earth;
PShape globe;
Table table;

void setup() {
  size(600, 600, P3D);
  earth = loadImage("Earth.jpg");
  table = loadTable("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv", "header");
  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth);
}

void draw() {
  background(51);
  translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.02;

  lights();
  fill(200);
  noStroke();
  shape(globe);

  for (TableRow row : table.rows()) {
    lat = row.getFloat("latitude");
    lon = row.getFloat("longitude");
    mag = row.getFloat("mag");
    theta = radians(lat) + PI/2;
    phi = radians(lon) + PI;
    x = r * sin(theta) * cos(phi);
    y = r * sin(theta) * sin(phi);
    z = r * cos(theta);

    PVector pos = new PVector(x, y, z);
    PVector xaxis = new PVector(1, 0, 0);
    PVector raxis = xaxis.cross(pos);
    angleb = PVector.angleBetween(xaxis, pos);

    h = pow(10, mag);
    maxh = pow(10, 6);
    h = map(h, 0, maxh, 20, 100);

    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    fill(0, 200, 0);
    box(h, 5, 5);
    popMatrix();
  }
}