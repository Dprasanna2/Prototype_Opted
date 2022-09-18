import { Component, OnInit } from '@angular/core';
import { ICellRendererAngularComp } from 'ag-grid-angular';
import { ICellRendererParams } from 'ag-grid-community';
import { MatDialog } from '@angular/material/dialog'
import { ViewResourceDialogComponent } from '../../layout/dashboard/manage-resource/view-resource-dialog/view-resource-dialog.component';

@Component({
  selector: 'app-view-row-btn',
  templateUrl: './view-row-btn.component.html',
  styleUrls: ['./view-row-btn.component.scss']
})
export class ViewRowBtnComponent implements ICellRendererAngularComp {
  public imageSource!: string;
  public rowData: any;

  constructor(public dialog: MatDialog) {
    
  }

  agInit(params: ICellRendererParams): void {
    this.rowData = params.data;
  }

  refresh(params: ICellRendererParams) {
    return false;
  }

  viewRsource() {
    console.log('Value: ', this.rowData);
    this.openDialog();
    
  }
  openDialog(): void {
    const dialogRef = this.dialog.open(ViewResourceDialogComponent, {
      width: '750px',
      disableClose: true,
      data: {
        rowData: this.rowData
      },
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      // this.animal = result;
    });
  }
}
