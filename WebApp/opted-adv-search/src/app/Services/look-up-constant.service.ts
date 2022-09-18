import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LookUpConstantService {

  constructor(private http: HttpClient) { }

  GetCountryLookUp(): Observable<any> {
    return this.http.get('ResearchDetails/GetCountryLookUp');
  }

  GetLanguageLookup(): Observable<any>{
    return this.http.get('ResearchDetails/GetLanguageLookUp');
  }

  public freeAccess(): Array<lookup<number>> {
    const _lookUp = [
     <lookup<number>> { text: 'payment', value: 0 },
     <lookup<number>> { text: 'free', value: 1 }
    ];
    return _lookUp;
  }

  public regionLookUp() {
    return ['national', 'subnational', 'supranational'];
  }

  public yearLookUp() {
    const year = new Date().getFullYear();
    return this.ranget(1900, year);
  }
  public typeLookup(){
    return ['Database','Data set','Replication data set']
  }

  public regionLookup(){
    return ['National','Subnational','Supranational']
  }
  private ranget(start: number, end: number) {
    const list = [];
    for (let i = end; i >= start; i--) {
      list.push(i.toString());
    }
    return list;
  }
}

export class lookup <T> {
  text!: string;
  value!: T;
}