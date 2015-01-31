package com.high.app.dao.impl;

import java.util.List;



import com.high.app.dao.AbstractDao;
import com.high.app.dao.UseravailableDao;
import com.high.app.model.Useravailable;


public class UseravailableDaoImpl extends AbstractDao implements UseravailableDao {

	@Override
	public void save(Useravailable useravailable) {
		session.save(useravailable);
	}

	@Override
	public void save(List<Useravailable> list) {
		for( int i = 0; i < list.size(); ++i )
			session.save(list.get(i));

	}

	@Override
	public void delete(Useravailable useravailable) {
		session.delete(useravailable);

	}

	@Override
	public void update(Useravailable useravailable) {
		session.update(useravailable);

	}

	@Override
    @SuppressWarnings("unchecked")
	public List<Useravailable> getUseravailable() {
		return session.createQuery("from com.high.app.model.Useravailable").list();
	}

	@Override
	public Useravailable getUseravailableById(Integer id) {
		return (Useravailable) session.get(Useravailable.class, id);
	}


}
