import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {  Observable } from 'rxjs';
import { LoginDetails } from '../models/ViewModels';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(private http: HttpClient) {
    
  }
  Login(loginDetails: LoginDetails): Observable<any> {
    return this.http.post('AccountController/Login', loginDetails);
  }
}
