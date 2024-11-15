// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

document.addEventListener("turbo:load", function () {
    const toggleButton = document.querySelector("[data-collapse-toggle]");
    const navbarHamburger = document.getElementById("navbar-hamburger");
  
    if (toggleButton && navbarHamburger) {
      toggleButton.addEventListener("click", function () {
        const isExpanded = toggleButton.getAttribute("aria-expanded") === "true";
  
        if (isExpanded) {
          navbarHamburger.classList.add("hidden");
          toggleButton.setAttribute("aria-expanded", "false");
        } else {
          navbarHamburger.classList.remove("hidden");
          toggleButton.setAttribute("aria-expanded", "true");
        }
      });
    }
});
