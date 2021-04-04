package ru.job4j.dream.store;


import ru.job4j.dream.model.Candidate;
import ru.job4j.dream.model.Post;
import ru.job4j.dream.model.User;

import java.util.Collection;

public interface Store {
    Collection<Post> findAllPosts();

    Collection<Candidate> findAllCandidates();

    void save(Post post);
    void save(Candidate candidate);
    void save(User post);

    void deleteCandidate(int id);
    void deleteUser(int id);

    Post findById(int id);
    Candidate findByIdCandidate(int id);
    User findByIdUser(int id);
    User findByEmailUser(String email);

}
