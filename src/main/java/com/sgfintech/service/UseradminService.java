package com.sgfintech.service;

import com.sgfintech.dao.UseradminRepository;
import com.sgfintech.entity.Useradmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class UseradminService {
    @Autowired
    UseradminRepository repo;

    public void save(Useradmin useradmin) {
        repo.save(useradmin);
    }

    public List<Useradmin> getAll() {
        return (List<Useradmin>) repo.findAll();
    }

    public Useradmin getById(Long id) {
        return repo.findById(id).get();
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
