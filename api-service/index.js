const express = require('express');

const app = express();
const port = process.env.PORT || 3003;

app.use(express.json());

app.use(express.urlencoded({ extended: true }));

app.get('/', async (req, res) => {
  try {
    
    res.json({hello: "world"});

  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(port, () => {
  console.log(`Node.js server is running on http://localhost:${port}`);
});
