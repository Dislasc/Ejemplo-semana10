// GRUPO 2 - E6.1 eventos

int herramienta = 0; 
color colorActual = color(0); //guarda el color seleccionado, empieza en negro

// barra de herramientas
int barraX = 0;
int barraW = 160;

void setup() {
  size(1000, 700);
  background(0);
}

void draw() {

  // dibujar
  dibujar();

  // dibujar en lienzo
  if (mousePressed && mouseX > barraW) {

    // pincel
    if (herramienta == 0) {
      stroke(colorActual);
      strokeWeight(5);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }

    // borrador
    if (herramienta == 1) {
      stroke(255);
      strokeWeight(20);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }

    // círculo
    if (herramienta == 2) {
      noStroke();
      fill(colorActual);
      circle(mouseX, mouseY, 40);
    }

    // cuadrado
    if (herramienta == 3) {
      noStroke();
      fill(colorActual);
      rect(mouseX, mouseY, 40, 40);
    }
  }
}

void dibujar() {

  // fondo barra
  fill(240);
  noStroke();
  rect(0, 0, barraW, height);

  fill(0);
  textSize(14);
  textAlign(CENTER);
  text("HERRAMIENTAS", barraW/2, 25);

  // botones herramientas
  dibujarBoton(20, 45, "Pincel", 0);
  dibujarBoton(20, 85, "Borrar", 1);
  dibujarBoton(20, 125, "Círculo", 2);
  dibujarBoton(20, 165, "Cuadrado", 3);

  // limpiar
  fill(255, 100, 100);
  stroke(150);
  strokeWeight(1);
  rect(20, 220, 120, 30);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Limpiar", 80, 240);

  // paleta de colores - óvalo en la barra de herramientas
  dibujarPaleta(80, 350);

  // preview del color y herramienta actual
  textSize(14);
  textAlign(LEFT);
  fill(0);
  text("Vista previa", 20, 570);
  
  // caja de fondo para preview
  fill(245);
  stroke(180);
  strokeWeight(2);
  rect(20, 585, 120, 80);
  noStroke();
  
  // dibujar preview de la herramienta seleccionada con el color actual
  dibujarPreview(80, 625);
}

// botones
void dibujarBoton(int x, int y, String texto, int tipo) {

  if (herramienta == tipo) {
    fill(100, 150, 255); // seleccionado - azul
    stroke(50);
    strokeWeight(2);
  } else {
    fill(220);
    stroke(180);
    strokeWeight(1);
  }

  rect(x, y, 120, 30);

  fill(0);
  textSize(12);
  textAlign(CENTER, CENTER);
  text(texto, x + 60, y + 15);
}

// paleta de pintura estilo óvalo con colores distribuidos
void dibujarPaleta(int x, int y) {
  // fondo ovalado de la paleta - color crema más realista
  fill(230, 220, 200);
  stroke(120, 100, 80);
  strokeWeight(3);
  ellipse(x, y, 140, 155);
  
  // sombra suave
  fill(200, 190, 170, 50);
  noStroke();
  ellipse(x + 4, y + 6, 140, 155);
  
  // agujeros de color distribuidos alrededor - dentro de la paleta proporcionalmente más pequeña
  // arriba (270°)
  dibujarColorPaleta(x, y - 55, color(255, 150, 0), 0);      // naranja
  
  // arriba-derecha (315°)
  dibujarColorPaleta(x + 35, y - 40, color(255, 0, 255), 1); // rosado
  
  // derecha (0°)
  dibujarColorPaleta(x + 47, y + 4, color(255, 255, 0), 2);  // amarillo
  
  // abajo-derecha (45°)
  dibujarColorPaleta(x + 35, y + 40, color(0, 255, 255), 3); // celeste
  
  // abajo (90°)
  dibujarColorPaleta(x, y + 55, color(255, 0, 0), 4);        // rojo
  
  // abajo-izquierda (135°)
  dibujarColorPaleta(x - 35, y + 40, color(0, 0, 255), 5);   // azul
  
  // izquierda (180°)
  dibujarColorPaleta(x - 47, y + 4, color(0, 255, 0), 6);    // verde
  
  // arriba-izquierda (225°)
  dibujarColorPaleta(x - 35, y - 40, color(0), 7);           // negro
  
  // círculo central pequeño
  fill(230, 220, 200);
  noStroke();
  circle(x, y, 15);
}

// colores en la paleta - con efecto 3D
void dibujarColorPaleta(int x, int y, color c, int indice) {
  // sombra
  fill(150, 140, 120, 80);
  noStroke();
  ellipse(x + 2, y + 3, 30, 33);
  
  // borde oscuro de profundidad
  fill(100, 80, 60);
  stroke(80, 60, 40);
  strokeWeight(2);
  ellipse(x, y, 30, 33);
  
  // color principal
  fill(c);
  noStroke();
  ellipse(x, y - 1, 27, 30);
  
  // brillo/luz
  fill(255, 255, 255, 100);
  noStroke();
  ellipse(x - 5, y - 6, 6, 6);
}

