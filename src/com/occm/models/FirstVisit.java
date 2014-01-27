package com.occm.models;

public class FirstVisit {
	boolean visit;

	public boolean getVisit() {
		if(this.visit){
			this.visit = false;
			return true;
		}
		return false;
	}

	public FirstVisit(boolean isFirstVisit) {
		super();
		this.visit = isFirstVisit;
	}

}
