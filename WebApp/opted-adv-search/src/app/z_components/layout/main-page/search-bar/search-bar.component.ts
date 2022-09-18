import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SpinnerService } from 'src/app/Services/spinner.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule, FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import {map, startWith} from 'rxjs/operators';
import { LookUpConstantService } from 'src/app/Services/look-up-constant.service';
import { SearchRequest } from 'src/app/models/ViewModels';
import { ResearchDetailsService } from 'src/app/Services/research-details.service';


@Component({
  selector: 'app-search-bar',
  templateUrl: './search-bar.component.html',
  styleUrls: ['./search-bar.component.scss']
})
export class SearchBarComponent implements OnInit {
  myControl = new FormControl('');
  options: string[] = [];
  filteredOptions: Observable<string[]> = new Observable<string[]>();

  selectedLevel: any;
  csvData: any;
  csvHeaders: any;
  dropDownValue: Array<string> = [];
  countryLookup: Array<string> = [];
  form: FormGroup = new FormGroup({});
  dropdownForm: FormGroup = new FormGroup({});
  // myControl: FormControl = new FormControl();
  constructor(private spinnerService: SpinnerService,
    private lookUpConstantService: LookUpConstantService,
    private researchDetailsService: ResearchDetailsService,
    private _router: Router,
    private fb: FormBuilder
  ) {
    this.form = fb.group({
      countryNames: ['', [Validators.required]],
    });

    
    this.dropdownForm = fb.group({
      searchField: ['country.name'],
      searchText: ['']
    })
  }

  ngOnInit() {
    this.setupDropDownFilter();
    this.setupSubription();
    this.csvData = localStorage.getItem('csvData');
    this.csvHeaders = localStorage.getItem('csvHeaders');
  }

  setupSubription() {
    this.lookUpConstantService.GetCountryLookUp().subscribe(data => {
      this.countryLookup = [];
      const tempData: any[] = data;
      tempData.forEach(x => this.countryLookup.push(x.countryName));
      this.selected();
    });

  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.dropDownValue.filter(option => option.toLowerCase().includes(filterValue));
  }

  setupDropDownFilter() {
    this.filteredOptions = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value || '')),
    );
  }

  selected() {
    this.setDropDownList();
    this.myControl.setValue('');
    console.log(this.dropDownValue);
  }

  setDropDownList() {
    this.selectedLevel = this.dropdownForm.controls['searchField'].value;

    switch (this.selectedLevel) {
      case 'country.name':
        this.dropDownValue = this.countryLookup;
        break;
      case 'region':
        this.dropDownValue = this.lookUpConstantService.regionLookUp();
        break;
      case 'start.year':
      case 'end.year':
        this.dropDownValue = this.lookUpConstantService.yearLookUp();
        break;
      default:
        this.dropDownValue = [];
        break;
    }
  }

  getSearchDataList() {
    this.selectedLevel = this.dropdownForm.controls['searchField'].value;
    this.dropDownValue = [];
    this.spinnerService.Show();

    const csvDataList: any[] = JSON.parse(this.csvData);
    if (this.csvData) {
      csvDataList.forEach(data => {
        if (data[this.selectedLevel] && data[this.selectedLevel] !== '') {
          const lists: any[] = data[this.selectedLevel].split(',');
          // console.log(lists);
          lists.forEach(item => {
            item = item.trim();
            const index = this.dropDownValue.findIndex(x => x.toLowerCase() === item.toLowerCase());
            if (index === -1) {
              this.dropDownValue.push(item);
            }

          });
        }
      });
    }
  }

  searchData() {
    // this.myControl
    const searchRequest = new SearchRequest();

    this.selectedLevel = this.dropdownForm.controls['searchField'].value;
    const searchText = this.dropdownForm.controls['searchText'].value?.trim();
    const fieldValue = this.myControl.value?.trim();

    if ((fieldValue != null && fieldValue != '' ) || (searchText != null && searchText != '' )) {
      switch (this.selectedLevel) {
        case 'country.name':
          searchRequest.country_name = fieldValue;
          break;
        case 'region':
          searchRequest.region = fieldValue;
          break;
        case 'start.year':
          searchRequest.start_year = fieldValue;
          break;
        case 'end.year':
          searchRequest.end_year = fieldValue;
          break;
        default:
          break;
      }
      searchRequest.search_text = searchText;
      this.researchDetailsService.searchDataRequest.next(searchRequest);
    }
  }

  getPlaceHolder() {
    const txt: string = this.dropdownForm.controls['searchField'].value.toString();
    return 'Select ' + txt.replace('.', ' ');
  }
}
