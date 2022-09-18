import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-more-result-data',
  templateUrl: './more-result-data.component.html',
  styleUrls: ['./more-result-data.component.scss']
})
export class MoreResultDataComponent implements OnInit {

  @Input() rowData: any;

  constructor() { }

  ngOnInit() {
  }

  isValidLink(link: string) {
    return link && link.toLowerCase() != 'null' && link.toLowerCase() != 'na' && link.toLowerCase() != '-'
  }
}
