package com.high.app.dao.impl;

import java.util.List;



import com.high.app.dao.AbstractDao;
import com.high.app.dao.ScheduleDao;
import com.high.app.model.Schedule;


public class ScheduleDaoImpl extends AbstractDao implements ScheduleDao {

	@Override
	public void save(Schedule schedule) {
		session.save(schedule);
	}

	@Override
	public void save(List<Schedule> list) {
		for( int i = 0; i < list.size(); ++i )
			session.save(list.get(i));

	}

	@Override
	public void delete(Schedule schedule) {
		session.delete(schedule);

	}

	@Override
	public void update(Schedule schedule) {
		session.update(schedule);

	}

	@Override
    @SuppressWarnings("unchecked")
	public List<Schedule> getSchedule() {
		return session.createQuery("from com.high.app.model.Schedule").list();
	}

	@Override
	public Schedule getScheduleById(Integer id) {
		return (Schedule) session.get(Schedule.class, id);
	}


}
