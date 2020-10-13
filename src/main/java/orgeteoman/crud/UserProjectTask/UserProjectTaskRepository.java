package orgeteoman.crud.UserProjectTask;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface UserProjectTaskRepository extends JpaRepository<UserProjectTask, Integer> {
	
	@Query("select u from UserProjectTask u  where u.user.id =:userId AND u.project.id=:projectId ORDER BY u.task.deadline")
    public List<UserProjectTask> listAllById(int userId,int projectId);

	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.id =:userId AND u.project.id=:projectId ORDER BY u.task.deadline")
    public List<UserProjectTask> completedTasks(String state,int userId,int projectId);
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.id =:userId AND u.project.id=:projectId AND u.task.deadline>:deadline ORDER BY u.task.deadline")
    public List<UserProjectTask> completedTasksOnTime(String state,int userId,int projectId,String deadline);
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.id =:userId AND u.project.id=:projectId AND u.task.deadline<:deadline ORDER BY u.task.deadline")
    public List<UserProjectTask> completedTasksOutTime(String state,int userId,int projectId,String deadline);
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.id =:userId AND u.project.id=:projectId ORDER BY u.task.deadline")
    public List<UserProjectTask> pendingState(String state,int userId,int projectId);
	
	@Query("select u from UserProjectTask u  where u.user.userName =:username ORDER BY u.task.deadline")
    public List<UserProjectTask> listAllByName(String username);
	
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.userName =:username ORDER BY u.task.deadline")
    public List<UserProjectTask> completedTaskOwn(String state,String username);
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.userName =:username AND u.task.deadline>:deadline ORDER BY u.task.deadline")
    public List<UserProjectTask> completedTasksOnTimeOwn(String state,String username,String deadline);
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.userName =:username AND u.task.deadline<:deadline ORDER BY u.task.deadline")
    public List<UserProjectTask> completedTasksOutTimeOwn(String state,String username,String deadline);
	
	@Query("select u from UserProjectTask u  where u.task.state =:state AND u.user.userName =:username ORDER BY u.task.deadline")
    public List<UserProjectTask> pendingStateOwn(String state,String username);
	

}
