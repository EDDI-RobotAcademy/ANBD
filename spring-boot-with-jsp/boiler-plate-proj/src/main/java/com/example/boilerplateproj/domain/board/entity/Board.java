package com.example.boilerplateproj.domain.board.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@ToString
@Table(name="test_board")
public class Board {

	@Id
	private int boardNo;
	private String title;
	private String content;
	private String writer;
	private LocalDateTime regDate;

}
