import http from 'k6/http';
import { check } from 'k6';

export const options = {
  scenarios: {
    steady_request_rate: {
      executor: 'constant-arrival-rate',
      rate: 25,                
      timeUnit: '1s',          
      duration: '30s',         
      preAllocatedVUs: 2,     
      maxVUs: 5,  
    },
  },
};

export default function () {
  const url = 'http://localhost:8072/bestellung';
  const payload = JSON.stringify(
  {
  kundeId: "98765432-abcd-1234-ef00-112233445566",
  bestellPositionen: [
    {
      produktId: "14712049-d0f1-cb09-1042-af40d0e5b878",
      id: "d7427dd3-644f-4f82-9fa3-136b4c213320",
      menge: 5,
      einzelpreis: 77
    },
    {
      produktId: "c906e3ea-c3d9-532b-a00b-079929e9fad1",
      menge: 2,
      einzelpreis: 74.99
    }
  ],
  status: "offen",
  erstelltAm: "2025-06-20T12:34:56Z",
  zahlungsreferenz: "",
  versandreferenz: ""
}
  );

  const params = {
    headers: { 'Content-Type': 'application/json' },
  };

  http.post(url, payload, params);
}
