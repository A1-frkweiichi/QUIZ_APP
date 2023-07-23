// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "trix";
import "@rails/actiontext";
import * as ActiveStorage from "@rails/activestorage";

document.addEventListener("DOMContentLoaded", () => {
  const toggleDarkMode = document.querySelector("#toggle-dark-mode");

  toggleDarkMode.addEventListener("click", () => {
    document.documentElement.classList.toggle("dark");
  });

  ActiveStorage.start();
});
