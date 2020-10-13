package orgeteoman.crud.DTO;

import orgeteoman.crud.admin.User;
import orgeteoman.crud.project.Project;


public class ProjectUserDTO {
	
	private Project project;
	
	private User user;
	
	private int projectId;
	
	private int userId;
	
	private String userName;
	
	private String title;
	
	private String roles;
	
	private String description;
    private String start_date;
    private String end_date;
    
    

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

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public ProjectUserDTO(String userName,String roles,int userId,int projectId,String title) {
		this.projectId = projectId;
		this.userId = userId;
		this.userName = userName;
		this.title = title;
		this.roles = roles;
	}
	
	public ProjectUserDTO(String userName,String roles,int userId,int projectId,String title,String start_date,String end_date) {
		this.projectId = projectId;
		this.userId = userId;
		this.userName = userName;
		this.title = title;
		this.roles = roles;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	
	public ProjectUserDTO(String userName,String roles,int userId,int projectId,String title,String description,String start_date,String end_date) {
		this.projectId = projectId;
		this.userId = userId;
		this.userName = userName;
		this.title = title;
		this.description= description;
		this.roles = roles;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public ProjectUserDTO() {
	}
}
