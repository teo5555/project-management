package orgeteoman.crud.admin;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;

import orgeteoman.crud.DTO.ProjectUserDTO;

import java.util.List;
import java.util.Optional;



public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByUserName(String userName);

    @Query("SELECT new orgeteoman.crud.DTO.ProjectUserDTO (u.userName,u.roles,u.id,p.id,p.title) from User u JOIN u.projects p")
  	List<ProjectUserDTO> findAllProjectUsers();
    
  	List<ProjectUserDTO> deleteProjectUserById(int id);
  	

}
