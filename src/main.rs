
#[derive(Copy, Clone, PartialEq, Debug)]
enum cell_state {
    Dead, Alive
}
use cell_state::*;
use std::cmp::PartialEq;

#[derive(Copy, Clone, PartialEq, Debug)]
pub struct Grid3([[cell_state; 3]; 3]);

fn main() {
}

#[derive(PartialEq, Debug)]
pub struct Game;

impl Game {
    fn next(cells: Grid3) -> Grid3 {
        Grid3([[Dead, Dead, Dead],
               [Dead, Dead, Dead],
               [Dead, Dead, Dead]])
    }
}

#[cfg(test)]
mod tests {
    use super::cell_state::*;
    use super::*;

    #[test]
    fn it_has_a_next_function() {
        let expected = Grid3([[Dead, Dead, Dead],[Dead, Dead, Dead],[Dead, Dead, Dead]]);
        let res = Game::next(expected);
        assert_eq!(res, expected)
    }
}
