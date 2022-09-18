import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgxCsvParserModule } from 'ngx-csv-parser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginPageComponent } from './z_components/common/login-page/login-page.component';
import { SpinnerComponent } from './z_components/common/spinner/spinner.component';
import { UploadFileComponent } from './z_components/common/upload-file/upload-file.component';
import { MainPageComponent } from './z_components/layout/main-page/main-page.component';
import { SearchBarComponent } from './z_components/layout/main-page/search-bar/search-bar.component';
import { SearchResultComponent } from './z_components/layout/main-page/search-result/search-result.component';
import { NavMenuComponent } from './z_components/layout/nav-menu/nav-menu.component';
// import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AgGridModule } from 'ag-grid-angular';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { RegisterPageComponent } from './z_components/common/register-page/register-page.component';
import {MatSelectModule} from '@angular/material/select';
import { PaginationComponent } from './z_components/common/pagination/pagination.component';
import { MoreResultDataComponent } from './z_components/layout/main-page/search-result/more-result-data/more-result-data.component';
import {MatAutocompleteModule} from '@angular/material/autocomplete';
import { RetryInterceptor } from './utilities/Interceptor/RetryInterceptor';
import { SpinnerInterceptor } from './utilities/Interceptor/SpinnerInterceptor';
import { TokenInterceptor } from './utilities/Interceptor/TokenInterceptor';
import { AddResourceComponent } from './z_components/layout/add-resource/add-resource.component';
import { MatInputModule } from '@angular/material/input';
import { DashboardComponent } from './z_components/layout/dashboard/dashboard.component';
import { ManageResourceComponent } from './z_components/layout/dashboard/manage-resource/manage-resource.component';
import { ManageUserComponent } from './z_components/layout/dashboard/manage-user/manage-user.component';
import { BulkResourceUploadComponent } from './z_components/layout/dashboard/bulk-resource-upload/bulk-resource-upload.component';
import { AddUserComponent } from './z_components/layout/dashboard/add-user/add-user.component';
import { ViewResourceDialogComponent } from './z_components/layout/dashboard/manage-resource/view-resource-dialog/view-resource-dialog.component';
import { ViewRowBtnComponent } from './z_components/common/view-row-btn/view-row-btn.component';


@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    // RouterModule.forRoot(routes),
    AppRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    BrowserAnimationsModule,
    HttpClientModule,
    // LayoutModule,
    // AgGridModule,
    NgxCsvParserModule,
    MatSelectModule,
    MatAutocompleteModule,
    MatInputModule
    // NgbModule
  ],
  declarations: [
    // LayoutComponent,
    AppComponent,
    // DashboardComponent,
    MainPageComponent,
    SearchBarComponent,
    SearchResultComponent,
    NavMenuComponent,
    UploadFileComponent,
    LoginPageComponent,
    RegisterPageComponent,
    // LoginPageComponent,
    SpinnerComponent,
    PaginationComponent,
    MoreResultDataComponent,
    AddResourceComponent,
    ViewResourceDialogComponent,
    ViewRowBtnComponent
    // ManageResourceComponent,
    // ManageUserComponent,
    // BulkResourceUploadComponent,
    // AddUserComponent
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: SpinnerInterceptor, multi: true },
    // { provide: HTTP_INTERCEPTORS, useClass: RetryInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: TokenInterceptor, multi: true }
    // AuthenticationService,
    // CanActivateGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

