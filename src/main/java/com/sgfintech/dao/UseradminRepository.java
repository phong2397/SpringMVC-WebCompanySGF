package com.sgfintech.dao;

import com.sgfintech.entity.Useradmin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface UseradminRepository extends JpaRepository<Useradmin, Long>, JpaSpecificationExecutor<Useradmin> {

}