/*
 * Author: Saif Shahriar
 */

use std::io;
#[cfg(feature = "onpc")]
use std::time::Instant;

macro_rules! read_input {
    (ints) => {{
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        input
            .trim()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<i32>>()
    }};
    (int) => {{
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        input.trim().parse::<i32>().unwrap()
    }};
    (string) => {{
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        input.trim().to_string()
    }};
    (ints; $n:expr) => {{
        let mut matrix = Vec::new();
        for _ in 0..$n {
            matrix.push(read_input!(ints));
        }
        matrix
    }};
}

const TESTCASES: bool = true;
// let n = read_input!(int);                    // Reads a single integer
// let nums = read_input!(ints);                // Reads a line of space-separated integers into a Vec<i32>
// let s = read_input!(string);                 // Reads a single line of string
// let matrix = read_input!(ints; n as usize);  // Reads n lines of space-separated integers into a matrix

fn sol() -> usize {
    return 0;
}

fn main() {
    #[cfg(feature = "onpc")]
    let start_time = Instant::now();
    let testcases;
    if TESTCASES {
        testcases = read_input!(int);
    } else {
        testcases = 1;
    }
    for i in 1..=testcases {
        #[cfg(feature = "onpc")]
        print!("{}: ", i);
        if sol() != 0 {
            break;
        }
        #[cfg(feature = "onpc")]
        println!("__________________________");
    }
    #[cfg(feature = "onpc")]
    {
        let elapsed_time = start_time.elapsed().as_secs_f64();
        println!();
        println!("took {:.6} sec", elapsed_time);
        println!();
    }
}
