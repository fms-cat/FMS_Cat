final int RESO = 240;
final int FRAMES = 64;
final float COLOR_DENS = 0.1;
final float COLOR_FREQ = 4.0;
final float CAT_SIZE = RESO * 0.8;
final float CAT_AMP = RESO / 12.0;
final float CAT_FREQ = 1.0;

PImage imageCat;

color catColor( float t ) {
  return color(
    128 + 127 * cos( t ),
    128 + 127 * cos( t + PI / 3.0 * 2.0 ),
    128 + 127 * cos( t + PI / 3.0 * 4.0 )
  );
}

void setup() {
  size( 240, 240 );
  noStroke();
  imageMode( CENTER );
  imageCat = loadImage( "cat.png" );
}

void draw(){
  float t = float( frameCount ) / FRAMES;
  
  // == background ==
  for ( int iy = 0; iy < 20; iy ++ ) {
    for ( int ix = 0; ix < 20; ix ++ ) {
      float x = RESO / 20.0 * ix;
      float y = RESO / 20.0 * iy;
      float w = RESO / 20.0;
      float h = RESO / 20.0;
      
      float len = dist( x + w / 2.0, y + h / 2.0, RESO / 2.0, RESO / 2.0 );
      float tBg = COLOR_DENS * len - 2.0 * PI * COLOR_FREQ * t;

      fill( catColor( tBg ) );
      rect( x, y, w, h );
    }
  }

  // == image ==
  {
    float tCat = 2.0 * PI * t;

    float x = width / 2;
    float y = height / 2;
    float w = CAT_SIZE + CAT_AMP * sin( CAT_FREQ * tCat );
    float h = CAT_SIZE + CAT_AMP * sin( CAT_FREQ * tCat );

    image( imageCat, x, y, w, h );
  }

  // == save it ==
  save( "capture/" + nf( frameCount, 5 ) + ".png" );
}
