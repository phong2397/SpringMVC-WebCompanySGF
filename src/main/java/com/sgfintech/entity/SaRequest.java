package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "sgft_sa_request")
public class SaRequest implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "company_code")
    private String companyCode;

    @Column(name = "customer_phone", nullable = false)
    private String customerPhone;

    @Column(name = "borrow")
    private Long borrow;

    @Column(name = "time_borrow")
    private Integer timeBorrow;

    @Column(name = "interest_rate")
    private Double interestRate;

    @Column(name = "fee_borrow")
    private Double feeBorrow;

    @Column(name = "status")
    private String status;

    @Column(name = "employee_thamdinh")
    private String employeeThamdinh;

    @Column(name = "employee_thamdinh_date")
    private LocalDateTime employeeThamdinhDate;

    @Column(name = "employee_duyet")
    private String employeeDuyet;

    @Column(name = "employee_duyet_date")
    private LocalDateTime employeeDuyetDate;

    @Column(name = "description")
    private String description;

    @Column(name = "data")
    private byte[] data;

    @Column(name = "created_date")
    private LocalDateTime createdDate = LocalDateTime.now();

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    @Column(name = "updated_time_bororw")
    private LocalDateTime updatedTimeBororw;

    @Column(name = "lasttime_topup")
    private LocalDateTime lasttimeTopup;

    public SaRequest(Long id, String companyCode, String customerPhone, Long borrow, Integer timeBorrow, Double interestRate, Double feeBorrow, String status, String employeeThamdinh, LocalDateTime employeeThamdinhDate, String employeeDuyet, LocalDateTime employeeDuyetDate, String description, byte[] data, LocalDateTime createdDate, LocalDateTime updatedDate, LocalDateTime updatedTimeBororw, LocalDateTime lasttimeTopup) {
        this.id = id;
        this.companyCode = companyCode;
        this.customerPhone = customerPhone;
        this.borrow = borrow;
        this.timeBorrow = timeBorrow;
        this.interestRate = interestRate;
        this.feeBorrow = feeBorrow;
        this.status = status;
        this.employeeThamdinh = employeeThamdinh;
        this.employeeThamdinhDate = employeeThamdinhDate;
        this.employeeDuyet = employeeDuyet;
        this.employeeDuyetDate = employeeDuyetDate;
        this.description = description;
        this.data = data;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.updatedTimeBororw = updatedTimeBororw;
        this.lasttimeTopup = lasttimeTopup;
    }

    public SaRequest() {
    }
}
