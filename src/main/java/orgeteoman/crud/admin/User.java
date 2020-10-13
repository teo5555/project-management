package orgeteoman.crud.admin;

import java.util.List;
import javax.persistence.*;

import orgeteoman.crud.project.Project;


@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
    private String userName;

    private String password;

    private String roles;

  	@ManyToMany(fetch = FetchType.LAZY,cascade = {
  			CascadeType.DETACH,
  			CascadeType.MERGE,
  			CascadeType.PERSIST,
  			CascadeType.REFRESH,
  			
  	})
  	@JoinTable(
  			name="project_user",
  			joinColumns = @JoinColumn(name="user_id"),
  			inverseJoinColumns = @JoinColumn(name="project_id")
  			)
  	private List<Project> projects;

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public User(String userName,  String password,String roles) {
		this.userName = userName;
		this.password = password;
		this.roles = roles;
	}

	public User() {
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
 
}
