import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { LookUpConstantService } from 'src/app/Services/look-up-constant.service';
import { ResearchDetailsService } from 'src/app/Services/research-details.service';
import { ResearchDetail } from 'src/app/models/researchDetail';

@Component({
  selector: 'app-add-resource',
  templateUrl: './add-resource.component.html',
  styleUrls: ['./add-resource.component.scss']
})
export class AddResourceComponent implements OnInit {
  step: any = 1;
  languageLookup: Array<string>=[];
  countryLookup: Array<string> = [];
  country: Array<string>=[];
  type: Array<string> = [];
  region: Array<string>=[];
  year: Array<string> = [];
  csvRecords: any = [];
  header: boolean = true;
  headerNames: Array<string> = [];
  records: Array<any> = [];
  lastStep: number = 3;
  public addResource: FormGroup;
  constructor(fb: FormBuilder,private lookUpConstantService: LookUpConstantService, private researchDetailsService: ResearchDetailsService) {
    this.addResource = fb.group({
      countryName: ['', [Validators.required, Validators.pattern('[a-zA-Z]+')]],
      region: ['', [Validators.required]],
      party: [''],
      textCategory: [''],
      sourceName: [''],
      sourceLink: [''],
      startYear: [''],
      endYear: [''],
      description: [''],
      language: [''],
      type:[''],
      subType:[''],
      doi:[''],
      generalConcept:[''],
      programText:['']
    });
  }
  ngOnInit(): void {
    this.setupSubription();
    this.year = this.lookUpConstantService.yearLookUp();
    this.type = this.lookUpConstantService.typeLookup();    
    this.region = this.lookUpConstantService.regionLookup();
    // this.language = this.lookUpConstantService.GetLanguageLookup();
    // this.countryLookup = this.lookUpConstantService.GetCountryLookUp();
  }
  setupSubription() {
    this.lookUpConstantService.GetCountryLookUp().subscribe(data => {
      this.countryLookup = [];
      const tempData: any[] = data;
      tempData.forEach(x => this.countryLookup.push(x.countryName));
      // this.selected();
    });
    this.lookUpConstantService.GetLanguageLookup().subscribe(data => {
      this.languageLookup = data;
      // const tempData: any[] = data;
      // tempData.forEach(x => this.countryLookup.push(x.countryName));
      // this.selected();
    });
  }
  next() {
    this.step = this.step + 1;
    // console.log(this.addResource.controls['startYear'].value);
  }
  previous() {
    this.step = this.step - 1;
  }

  
  changeStep(num: number) {
    this.step = num;
  }

  addResources(){
   
    const _researchDetail = new ResearchDetail();
    // countryName: ['', [Validators.required, Validators.pattern('[a-zA-Z]+')]],
    //   region: ['', [Validators.required]],
    //   party: [''],
    //   textCategory: [''],
    //   sourceName: [''],
    //   sourceLink: [''],
    //   startYear: [''],
    //   endYear: [''],
    //   description: [''],
    //   language: [''],
    //   type:[''],
    //   subType:[''],
    //   doi:[''],
    //   generalConcept:[''],
    //   programText:['']
      _researchDetail.country_name = this.addResource.controls['countryName'].value;
      _researchDetail.region = this.addResource.controls['region'].value;
      _researchDetail.parties = this.addResource.controls['party'].value;
      _researchDetail.text_category = this.addResource.controls['textCategory'].value;
      _researchDetail.source_name = this.addResource.controls['sourceName'].value;
      _researchDetail.source_link = this.addResource.controls['sourceLink'].value;
      _researchDetail.start_year = this.addResource.controls['startYear'].value;
      _researchDetail.end_year = this.addResource.controls['endYear'].value;
      _researchDetail.description = this.addResource.controls['description'].value;
      _researchDetail.language = this.addResource.controls['language'].value;
      _researchDetail.type = this.addResource.controls['type'].value;
      _researchDetail.subtype = this.addResource.controls['subType'].value;
      _researchDetail.doi = this.addResource.controls['doi'].value;
      _researchDetail.general_concept = this.addResource.controls['generalConcept'].value;
      _researchDetail.programming_language = this.addResource.controls['programText'].value;
            this.researchDetailsService.AddResearchDetail(_researchDetail).subscribe(x => {
              console.log('Data inserted');
              
            });
  }
} 


