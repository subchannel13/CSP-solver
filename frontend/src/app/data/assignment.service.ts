import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Assignment } from './assignment.model';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root',
})
export class AssignmentService {
    constructor(private httpClient: HttpClient) {}

    list(): Observable<Assignment[]> {
        return this.httpClient.get<Assignment[]>('/api/Assignment/List');
    }
}
