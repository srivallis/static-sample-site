const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.static('./'));
app.get('/', (req, res) => {
  res.sendFile('index.html');
})

app.listen(port, () => {
  console.log(`Sample static page listening at http://localhost:${port}`)
})