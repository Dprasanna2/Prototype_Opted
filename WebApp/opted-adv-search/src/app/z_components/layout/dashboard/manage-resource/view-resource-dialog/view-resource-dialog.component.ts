import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ApproveRejectRequest } from 'src/app/models/researchDetail';
import { ResearchDetailsService } from 'src/app/Services/research-details.service';

@Component({
  selector: 'app-view-resource-dialog',
  templateUrl: './view-resource-dialog.component.html',
  styleUrls: ['./view-resource-dialog.component.scss']
})
export class ViewResourceDialogComponent implements OnInit {
  dialogForm: FormGroup;
  commentTextError = false;
  rowData: any;
  showCommentRequiredMsg = false;
  constructor(
    private researchDetailsService: ResearchDetailsService,
    private fb: FormBuilder,
    public dialogRef: MatDialogRef<ViewResourceDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any) 
  {
    this.rowData = data.rowData;
    console.log('data: ', data);
    this.dialogForm = this.fb.group({
      comment:['', [Validators.required, Validators.pattern('[a-zA-Z]+')]],
    });
    
  }
  ngOnInit(): void {
  }

  close(): void {
    this.dialogRef.close();
  }
  rejectRequest(){
    this.commentTextError = false; 
    console.log(this.dialogForm.controls['comment'].value);
    const comment = this.dialogForm.controls['comment'].value;
    if(comment && comment.toString() !== '') {
      const data = new ApproveRejectRequest();
      data.uid = this.rowData.uid;
      data.isApproved = false;
      data.comment = comment;
      this.researchDetailsService.ApproveResource(data).subscribe(x => {
        console.log('Approved: ', x);
        
      });
    } else {
      this.commentTextError = true; 
    }
  }
  ApproveRequest(){
    this.commentTextError = false; 
    console.log(this.dialogForm.controls['comment'].value);
    const data = new ApproveRejectRequest();
    data.uid = this.rowData.uid;
    data.isApproved = true;
    this.researchDetailsService.ApproveResource(data).subscribe(x => {
      console.log('Approved: ', x);
      
    });
    // if(this.dialogForm.controls['comment'].value == ''){
    //   this.commentTextError = true;
    // }
  }
}
