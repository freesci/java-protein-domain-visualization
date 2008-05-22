String[] lines;
String[] lines2;
int index=0;
int i2ndex=0;
float len=0;
float dstart=0;
float dend=0;
float difflen=0;
float d2start=0;
float d2end=0;
int swtch=0;
float num=0.0;
String stalk="S";
String head="H";
String conN="CN";
String conH="CH";
String sign="O";
PFont fonta;

void setup() {
  size(800, 350);
  background(255);
  smooth();
  lines = loadStrings("data.txt");
  lines2= lines;
  fonta = loadFont("TheSans-Plain-12.vlw");
  textFont(fonta);
  fill (0,0,0);

  text("Legend:", 700, 30);
  fill(235,230,10);
  text("stalks", 700, 50);
  fill(185,20,20);
  text("heads", 700, 65);
  fill(20,185,20);
  text("connectors", 700, 80);
  fill(30,30,30);
  text("anchor", 700, 95);

}

void draw() {

  //draw rectangles
  if (index < lines.length) {
    String[] pieces = split(lines[index], ' ');
    if (pieces.length == 2){
      len = float(pieces[1]);
      num=700.0/len;
      noFill();
      stroke(50);
      rect(20,320, num*len, 10);

    }
    if (pieces.length == 4) {
      dstart = int(pieces[2]);
      dend = int(pieces[3]);
      len=dend-dstart+1;//len=len+1;
      fill (30,30,30,50);
      if (pieces[0].equals(stalk)==true){
        fill(235,230,10,80);
      }
      if (pieces[0].equals(sign)==true){
        fill(50,70,190,80);
      }
      if (pieces[0].equals(head)==true){
        fill(185,20,20,50);
      }
      if (pieces[0].equals(conN)==true){
        fill(20,185,20,50);
      }
      if (pieces[0].equals(conH)==true){
        fill(20,185,20,50);
      }

      rect(20+num*dstart, 320, num*len, 10);
    }
    // Go to the next line for the next run through draw()
    index = index + 1;
  }


  //draw arcs
  if (i2ndex < lines2.length) {

    String[] pieces = split(lines2[i2ndex], ' ');
    if (pieces.length == 4) {
      for (int i = index ; i < lines2.length; i++){
        String[] p2ieces=split (lines2[i], ' ');
        if (p2ieces.length == 4){
          if (int(pieces[1]) == int(p2ieces[1])) {
            swtch=1;
            dstart = float(pieces[2]);
            dend = float(pieces[3]);
            len=dend-dstart+1;//len=len+1;
            d2start = float(p2ieces[2]);
            difflen = float(p2ieces[2]) - dstart;
            if (pieces[0].equals(stalk)==true){
              stroke(235,230,10,80);
            }
            if (pieces[0].equals(head)==true){
              stroke(185,20,20,50);
            }
            if (pieces[0].equals(conN)==true){
              stroke(20,185,20,50);
            }
            if (pieces[0].equals(conH)==true){
              stroke(20,185,20,50);
            }
            noFill();
            strokeWeight(num*(dend - dstart));
            strokeCap(SQUARE);
            arc (21+num*(dend+(d2start-dend)/2), 315, num*difflen, num*difflen, PI, 0);
            strokeWeight(1);
            stroke(50);
            break;
          }
        }
        if (i == lines.length){
          swtch=1;
        }
      }
    }
    // Go to the next line for the next run through draw()
    i2ndex = i2ndex + 1;
  }
  if (i2ndex == lines2.length){
    exit();
  }
}

