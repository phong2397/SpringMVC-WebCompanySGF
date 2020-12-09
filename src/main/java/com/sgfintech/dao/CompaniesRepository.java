package com.sgfintech.dao;

import com.sgfintech.entity.Companies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CompaniesRepository extends JpaRepository<Companies, Long>, JpaSpecificationExecutor<Companies> {

}