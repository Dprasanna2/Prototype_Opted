import { DOCUMENT } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { searchResultPagination } from 'src/app/models/searchResult';
import { ResearchDetailsService } from 'src/app/Services/research-details.service';

@Component({
  selector: 'app-search-result',
  templateUrl: './search-result.component.html',
  styleUrls: ['./search-result.component.scss']
})
export class SearchResultComponent implements OnInit {
  resultData: any[] = [];
  csvData: any[] = [];
  csvHeaders: any[] = [];
  countryList: Array<string> = [];
  pagination: searchResultPagination = new searchResultPagination();
  isDataSearched: boolean = false;
  constructor(@Inject(DOCUMENT) private document: Document,
              private researchDetailsService: ResearchDetailsService
  ) { }

  ngOnInit() {
    this.pagination.currentPageNo = 1;
    this.pagination.pageSize = 20;
    this.pagination.totalPages = 0;
    this.setupSubription();
  }

  setupSubription() {
    this.researchDetailsService.searchDataRequest.subscribe(req => {
      this.researchDetailsService.GetGridData(req).subscribe(data => {
        this.isDataSearched = true;
        this.setSearchDataList(data);
      });
    });
  }
  // getSearchDataList(data: any){
    // const _csvData = localStorage.getItem('csvData');
    // const _csvHeaders = localStorage.getItem('csvHeaders');
    // this.csvData = _csvData ? JSON.parse(_csvData) : [];
    // console.log('this.csvData: ', this.csvData);
    // this.csvHeaders = _csvHeaders ? JSON.parse(_csvHeaders) : [];
  //   if (this.csvData.length > 0) {
  //     const totalPages = this.csvData.length / this.pagination.pageSize;
  //     this.pagination.totalPages = Math.ceil(totalPages);
  //     this.showData();
  //   }
  // }

  setSearchDataList(data: any){
    this.csvData = data;
    this.pagination.totalRecordsCount = this.csvData.length;
    if (this.csvData.length > 0) {
      const totalPages = this.csvData.length / this.pagination.pageSize;
      this.pagination.totalPages = Math.ceil(totalPages);
      this.showData();
    }
  }

  showData() {
    const showDataLimit = this.pagination.currentPageNo * this.pagination.pageSize;
    const initialData = showDataLimit - this.pagination.pageSize;
    this.resultData = this.csvData.slice(initialData, showDataLimit);
    this.setPaginationArray();
  }

  setPaginationArray() {
    let array = this.pagination.paginationArray;
    array = [];
    const fisrtN0 = 1;
    const currentNo = this.pagination.currentPageNo;
    const LastNo = this.pagination.totalPages;
    const arraySize = 5;
    if(LastNo > 0) {
      array.push(currentNo);
      for (let i = 1; i < arraySize; i++) {
        const preNum = array[0] - 1;
        if(preNum > 0) {
          array.unshift(preNum);
        } 
        
        const postNum = array[array.length - 1] + 1;
        if(postNum <= LastNo) {
          array.push(postNum);
        }

        if (array.length === arraySize) {
          break;
        }
      }

      this.pagination.paginationArray = array;
      this.pagination.showFirstIcon = array[0] !== 1;
      this.pagination.showLastIcon = array[array.length - 1] !== LastNo;
    }
  }

  changePage(num: number) {
    this.pagination.currentPageNo = num;
    this.showData();
  }

  scrollToTop(): void {
    // scroll to the top of the body
    return this.document.body.scrollIntoView({
      behavior: 'smooth', //auto
      block: 'start',
      inline: 'start'
    });
  }
}
  