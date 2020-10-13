package orgeteoman.crud.project;

import java.util.ArrayList;

import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import javax.persistence.Table;

import orgeteoman.crud.admin.User;


@Entity
@Table(name = "Project")
public class Project {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column( columnDefinition = "TEXT")
    private String title;
    @Column( columnDefinition = "TEXT")
    private String description;
   
    private String start_date;
    private String end_date;
 
    
    @ManyToMany(targetEntity = User.class, fetch = FetchType.LAZY,cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH,
			
	})
	@JoinTable(
			name="project_user",
			joinColumns = @JoinColumn(name="project_id"),
			inverseJoinColumns = @JoinColumn(name="user_id")
			)
	private List<User> users;
    
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Project() {
	}

	public void addUser(User theUser) {
		
		if(users == null) {
			
			users = new ArrayList<>();
			
		}
		users.add(theUser);
	}
	
	public void removeUser(User theUser) {
	
		users.remove(theUser);
		
	}

}
