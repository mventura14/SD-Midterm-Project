package com.skilldistillery.snowboardswap.entities;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="lift_type")
public class LiftType {
	
	@Id
	@GeneratedValue()
	private int Id;
	
	private String type;

	public LiftType() {
		super();
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
		LiftType other = (LiftType) obj;
		return Id == other.Id;
	}

	@Override
	public String toString() {
		return "LiftType [Id=" + Id + ", type=" + type + "]";
	}
}
