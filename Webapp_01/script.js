function toggleMenu() {
    const menu = document.querySelector(".menu-links")
    const icon = document.querySelector(".hamburger-icon")
    menu.classList.toggle("open")
    icon.classList.toggle("open")
} 

$(document).ready(function(){

    var typed = new Typed(".typing", {
        strings: ["Bookworm", "Amateur", "Travel Enthusiast"],
        typeSpeed: 100,
        backSpeed: 60,
        loop: true
    });

});



// JavaScript
document.addEventListener("DOMContentLoaded", function () {
    const bars = document.querySelectorAll(".bars");
    bars.forEach((bar) => {
      const progressIn = bar.querySelector(".progress-in");
      const skillPercentElement = bar.querySelector(".skill-percent span");
      const skillPercent = parseInt(progressIn.style.width); // Get the skill percentage
      bar.addEventListener("mouseenter", function () {
        progressIn.style.setProperty("--skill-percent", skillPercent + "%"); // Set the custom property
        animateSkillPercent(skillPercentElement, skillPercent); // Animate the skill percentage number
      });
    });
  });
  
  // Function to animate the skill percentage number
  function animateSkillPercent(element, targetValue) {
    let currentValue = 0;
    const animationDuration = 1000; // Duration of the animation in milliseconds
    const increment = targetValue / (animationDuration / 16); // Calculate increment per frame (assuming 60fps)
  
    const updateValue = () => {
      if (currentValue < targetValue) {
        currentValue += increment;
        element.textContent = Math.round(currentValue) + "%"; // Update the text content
        requestAnimationFrame(updateValue);
      } else {
        element.textContent = targetValue + "%"; // Ensure the final value is accurate
      }
    };
  
    updateValue();
  }
  