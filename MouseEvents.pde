void mouseClicked() {
  // If they pressed the code button
  if (665-35/2 < mouseX && mouseX < 665+35/2 && mouseY > 335-35/2 && mouseY < 335+35/2) {
    resizeWindow("code");
    sideDisplay = "code";
  } else if (715-35/2 < mouseX && mouseX < 715+35/2 && mouseY > 335-35/2 && mouseY < 335+35/2) {
    resizeWindow("help");
    sideDisplay = "help";
  }
}

void resizeWindow(String newDisplay) {
  if (!isWindowIncreased) {
    frame.setSize(750+screenIncreaseVal, 400);
  } else {
    frame.setSize(750, 400);
  }
  //if (!sideDisplay.equals("") && sideDisplay.equals(newDisplay))
    isWindowIncreased = !isWindowIncreased;
}
