export interface IsearchResultPagination {
    totalRecordsCount: number;
    totalPages: number;
    currentPageNo: number;
    pageSize: number;
    paginationArray: number[];
    showFirstIcon: boolean;
    showLastIcon: boolean;
}

export class searchResultPagination implements IsearchResultPagination {
    totalRecordsCount: number;
    totalPages: number;
    currentPageNo: number;
    pageSize: number;
    paginationArray: Array<number>;
    showFirstIcon: boolean;
    showLastIcon: boolean;

    constructor() {
        this.totalRecordsCount = 0;
        this.totalPages = 0;
        this.currentPageNo = 0;
        this.pageSize = 0;
        this.paginationArray = [];
        this.showFirstIcon = false;
        this.showLastIcon = false;
    }

}