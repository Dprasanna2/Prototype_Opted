import { Component, OnInit, ViewChild } from '@angular/core';
import { NgxCsvParser, NgxCSVParserError } from 'ngx-csv-parser';
import { ResearchDetail } from 'src/app/models/researchDetail';
import { ResearchDetailsService } from 'src/app/Services/research-details.service';

@Component({
  selector: 'app-bulk-resource-upload',
  templateUrl: './bulk-resource-upload.component.html',
  styleUrls: ['./bulk-resource-upload.component.scss']
})
export class BulkResourceUploadComponent implements OnInit {
  csvRecords: any = [];
  header: boolean = true;
  headerNames: Array<string> = [];
  records: Array<any> = [];
  fileDataEvent = null;
  constructor(private ngxCsvParser: NgxCsvParser,
              private researchDetailsService: ResearchDetailsService) {
  }
  ngOnInit(): void {
    
  }

  @ViewChild('fileImportInput') fileImportInput: any;

  uploadListener($event: any): void {

    this.fileImportInput = this.fileImportInput;
    const files = $event.srcElement.files;
    this.header = (this.header as unknown as string) === 'true' || this.header === true;

    this.ngxCsvParser.parse(files[0], { header: this.header, delimiter: ',' })
      .pipe().subscribe({
        next: (result: any): void => {
          console.log('Result', result);
          this.headerNames = Object.keys(result[0]).filter(x => x !== '');

          localStorage.setItem('csvData',  JSON.stringify(result));
          localStorage.setItem('csvHeaders', JSON.stringify(this.headerNames));

          let addData = new Array<ResearchDetail>();
          result.forEach((ele: { [x: string]: any; }) => {
            let data: any = new ResearchDetail();
            this.headerNames.forEach(key => {
              const _key = key.replace(/[.]/g,'_');
              data[_key] = ele[key];
            });
            addData.push(data);
          });
          this.researchDetailsService.AddBulkResearchDetails(addData).subscribe(x => {
            console.log('Data inserted');
            
          });
          this.csvRecords = result;
        },
        error: (error: NgxCSVParserError): void => {
          console.log('Error', error);
        }
      });
  }

  updatefileDataEvent($event: any) {
    this.fileDataEvent = $event;
  }

}
