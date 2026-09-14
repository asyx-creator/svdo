use std::env;
use std::os::unix::process::CommandExt;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Использование: svdo <команда> [аргументы...]");
        std::process::exit(1);
    }

    let target_cmd = &args[1];
    let target_args = &args[2..];

    let err = Command::new(target_cmd)
        .args(target_args)
        .exec();

    eprintln!("svdo: не удалось запустить '{}': {}", target_cmd, err);
    std::process::exit(1);
}
