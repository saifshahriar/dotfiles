function lfcd --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
	cd "$(command lfub -print-last-dir $argv | sed 's/^.\{47\}//')"
end
