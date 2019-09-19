import { Component, OnInit  } from '@angular/core';

import ProblemRecord from './shared/ProblemRecord';
import ApiService from './shared/api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  problemRecords: Array<ProblemRecord>;

  constructor(private apiService: ApiService) {
  }

  ngOnInit() {
    this.apiService.getAll().subscribe(data => {
      this.problemRecords = data;
    });
  }
}
