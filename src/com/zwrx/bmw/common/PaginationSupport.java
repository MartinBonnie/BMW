package com.zwrx.bmw.common;

import java.util.List;

public class PaginationSupport {
	public final static int PAGESIZE = 10;

	private int pageSize = PAGESIZE;

	private int totalCount;

	private int currentPage;

	private int nextPage;

	private int previousPage;

	private int startIndex;

	private int[] indexes = new int[0];
	
	private String[] pages = new String[0];

	private int nextIndex;

	private int previousIndex;

	private int pageCount;

	private List items;

	private int lastIndex;

	public PaginationSupport(int pageSize, int startIndex) {
		setPageSize(pageSize);
		setStartIndex(startIndex);

	}

	public PaginationSupport(List items, int totalCount) {
		setPageSize(PAGESIZE);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(0);

	}

	public PaginationSupport(List items, int totalCount, int startIndex) {
		setPageSize(PAGESIZE);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);

	}

	public PaginationSupport(List items, int totalCount, int pageSize,
			int startIndex) {
		setPageSize(pageSize);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);

	}

	public void setTotalCount(int totalCount) {
		if (totalCount > 0) {
			this.totalCount = totalCount;
			int count = totalCount / pageSize;
			if (totalCount % pageSize > 0)
				count++;
			indexes = new int[count];
			for (int i = 0; i < count; i++) {
				indexes[i] = pageSize * i;
			}
		} else {
			this.totalCount = 0;
		}
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setIndexes(int[] indexes) {
		this.indexes = indexes;
	}

	public int[] getIndexes() {
		return indexes;
	}

	public void setStartIndex(int startIndex) {
		if (totalCount <= 0)
			this.startIndex = 0;
		else if (startIndex >= totalCount)
			this.startIndex = indexes[indexes.length - 1];
		else if (startIndex < 0)
			this.startIndex = 0;
		else {
			this.startIndex = indexes[startIndex / pageSize];
		}
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setNextIndex(int nextIndex) {
		this.nextIndex = nextIndex;
	}

	public int getNextIndex() {
		int nextIndex = getStartIndex() + pageSize;
		if (nextIndex >= totalCount)
			return getStartIndex();
		else
			return nextIndex;
	}

	public void setPreviousIndex(int previousIndex) {
		this.previousIndex = previousIndex;
	}

	public int getPreviousIndex() {
		int previousIndex = getStartIndex() - pageSize;
		if (previousIndex < 0)
			return 0;
		else
			return previousIndex;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageCount() {
		if (pageSize == 0)
			pageSize = 1;
		int count = totalCount / pageSize;
		if (totalCount % pageSize > 0)
			count++;
		if (count == 0)
			count = 1;
		return count;
	}

	public int getCurrentPage() {
		return getStartIndex() / pageSize + 1;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getLastIndex() {
		if (indexes.length == 0)
			return 0;
		return indexes[indexes.length - 1];
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List getItems() {
		return items;
	}

	public void setItems(List items) {
		this.items = items;
	}

	public int getNextPage() {
		if (getCurrentPage() < getPageCount())
			return getCurrentPage() + 1;
		else
			return getCurrentPage();

	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPreviousPage() {
		if (getCurrentPage() > 1)
			return getCurrentPage() - 1;
		else
			return getCurrentPage();
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}
	

	public String[] getPages() {
		//显示本页在内的五页
		int currentPage = getCurrentPage();
		int totalPage = getPageCount();
		//总页数大于5页
		if(totalPage>5){
			if(currentPage<3){//当前页小于3页
				pages = new String[5];
				pages[0]=1+"";
				pages[1]=2+"";
				pages[2]=3+"";
				pages[3]=4+"";
				pages[4]=5+"";
			}else if(currentPage<totalPage-3){//当前页不是最后三页之一
				pages = new String[5];
				pages[0]=currentPage-2+"";
				pages[1]=currentPage-1+"";
				pages[2]=currentPage+"";
				pages[3]=currentPage+1+"";
				pages[4]=currentPage+2+"";
			}else{
				pages = new String[5];
				pages[0]=totalPage-4+"";
				pages[1]=totalPage-3+"";
				pages[2]=totalPage-2+"";
				pages[3]=totalPage-1+"";
				pages[4]=totalPage+"";
			}
		}else{//小于五页
			pages = new String[totalPage];
			for(int i=0;i<totalPage;i++){
				pages[i]=(i+1)+"";
			}
		}
		return pages;
	}

	public void setPages(String[] pages) {
		this.pages = pages;
	}


}