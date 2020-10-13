package orgeteoman.crud.UserProjectTask;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

import orgeteoman.crud.admin.User;
import orgeteoman.crud.leader.Task;
import orgeteoman.crud.project.Project;


@Entity
public class UserProjectTask {
	
	@EmbeddedId
	private UserProjectTaskPk id;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@MapsId("userId")
	private User user;

	@ManyToOne(cascade = CascadeType.ALL)
	@MapsId("projectId")
	private Project project;

	@ManyToOne(cascade = CascadeType.ALL)
	@MapsId("taskId")
	private Task task;
	
	
	
	
	public UserProjectTaskPk getId() {
		return id;
	}

	public void setId(UserProjectTaskPk id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public UserProjectTask() {
	}

	@Override
	public String toString() {
		return "UserProjectTask [id=" + id + ", user=" + user + ", project=" + project + ", task=" + task + "]";
	}
	
	
}
