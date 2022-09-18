import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Component } from 'ag-grid-community';
import { LoginPageComponent } from './z_components/common/login-page/login-page.component';
import { RegisterPageComponent } from './z_components/common/register-page/register-page.component';
import { UploadFileComponent } from './z_components/common/upload-file/upload-file.component';
import { AddResourceComponent } from './z_components/layout/add-resource/add-resource.component';
import { AddUserComponent } from './z_components/layout/dashboard/add-user/add-user.component';
import { BulkResourceUploadComponent } from './z_components/layout/dashboard/bulk-resource-upload/bulk-resource-upload.component';
import { DashboardComponent } from './z_components/layout/dashboard/dashboard.component';
import { ManageResourceComponent } from './z_components/layout/dashboard/manage-resource/manage-resource.component';
import { ManageUserComponent } from './z_components/layout/dashboard/manage-user/manage-user.component';
import { MainPageComponent } from './z_components/layout/main-page/main-page.component';
import { SearchResultComponent } from './z_components/layout/main-page/search-result/search-result.component';

const routes: Routes = [
  {
    path: '',
    component: MainPageComponent,
    pathMatch: 'full',
  },
  {
    path: 'home',
    component: MainPageComponent,
  },
  {
    path: 'login',
    component: LoginPageComponent
  },
  {
    path: 'registration',
    component: RegisterPageComponent
  },
  {
    path: 'upload',
    component: UploadFileComponent
  },
  {
    path: 'addResource',
    component: AddResourceComponent
  },
  {
    path: 'dashboard',
    loadChildren: () => import('./z_components/layout/dashboard/dashboard.module').then(m => m.DashboardModule)
  },
  // {
  //   path: 'bulkUpload',
  //   // loadChildren: () => import('./z_components/layout/dashboard/dashboard.module').then(m => m.DashboardModule)
  //   component: BulkResourceUploadComponent
  // },
  // {
  //   path: 'manageResource',
  //   component: ManageResourceComponent
  // },
  // {
  //   path: 'manageUser',
  //   component: ManageUserComponent
  // },
  // {
  //   path: 'addUser',
  //   component: AddUserComponent
  // },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
