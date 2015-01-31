package com.high.app.dao;

import java.util.List;

import com.high.app.model.Useravailable;

public interface UseravailableDao {
	public void save(Useravailable useravailable);
	public void save(List<Useravailable> useravailable);
	public void delete(Useravailable useravailable);
	public void update(Useravailable useravailable);


	public List<Useravailable> getUseravailable();
	public Useravailable getUseravailableById(Integer id);	                    
}
