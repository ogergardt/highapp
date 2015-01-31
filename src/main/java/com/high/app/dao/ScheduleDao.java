package com.high.app.dao;

import java.util.List;

import com.high.app.model.Schedule;

public interface ScheduleDao {
	public void save(Schedule schedule);
	public void save(List<Schedule> schedule);
	public void delete(Schedule schedule);
	public void update(Schedule schedule);


	public List<Schedule> getSchedule();
	public Schedule getScheduleById(Integer id);
	
	                    
}