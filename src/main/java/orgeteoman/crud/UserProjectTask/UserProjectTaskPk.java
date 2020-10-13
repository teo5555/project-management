package orgeteoman.crud.UserProjectTask;

import java.io.Serializable;

import javax.persistence.Embeddable;


import lombok.Data;

@Embeddable
@Data
public class UserProjectTaskPk implements Serializable {
	
    private static final long serialVersionUID = 1L;
	private int userId;
	private int projectId;
	private int taskId;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	@Override
	public String toString() {
		return "UserProjectTaskPk [userId=" + userId + ", projectId=" + projectId + ", taskId=" + taskId + "]";
	}

}
