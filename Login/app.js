const express = require("express");
const expressHandlebars = require("express-handlebars");
const bodyParser = require("body-parser");
const path = require("path");

const app = express();
const hbs = expressHandlebars.create({
  extname: ".hbs",
  defaultLayout: false,
});

app.engine("hbs", hbs.engine);
app.set("view engine", "hbs");

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use("/", express.static(path.join(__dirname, "../AdminLTE")));
app.use("/public", express.static("public"));

app.get("/login", (req, res) => {
  res.render("vwLogin/Login");
});

app.post("/login", (req, res) => {
  console.log(req.body);
  const email = req.body.email;
  const password = req.body.password;

  if (email === "admin@gmail.com" && password === "admin") {
    return res.redirect("/");
  }

  res.status(400).json({ message: "Invalid email or password!" });
});

app.get("/admin/dashboard", (req, res) => {
  res.render("vwAdmin/Dashboard");
});

const PORT = process.env.PORT || 1212;

app.listen(PORT, () => {
  console.log(`App is start at port: ${PORT}`);
});
