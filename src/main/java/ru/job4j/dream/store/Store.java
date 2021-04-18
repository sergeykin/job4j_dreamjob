package ru.job4j.dream.store;


import ru.job4j.dream.model.Candidate;
import ru.job4j.dream.model.City;
import ru.job4j.dream.model.Post;
import ru.job4j.dream.model.User;

import java.util.Collection;
import java.util.List;

public interface Store {
    Collection<Post> findAllPosts();

    Collection<Candidate> findAllCandidates();

    void save(Post post);

    void save(Candidate candidate);

    void save(User post);

    void deleteCandidate(int id);

    Post findById(int id);

    Candidate findByIdCandidate(int id);

    User findByEmailUser(String email);

    public Collection<City> getListCity();

    public City getCity(int id);
}
