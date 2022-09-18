import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { searchResultPagination } from 'src/app/models/searchResult';

@Component({
  selector: 'app-pagination',
  templateUrl: './pagination.component.html',
  styleUrls: ['./pagination.component.scss']
})
export class PaginationComponent implements OnInit {

  @Input() 
  public pagination: searchResultPagination = new searchResultPagination();

  @Output()
  public pageChange = new EventEmitter();

  constructor() { }

  ngOnInit() {
  }

  public changePage(pageNo: number) {
    this.pageChange.emit(pageNo);
  }

}
