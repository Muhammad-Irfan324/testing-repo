const request = require('supertest');
const app = require('./index');

const expectedResponses = {
  development: 'DEV World!',
  stage: 'STAGE World!',
  production: 'PROD World!'
};

describe('GET /', () => {
  
  it('responds with the correct environment message', async () => {
    const environment = process.env.NODE_ENV || 'development';
    const expectedResponse = expectedResponses[environment];
    
    const response = await request(app).get('/');
    expect(response.text).toBe(expectedResponse);
  });
  afterAll(async () => {
    await new Promise(resolve => app.close(resolve));
  });  

});
