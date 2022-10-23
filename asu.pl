

%-------------- this is function to write symbol to the terminal
sy(Symbol, 0).
sy(Symbol, N) :-
    N > 0,
    write(Symbol),
    N1 is N - 1,
    sy(Symbol, N1).

%------------------this is the function to write Horizontal line
drawHLine(0) :- write('\n').
drawHLine(N) :-
    N > 0,
    write('-'),
    N1 is N - 1,
    drawHLine(N1).

%----------------this is the function to write Vertical line
drawVSpace(0, LineLenght).
drawVSpace(N, LineLenght) :-
    N > 0,
    write('|'),
    sy(' ', LineLenght),
    write('|'),
    write('\n'),
    N1 is N - 1,
    drawVSpace(N1, LineLenght).

%------------------this is the main function that control the whole project. it the driver function
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, Size) :-
    TextWidth is Size * 3,
    TxtHgt is Size * 5,
    LineLenght is TextWidth * 3 + SpaceBetweenCharacters * 2 + LeftRightMargin * 2 + 2,
	drawHLine(LineLenght),
	drawVSpace(BottomTopMargin,LineLenght-2),
    drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TxtHgt, Size, 0),
	drawVSpace(BottomTopMargin,LineLenght-2),
	drawHLine(LineLenght).

%---------------this the driver function to draw asu character in the terminal
drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TxtHgt, Size, TxtHgt).
drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TxtHgt, Size, Line) :-
    Line < TxtHgt,
    write('|'),
    sy(' ', LeftRightMargin),
    letterA(TextWidth, TxtHgt, Size, Line, 0),
    sy(' ', SpaceBetweenCharacters),
    letterS(TextWidth, TxtHgt, Size, Line, 0),
    sy(' ', SpaceBetweenCharacters),
    letterU(TextWidth, TxtHgt, Size, Line, 0),
    sy(' ', LeftRightMargin),
    _next is Line + 1,
    write('|'),
    nl,
    drawASU(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TxtHgt, Size, _next).


%-------------------------this is the function that writes letter A into the terminal
letterA(TextWidth, TxtHgt, Size, Line, TextWidth).
letterA(TextWidth, TxtHgt, Size, Line, Col) :-
    ((Line >= Size, Line < 2 * Size);(Line >= TextWidth, Line < 4 * Size);(Line >= Size * 4, Line < TxtHgt)),
    ((Col >= 0,Col < Size);(Col >= 2 * Size,Col < TextWidth)),
    sy('*', Size),
    _nextCol is Col + Size,
    letterA(TextWidth, TxtHgt, Size, Line, _nextCol).

letterA(TextWidth, TxtHgt, Size, Line, Col) :-
    ((Line >= Size, Line < 2 * Size);(Line >= TextWidth, Line < 4 * Size);(Line >= 4 * Size, Line < TxtHgt)),
    Col >= 1 * Size,
    Col < 2 * Size,
    sy(' ', Size),
    _nextCol is Col + Size,
    letterA(TextWidth, TxtHgt, Size, Line, _nextCol).

letterA(TextWidth, TxtHgt, Size, Line, Col) :-
    ((Line >= 0, Line < Size); (Line >= 2 * Size, Line < TextWidth)),
    Col < TextWidth,
    sy('*', Size),
    _nextCol is Col + Size,
    letterA(TextWidth, TxtHgt, Size, Line, _nextCol).

%-------------------------this is the function that writes letter S into the terminal


letterS(TextWidth, TxtHgt, Size, Line, TextWidth).
letterS(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= Size, Line < 2 * Size),(Col >= 0,Col < Size),
    sy('*', Size),
    _nextCol is Col + Size,
    letterS(TextWidth, TxtHgt, Size, Line, _nextCol).

letterS(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= Size, Line < 2 * Size),
    Col >= 1 * Size,
    Col < TextWidth,
    sy(' ', Size),
    _nextCol is Col + Size,
    letterS(TextWidth, TxtHgt, Size, Line, _nextCol).



letterS(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= TextWidth, Line < 4 * Size),(Col >= 2 * Size,Col < TextWidth),
    sy('*', Size),
    _nextCol is Col + Size,
    letterS(TextWidth, TxtHgt, Size, Line, _nextCol).

letterS(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= TextWidth, Line < 4 * Size),
    Col >= 0,
    Col < 2 * Size,
    sy(' ', Size),
    _nextCol is Col + Size,
    letterS(TextWidth, TxtHgt, Size, Line, _nextCol).



letterS(TextWidth, TxtHgt, Size, Line, Col) :-
    ((Line >= 0, Line < Size); (Line >= 2 * Size, Line < TextWidth); (Line >= 4 * Size, Line <TxtHgt)),
    Col < TextWidth,
    sy('*', Size),
    _nextCol is Col + Size,
    letterS(TextWidth, TxtHgt, Size, Line, _nextCol).


%-------------------------this is the function that writes letter u into the terminal

letterU(TextWidth, TxtHgt, Size, Line, TextWidth).
letterU(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= 0, Line < 4 * Size),
    (
        (Col >= 0,Col < Size);(Col >= 2 * Size,Col < TextWidth)
    ),
    sy('*', Size),
    _nextCol is Col + Size,
    letterU(TextWidth, TxtHgt, Size, Line, _nextCol).

letterU(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= 0, Line < 4 * Size),
    (Col >= 1 * Size, Col < 2 * Size),
    sy(' ', Size),
    _nextCol is Col + Size,
    letterU(TextWidth, TxtHgt, Size, Line, _nextCol).

letterU(TextWidth, TxtHgt, Size, Line, Col) :-
    (Line >= 4 * Size, Line < TxtHgt),
    Col < TextWidth,
    sy('*', Size),
    _nextCol is Col + Size,
    letterU(TextWidth, TxtHgt, Size, Line, _nextCol).