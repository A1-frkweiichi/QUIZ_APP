module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["light", "dark"],
  },
};

// 参照元: 公式サイト https://daisyui.com/docs/install/
//                 https://daisyui.com/docs/themes/
