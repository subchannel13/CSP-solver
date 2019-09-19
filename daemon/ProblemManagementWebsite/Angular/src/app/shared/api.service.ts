import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import ProblemRecord from './ProblemRecord';

@Injectable()
export default class ApiService {
  public API = 'http://localhost:8080/api';
  public PROBLEM_RECORDS_ENDPOINT = `${this.API}/problemrecords`;

  constructor(private http: HttpClient) { }

  getAll(): Observable<Array<ProblemRecord>> {
    return this.http.get<Array<ProblemRecord>>(this.PROBLEM_RECORDS_ENDPOINT);
  }
}
