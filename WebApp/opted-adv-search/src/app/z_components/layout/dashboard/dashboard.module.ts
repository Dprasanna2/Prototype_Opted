import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard.component';
import { BulkResourceUploadComponent } from './bulk-resource-upload/bulk-resource-upload.component';
import { RouterModule, Routes } from '@angular/router';
import { ManageResourceComponent } from './manage-resource/manage-resource.component';
import { ManageUserComponent } from './manage-user/manage-user.component';
import { AddUserComponent } from './add-user/add-user.component';
import { AgGridModule } from 'ag-grid-angular';
import { MatDialogModule } from '@angular/material/dialog';

const routes: Routes = [
  {
    path: '',
    component: DashboardComponent,

    children: [
      {
        path: '',
        component: ManageResourceComponent
      },
      // {
      //   path: 'manageResource',
      //   component: ManageResourceComponent
      // },
      {
        path: 'bulkUpload',
        component: BulkResourceUploadComponent
      },
      {
        path: 'manageUser',
        component: ManageUserComponent
      },
      {
        path: 'addUser',
        component: AddUserComponent
      },

    ]
  },

];

@NgModule({
  imports: [
    CommonModule,
    AgGridModule,
    MatDialogModule,
    RouterModule.forChild(routes)
  ],
  declarations: [
    DashboardComponent,
    BulkResourceUploadComponent,
    ManageResourceComponent,
    ManageUserComponent,
    AddUserComponent
  ]
})
export class DashboardModule { }
