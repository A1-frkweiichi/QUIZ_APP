// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "trix";
import "@rails/actiontext";
import "./custom/dark"
import "./custom/tourguide"
import * as ActiveStorage from "@rails/activestorage";

ActiveStorage.start()

