package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.NoteDAO;
import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;

@Service
public class NoteServiceImpl implements NoteService {

