package com.skilldistillery.snowboardswap.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="traill_status")
public class TrailStatus {

	@Id
	@GeneratedValue()
	private int Id;
	
	@Column(name="occurrence_date")
	private LocalDateTime occurrenceDate;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "trail_id")
	private Trail trail;
	
	public TrailStatus() {}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public LocalDateTime getOccurenceDate() {
		return occurrenceDate;
	}

	public void setOccurenceDate(LocalDateTime occurrenceDate) {
		this.occurrenceDate = occurrenceDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Trail getTrail() {
		return trail;
	}

	public void setTrail(Trail trail) {
		this.trail = trail;
	}

	@Override
	public int hashCode() {
		return Objects.hash(Id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TrailStatus other = (TrailStatus) obj;
		return Id == other.Id;
	}

}