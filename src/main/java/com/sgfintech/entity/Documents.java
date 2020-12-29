package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Table(name = "sgft_documents")
@Entity
@Data
public class Documents implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "customer_phone", nullable = false)
    private String customerPhone;

    @Column(name = "customer_payslip")
    private String customerPayslip;

    @Column(name = "customer_id")
    private String customerId;

    @Column(name = "customer_health")
    private String customerHealth;

    @Column(name = "customer_appendix")
    private String customerAppendix;

    @Column(name = "customer_salary")
    private String customerSalary;

    @Column(name = "customer_social")
    private String customerSocial;

    @Column(name = "created_date")
    private LocalDateTime createdDate = LocalDateTime.now();

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    @Column(name = "customer_contract")
    private String customerContract;

}
