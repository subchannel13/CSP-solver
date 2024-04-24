import { TestBed } from '@angular/core/testing';
import {
    HttpClientTestingModule,
    HttpTestingController,
} from '@angular/common/http/testing';

import { AssignmentService } from './assignment.service';
import { Assignment } from './assignment.model';

const mockEntity = new Assignment(1, "Test task");

describe('AssignmentService', () => {
    let service: AssignmentService;
    let httpController: HttpTestingController;

    beforeEach(() => {
        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
        });

        service = TestBed.inject(AssignmentService);
        httpController = TestBed.inject(HttpTestingController);
    });

    it('should be created', () => {
        expect(service).toBeTruthy();
    });

    it('should list assignments', () => {
        service.list().subscribe((result) => {
            expect(result).toEqual([mockEntity]);
        });
        
        const req = httpController.expectOne({
            method: 'GET',
            url: '/api/Assignment/List',
        });

        req.flush([mockEntity]);
        httpController.verify();
    });
});
