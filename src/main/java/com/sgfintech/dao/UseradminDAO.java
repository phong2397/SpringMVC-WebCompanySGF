package com.sgfintech.dao;

import com.sgfintech.entity.Useradmin;

import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public interface UseradminDAO {
    public Useradmin findById(String id);

    public List<Useradmin> findAll();

    public void save(Useradmin u);

    public void update(String id);
}
