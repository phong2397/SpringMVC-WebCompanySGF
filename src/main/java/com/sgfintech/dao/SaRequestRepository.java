package com.sgfintech.dao;

import com.sgfintech.entity.SaRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SaRequestRepository extends JpaRepository<SaRequest, Long>, JpaSpecificationExecutor<SaRequest> {

}