// preview de herramienta y color
void dibujarPreview(int x, int y) {
  // pincel
  if (herramienta == 0) {
    // mango del pincel (cilindro)
    stroke(139, 69, 19); // marrón
    strokeWeight(3);
    line(x - 8, y + 15, x - 8, y - 5);
    line(x + 8, y + 15, x + 8, y - 5);
    
    // unión del mango con las cerdas
    fill(200, 150, 100);
    stroke(139, 69, 19);
    strokeWeight(2);
    rect(x - 8, y - 5, 16, 8);
    
    // forma de gota (punta del pincel) - parte principal gris/neutro - INVERTIDA
    fill(220);
    noFill();
    stroke(0);
    strokeWeight(1);
    beginShape();
    curveVertex(x - 10, y - 24);
    curveVertex(x - 12, y - 19);
    curveVertex(x - 12, y - 12);
    curveVertex(x, y - 6);
    curveVertex(x + 12, y - 12);
    curveVertex(x + 12, y - 19);
    curveVertex(x + 10, y - 24);
    curveVertex(x + 6, y - 28);
    curveVertex(x, y - 32);
    curveVertex(x - 6, y - 28);
    curveVertex(x - 10, y - 24);
    endShape();
    
    // punta pequeña del pincel con color seleccionado - invertida (upside down)
    fill(colorActual);
    stroke(0);
    strokeWeight(1);
    beginShape();
    curveVertex(x - 8, y - 30);   // base izquierda
    curveVertex(x - 10, y - 24);   // lado izquierdo
    curveVertex(x - 8, y - 18);    // lado izquierdo inferior
    curveVertex(x, y - 12);        // punta abajo
    curveVertex(x + 8, y - 18);    // lado derecho inferior
    curveVertex(x + 10, y - 24);   // lado derecho
    curveVertex(x + 8, y - 30);   // base derecha
    curveVertex(x + 2, y - 34);   // pata derecha
    curveVertex(x, y - 36);       // base media
    curveVertex(x - 2, y - 34);   // pata izquierda
    curveVertex(x - 8, y - 30);   // cierra
    endShape();
  }

  // borrador
  if (herramienta == 1) {
    pushMatrix();
    translate(x, y);
    rotate(-PI/6); // rotación de ~30 grados
    
    // cuerpo del borrador
    stroke(0);
    strokeWeight(3);
    fill(240);
    rect(-12, -20, 24, 40);
    
    // banda del borrador (la parte de metal)
    fill(180);
    stroke(100);
    strokeWeight(1);
    rect(-12, -5, 24, 8);
    
    popMatrix();
    
    // línea de efecto de borrado - horizontal al nivel más bajo del borrador
    stroke(100);
    strokeWeight(2);
    line(x - 20, y + 22, x + 20, y + 22);
  }

  // círculo
  if (herramienta == 2) {
    noStroke();
    fill(colorActual);
    circle(x, y, 30);
  }

  // cuadrado
  if (herramienta == 3) {
    noStroke();
    fill(colorActual);
    rect(x - 15, y - 15, 30, 30);
  }
}

// click
void mousePressed() {

  // botones herramienta
  if (mouseX < barraW) {

    // herramientas
    if (mouseY > 45 && mouseY < 75) herramienta = 0;
    if (mouseY > 85 && mouseY < 115) herramienta = 1;
    if (mouseY > 125 && mouseY < 155) herramienta = 2;
    if (mouseY > 165 && mouseY < 195) herramienta = 3;

    // limpiar
    if (mouseY > 220 && mouseY < 250) {
      background(255);
    }
  }
  
  // colores en la paleta de pintura (esquina inferior derecha)
  int paletaX = 80;
  int paletaY = 350;
  
  // detectar clicks en los colores de la paleta
  float distancia;
  
  // naranja (arriba - 270°)
  distancia = dist(mouseX, mouseY, paletaX, paletaY - 55);
  if (distancia < 20) colorActual = color(255, 150, 0);
  
  // rosado (arriba-derecha - 315°)
  distancia = dist(mouseX, mouseY, paletaX + 35, paletaY - 40);
  if (distancia < 20) colorActual = color(255, 0, 255);
  
  // amarillo (derecha - 0°)
  distancia = dist(mouseX, mouseY, paletaX + 47, paletaY + 4);
  if (distancia < 20) colorActual = color(255, 255, 0);
  
  // celeste (abajo-derecha - 45°)
  distancia = dist(mouseX, mouseY, paletaX + 35, paletaY + 40);
  if (distancia < 20) colorActual = color(0, 255, 255);
  
  // rojo (abajo - 90°)
  distancia = dist(mouseX, mouseY, paletaX, paletaY + 55);
  if (distancia < 20) colorActual = color(255, 0, 0);
  
  // azul (abajo-izquierda - 135°)
  distancia = dist(mouseX, mouseY, paletaX - 35, paletaY + 40);
  if (distancia < 20) colorActual = color(0, 0, 255);
  
  // verde (izquierda - 180°)
  distancia = dist(mouseX, mouseY, paletaX - 47, paletaY + 4);
  if (distancia < 20) colorActual = color(0, 255, 0);
  
  // negro (arriba-izquierda - 225°)
  distancia = dist(mouseX, mouseY, paletaX - 35, paletaY - 40);
  if (distancia < 20) colorActual = color(0);
}
