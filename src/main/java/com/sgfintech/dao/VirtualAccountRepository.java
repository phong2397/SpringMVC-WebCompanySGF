package com.sgfintech.dao;

import com.sgfintech.entity.VirtualAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface VirtualAccountRepository extends JpaRepository<VirtualAccount, String>, JpaSpecificationExecutor<VirtualAccount> {

}