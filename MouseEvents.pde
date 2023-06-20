void mouseClicked() {
  // If they pressed the code button
  if (665-35/2 < mouseX && mouseX < 665+35/2 && mouseY > 335-35/2 && mouseY < 335+35/2) {
    resizeWindow("code");
    sideDisplay = "code";
  } else if (715-35/2 < mouseX && mouseX < 715+35/2 && mouseY > 335-35/2 && mouseY < 335+35/2) {
    resizeWindow("help");
    sideDisplay = "help";
  } else if (690-85/2 < mouseX && mouseX < 690+85/2 && mouseY > 380-35/2 && mouseY < 380+35/2) {
    if (sortingAlgo.equals("Linear Search"))
      link("https://www.youtube.com/watch?v=246V51AWwZM");
    else if (sortingAlgo.equals("Binary Search"))
      link("https://www.youtube.com/watch?v=Vml2VcZHx3o");
    else 
      link("https://www.youtube.com/watch?v=63kS6ZkMpkA");
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
