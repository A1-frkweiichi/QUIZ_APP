document.addEventListener("turbo:load", () => {
  const toggleDarkMode = document.querySelector("#toggle-dark-mode");

  toggleDarkMode.addEventListener("click", () => {
    document.documentElement.classList.toggle("dark");
  });
});
