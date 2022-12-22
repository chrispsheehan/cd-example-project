import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';

const app = express();
const port = 3001;

import actions from './actions';

app.use(bodyParser.json());
app.use(cors()); // to get around local testing issues
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.listen(port, () => {
  console.log(`App running on port ${port}.`);
});

app.get('/health', (request, response) => {
  response.json({ info: ('API lives!') });
  console.log("/health hit");
});

app.get('/uuid', (request, response) => {

  actions.generateUuid(request, response);
})