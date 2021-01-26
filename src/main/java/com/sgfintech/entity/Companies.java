package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "sgft_companies")
@Data
public class Companies implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "company_code")
    private String companyCode;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_address")
    private String companyAddress;

    @Column(name = "conpany_tax")
    private String conpanyTax;

    @Column(name = "company_phone")
    private String conpanyPhone;

    @Column(name = "created_date")
    private LocalDateTime createdDate = LocalDateTime.now();

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    public Companies(Long id, String companyCode, String companyName, String companyAddress, String conpanyTax, String companyPhone, LocalDateTime createdDate, LocalDateTime updatedDate) {
        this.id = id;
        this.companyCode = companyCode;
        this.companyName = companyName;
        this.companyAddress = companyAddress;
        this.conpanyTax = conpanyTax;
        this.conpanyPhone = companyPhone;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public Companies() {
    }
}
