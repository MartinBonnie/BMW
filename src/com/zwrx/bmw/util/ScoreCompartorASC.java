package com.zwrx.bmw.util;

import java.util.Comparator;

import com.zwrx.bmw.models.BmwSyscode;

public class ScoreCompartorASC implements Comparator<BmwSyscode> {

	public boolean equals(Object o){
        return false;
    }

	@Override
	public int compare(BmwSyscode data1, BmwSyscode data2) {

		String[] contents1 =data1.getContent().split("-");
		String[] contents2 =data2.getContent().split("-");

		double param1 = Double.valueOf(contents1[0]);
		double param2 = Double.valueOf(contents2[0]);
		
		if (param1 < param2) {
			return -1;
		}
		if (param1 == param2) {
			
				return 0;
			
		}
		if (param1 > param2) {
			return 1;
		}
		return 0;
	}

}
