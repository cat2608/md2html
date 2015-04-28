var frisby = require('frisby');

frisby.create('Transform and store markdown to DB')
  .post('http://127.0.0.1:8888/markdown/save', {
    text: "# MD2HTML"
  }, {json: true})
  .expectHeaderContains('content-type', 'application/json')
  .expectStatus(200)
  .expectJSONTypes('html', {
      text: String,
      id  : String
  })
  .afterJSON(function (document) {
    var id = document.html.id;
    frisby.create('Retrieve document from DB')
      .get('http://127.0.0.1:8888/markdown/get?id='+ id)
      .expectHeaderContains('content-type', 'application/json')
      .expectStatus(200)
      .expectJSONTypes({ 'html': Object})

    .afterJSON(function (document) {
    frisby.create('Resquest document without ID')
      .get('http://127.0.0.1:8888/markdown/get')
      .expectHeaderContains('content-type', 'application/json')
      .expectStatus(400)
      .expectJSONTypes({'message': 'id is required'})
    .toss();
  })
  .toss();
})
.toss();
