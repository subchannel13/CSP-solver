import { Component } from '@angular/core';
import { Assignment } from '../data/assignment.model';
import { AssignmentService } from '../data/assignment.service';

@Component({
    selector: 'app-dashboard',
    standalone: true,
    imports: [],
    templateUrl: './dashboard.component.html',
})
export class DashboardComponent {
    assignments = <Assignment[]>[];

    constructor(private assignmentService: AssignmentService) {
        this.assignmentService.list().subscribe((result: Assignment[]) => {
            this.assignments = result;
        });
    }
}
