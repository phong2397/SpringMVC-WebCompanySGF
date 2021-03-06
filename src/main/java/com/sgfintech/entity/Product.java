package com.sgfintech.entity;

import lombok.Data;
import org.w3c.dom.Text;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "sgft_product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "product_code", nullable = false)
    private String productCode;

    @Column(name = "product_detail")
    private String productDetail;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "status")
    private String status;

    @Column(name = "created_date")
    private LocalDateTime createdDate = LocalDateTime.now();

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    @Column(name = "product_rate")
    private Double productRate;

//    @Lob
//    @Column(name = "product_amount_max")
//    private String productAmountMax;

    @Lob
    @Column(name = "product_amount_min")
    private String productAmountMin;

    @Column(name = "limit_count")
    private Integer limitCount;
}
