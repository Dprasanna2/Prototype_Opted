import { Component, OnInit } from '@angular/core';
import { ColDef, ICellRendererParams } from 'ag-grid-community';
import { SearchRequest } from 'src/app/models/ViewModels';
import { ResearchDetailsService } from 'src/app/Services/research-details.service';
import { ViewRowBtnComponent } from 'src/app/z_components/common/view-row-btn/view-row-btn.component';
// import { ClientSideRowModelModule } from "@ag-grid-community/client-side-row-model";
interface IRow {
  value: any;
}


@Component({
  selector: 'app-manage-resource',
  templateUrl: './manage-resource.component.html',
  styleUrls: ['./manage-resource.component.scss']
})
export class ManageResourceComponent implements OnInit {
  gridData = [];
    // modules = [ClientSideRowModelModule];
    /*
    isApproved BIT DEFAULT NULL,
    approvedBy NVARCHAR(max),
    approvedDate NVARCHAR(max),
    comment NVARCHAR(max),
    isActive BIT DEFAULT 1
    */
    columnDefs: ColDef[] = [
          {
            headerName: '', 
            field:'',
            width: 80,
            cellRendererSelector: (params: ICellRendererParams<IRow>) => {
              return {
                component: ViewRowBtnComponent
                // params: { values: params.data }
              };
            },
          },
          {headerName: 'Source Name', field: 'source_name'},
          {headerName: 'Description', field: 'description'},
          {headerName: 'Source Link', field: 'source_link'},
          {headerName: 'Country Name', field: 'country_name'},
          {headerName: 'Language', field: 'language'},
          {headerName: 'Approved', field: 'isApproved'},
          {headerName: 'Comment', field: 'comment'},
          

      ];
  
      // rowData = [
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'},
      //     {source_name: 'facebook', description: 'facebook', source_link: 'www.facebook.com', country_name:"India",language:'English',isApproved:'yes',comment:'NA'}
          
      // ];
  constructor(private researchDetailsService: ResearchDetailsService) { }

  ngOnInit() {
    this.setupSubription();
  }
  setupSubription() {
    //  this.researchDetailsService.searchDataRequest.subscribe(req => {
      this.researchDetailsService.GetManageGridData().subscribe(data => {
        // this.setSearchDataList(data);
        this.gridData = data;
      });
    // });
  }

  viewresource(rowData: any) {
    console.log('Data: ', rowData);
    
  }
  public defaultColDef: ColDef = {
    flex: 1,
    minWidth: 100,
    editable: true,
  };
}
