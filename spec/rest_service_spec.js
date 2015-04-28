var frisby = require('frisby');

frisby.create('Transform and store markdown to DB')
  .post('http://127.0.0.1:8888/markdown/save', {
      text: "# MD2HTML"
    })
    .expectJSONTypes('html', {
      text: String,
      id  : String
    })
.toss()

frisby.create('Retrieve document from DB')
  .get('http://127.0.0.1:8888/markdown/get?id=553e37ce1d6cfea6ef8b81a6')
  .expectJSONTypes({ 'html': Object })
.toss();
