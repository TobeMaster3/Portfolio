package com.camper.community.model;

import lombok.Data;

@Data
public class PagingVO {

	// Pagination
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	private int offset;
		
	public PagingVO(int cpage, int totalRecord) {
		this.setCpage(cpage);
		this.setBlockPerPage(5);
		this.setTotalRecord(totalRecord);
		this.setTotalPage( ( ( this.getTotalRecord() - 1 ) / this.getBlockPerPage() ) + 1 );
		this.setStartBlock( this.getCpage() - (this.getCpage()-1) % this.getBlockPerPage() );
		this.setEndBlock( this.getCpage() - (this.getCpage()-1) % this.getBlockPerPage() + this.getBlockPerPage() - 1 );
		if( this.getEndBlock() >= this.getTotalPage() ) {
			this.setEndBlock( this.getTotalPage() );
		}
	}
}
