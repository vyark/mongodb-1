package model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class PhoneNumbers {
    @Id
    private Long phoneNumberId;
    private String phoneNumber;
    private Long studentId;
}
