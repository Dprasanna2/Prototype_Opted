import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { ApproveRejectRequest, ResearchDetail, SearchRequest } from '../models/researchDetail';

@Injectable({
  providedIn: 'root'
})
export class ResearchDetailsService {

  searchDataRequest: Subject<SearchRequest> = new Subject<SearchRequest>();
  constructor(private http: HttpClient) { }

  AddBulkResearchDetails(data: Array<ResearchDetail>): Observable<any> {
    return this.http.post('ResearchDetails/AddBulkResearchDetails', data);
  }

  AddResearchDetail(data: ResearchDetail): Observable<any> {
    return this.http.post('ResearchDetails/AddResearchDetail', data);
  }

  GetGridData(data: SearchRequest): Observable<any> {
    return this.http.post('ResearchDetails/GetGridData', data);
  }

  GetManageGridData(): Observable<any> {
    return this.http.get('ResearchDetails/GetManageGridData');
  }

  ApproveResource(data: ApproveRejectRequest): Observable<any> {
    return this.http.post('ResearchDetails/ApproveResource', data);
  }

  // GetCountryList(data): Observable<any.{
  //   return this.http.get();
  // }

  //getDropDownList
}
