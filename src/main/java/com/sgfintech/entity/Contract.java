package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Table(name = "sgft_contract")
@Entity
@Data
public class Contract implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id_contract", nullable = false)
    private Long idContract;

    @Column(name = "system_trace")
    private String systemTrace;

    @Column(name = "customer_phone", nullable = false)
    private String customerPhone;

    @Column(name = "borrow")
    private Long borrow;

    @Column(name = "time_borrow")
    private Integer timeBorrow;

    @Column(name = "remain_amount_borrow")
    private Long remainAmountBorrow;

    @Column(name = "fee_borrow")
    private Double feeBorrow;

    @Column(name = "transaction_id")
    private String transactionId;

    @Column(name = "status")
    private String status;

    @Column(name = "date_repayment")
    private LocalDateTime dateRepayment;

    @Column(name = "date_repayment_util")
    private LocalDateTime dateRepaymentUtil;

    @Column(name = "accepted_by")
    private String acceptedBy;

    @Column(name = "noted_by")
    private byte[] notedBy;

    public Contract(Long idContract, String systemTrace, String customerPhone, Long borrow, Integer timeBorrow, Long remainAmountBorrow, Double feeBorrow, String transactionId, String status, LocalDateTime dateRepayment, LocalDateTime dateRepaymentUtil, String acceptedBy, byte[] notedBy) {
        this.idContract = idContract;
        this.systemTrace = systemTrace;
        this.customerPhone = customerPhone;
        this.borrow = borrow;
        this.timeBorrow = timeBorrow;
        this.remainAmountBorrow = remainAmountBorrow;
        this.feeBorrow = feeBorrow;
        this.transactionId = transactionId;
        this.status = status;
        this.dateRepayment = dateRepayment;
        this.dateRepaymentUtil = dateRepaymentUtil;
        this.acceptedBy = acceptedBy;
        this.notedBy = notedBy;
    }
    public Contract() {
    }
}
