package com.skilldistillery.snowboardswap.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Trail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String difficulty;

	@OneToMany(mappedBy = "trail")
	private List<TrailStatus> statuses;

	@ManyToOne
	@JoinColumn(name = "resort_id")
	private Resort resort;

	public Trail() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public List<TrailStatus> getStatuses() {
		return statuses;
	}

	public void setStatuses(List<TrailStatus> statuses) {
		this.statuses = statuses;
	}

	public Resort getResort() {
		return resort;
	}

	public void setResort(Resort resort) {
		this.resort = resort;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public String toString() {
		return "Trail [id=" + id + ", name=" + name + ", difficulty=" + difficulty + ", statuses=" + statuses
				+ ", resort=" + resort + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Trail other = (Trail) obj;
		return id == other.id;
	}
}
